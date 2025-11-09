import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:report/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_cubit.dart';

/// Custom Dio Interceptor untuk handle auto-refresh token
/// 
/// Fitur:
/// - Detect error 401 (Unauthorized)
/// - Auto-call refresh token API
/// - Retry request yang gagal dengan token baru
/// - Handle concurrent requests (mencegah multiple refresh calls)
/// - Auto logout jika refresh token juga expired
class AuthInterceptor extends Interceptor {
  final AuthRepository authRepository;
  final AuthCubit authCubit; // ← NEW: Inject AuthCubit
  final Dio dio;

  /// Lock untuk mencegah multiple refresh token calls secara bersamaan
  bool _isRefreshing = false;

  /// Queue untuk menyimpan request yang pending saat refresh token
  final List<_RequestQueueItem> _requestQueue = [];

  AuthInterceptor({
    required this.authRepository,
    required this.authCubit, // ← NEW
    required this.dio,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      // Ambil token dari local storage
      final token = await authRepository.getSavedToken();

      if (token != null && token.isNotEmpty) {
        // Tambahkan Authorization header
        options.headers['Authorization'] = 'Bearer $token';
        debugPrint('🟢 [AuthInterceptor] Token ditambahkan ke request: ${options.path}');
      } else {
        debugPrint('⚠️ [AuthInterceptor] Token kosong untuk request: ${options.path}');
      }
    } catch (e) {
      debugPrint('❌ [AuthInterceptor] Error saat menambahkan token: $e');
    }

    return handler.next(options);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Hanya handle error 401 (Unauthorized) atau 403 (Forbidden)
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      debugPrint('🔴 [AuthInterceptor] Detected ${err.response?.statusCode} error pada: ${err.requestOptions.path}');

      // Special handling untuk refresh endpoint yang gagal
      if (err.requestOptions.path.contains('/refresh')) {
        debugPrint('⚠️ [AuthInterceptor] Refresh endpoint failed - refresh token expired!');
        debugPrint('🚪 [AuthInterceptor] Triggering logout via AuthCubit...');
        
        // Trigger logout via AuthCubit untuk redirect ke login
        await authCubit.logout();
        
        debugPrint('✅ [AuthInterceptor] Logout triggered successfully');
        return handler.next(err);
      }

      // Jangan retry untuk endpoint login dan register
      if (err.requestOptions.path.contains('/login') || 
          err.requestOptions.path.contains('/register')) {
        debugPrint('⚠️ [AuthInterceptor] Skip retry untuk login/register endpoint');
        return handler.next(err);
      }

      // Coba refresh token dan retry request
      try {
        final newToken = await _handleTokenRefresh();

        if (newToken != null) {
          // Retry original request dengan token baru
          debugPrint('🔄 [AuthInterceptor] Retrying request dengan token baru...');
          final response = await _retryRequest(err.requestOptions, newToken);
          return handler.resolve(response);
        } else {
          debugPrint('❌ [AuthInterceptor] Gagal mendapatkan token baru');
          return handler.next(err);
        }
      } catch (e) {
        debugPrint('❌ [AuthInterceptor] Error saat refresh token: $e');
        return handler.next(err);
      }
    }

    // Untuk error selain 401/403, lanjutkan normal
    return handler.next(err);
  }

  /// Handle refresh token dengan lock mechanism
  Future<String?> _handleTokenRefresh() async {
    // Jika sudah ada proses refresh yang berjalan, tunggu
    if (_isRefreshing) {
      debugPrint('⏳ [AuthInterceptor] Refresh token sedang berjalan, menunggu...');
      return _waitForRefresh();
    }

    // Set lock
    _isRefreshing = true;
    debugPrint('🔒 [AuthInterceptor] Lock acquired, mulai refresh token...');

    try {
      // Call refresh token API
      final newToken = await authRepository.refreshAccessToken();
      
      debugPrint('✅ [AuthInterceptor] Refresh token berhasil!');
      
      // Release lock dan notify waiting requests
      _isRefreshing = false;
      _notifyQueuedRequests(newToken);
      
      return newToken;
    } on DioException catch (e) {
      debugPrint('❌ [AuthInterceptor] Refresh token gagal: ${e.response?.statusCode}');
      
      // Release lock
      _isRefreshing = false;
      _notifyQueuedRequests(null);

      // ✅ NEW: Jika refresh token expired (401/403), trigger logout via AuthCubit
      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
        debugPrint('⚠️ [AuthInterceptor] Refresh token expired!');
        debugPrint('🚪 [AuthInterceptor] Triggering logout via AuthCubit...');
        
        // Call AuthCubit logout yang akan:
        // 1. Clear local storage
        // 2. Emit AuthUnauthenticated
        // 3. Trigger navigation ke login screen
        await authCubit.logout();
        
        debugPrint('✅ [AuthInterceptor] Logout triggered successfully');
      }
      
      return null;
    } catch (e) {
      debugPrint('❌ [AuthInterceptor] Error tidak terduga: $e');
      
      // Release lock
      _isRefreshing = false;
      _notifyQueuedRequests(null);
      
      return null;
    }
  }

  /// Tunggu sampai refresh token selesai (untuk concurrent requests)
  Future<String?> _waitForRefresh() async {
    final queueItem = _RequestQueueItem.withCompleter();
    _requestQueue.add(queueItem);
    return queueItem.future;
  }

  /// Notify semua request yang menunggu dengan token baru
  void _notifyQueuedRequests(String? token) {
    debugPrint('📢 [AuthInterceptor] Notifying ${_requestQueue.length} queued requests');
    
    for (var item in _requestQueue) {
      item.complete(token);
    }
    
    _requestQueue.clear();
  }

  /// Retry request yang gagal dengan token baru
  Future<Response> _retryRequest(
    RequestOptions options,
    String newToken,
  ) async {
    // Update Authorization header dengan token baru
    options.headers['Authorization'] = 'Bearer $newToken';

    debugPrint('🔄 [AuthInterceptor] Retrying: ${options.method} ${options.path}');

    // Buat request baru dengan options yang sama
    final response = await dio.request(
      options.path,
      data: options.data,
      queryParameters: options.queryParameters,
      options: Options(
        method: options.method,
        headers: options.headers,
        contentType: options.contentType,
        responseType: options.responseType,
        receiveTimeout: options.receiveTimeout,
        sendTimeout: options.sendTimeout,
      ),
    );

    return response;
  }
}

/// Helper class untuk queue concurrent requests
class _RequestQueueItem {
  late final Future<String?> future;
  late final void Function(String?) complete;

  _RequestQueueItem();

  factory _RequestQueueItem.withCompleter() {
    final item = _RequestQueueItem();
    String? tokenResult;
    bool isCompleted = false;

    // Create future that waits for complete() to be called
    item.future = Future(() async {
      // Wait max 10 seconds for refresh to complete
      final timeout = DateTime.now().add(const Duration(seconds: 10));
      
      while (!isCompleted && DateTime.now().isBefore(timeout)) {
        await Future.delayed(const Duration(milliseconds: 100));
      }
      
      return tokenResult;
    });

    // Create complete function
    item.complete = (String? token) {
      tokenResult = token;
      isCompleted = true;
    };

    return item;
  }
}