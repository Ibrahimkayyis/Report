import 'package:dio/dio.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_cubit.dart';

class AuthInterceptor extends Interceptor {
  final AuthRepository authRepository;
  final AuthCubit authCubit;
  final Dio dio;

  bool _isRefreshing = false;
  final List<_RequestQueueItem> _requestQueue = [];

  AuthInterceptor({
    required this.authRepository,
    required this.authCubit,
    required this.dio,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = await authRepository.getSavedToken();

      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
        AppLogger.d('🟢 [AuthInterceptor] Token ditambahkan ke request: ${options.path}');
      } else {
        AppLogger.w('⚠️ [AuthInterceptor] Token kosong untuk request: ${options.path}');
      }
    } catch (e, st) {
      AppLogger.e('❌ [AuthInterceptor] Error saat menambahkan token', e, st);
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final code = err.response?.statusCode;
    final path = err.requestOptions.path;

    if (code == 401 || code == 403) {
      AppLogger.w('🔴 [AuthInterceptor] Detected $code pada: $path');

      if (path.contains('/refresh')) {
        AppLogger.w('⚠️ Refresh token endpoint gagal → kemungkinan refresh token expired.');
        AppLogger.i('🚪 Trigger logout via AuthCubit...');
        await authCubit.logout();
        return handler.next(err);
      }

      if (path.contains('/login') || path.contains('/register')) {
        AppLogger.w('⚠️ Skip retry untuk endpoint auth (login/register)');
        return handler.next(err);
      }

      try {
        final newToken = await _handleTokenRefresh();

        if (newToken != null) {
          AppLogger.i('🔄 Retrying request dengan token baru...');
          final newResponse = await _retryRequest(err.requestOptions, newToken);
          return handler.resolve(newResponse);
        } else {
          AppLogger.e('❌ Tidak berhasil mendapat token baru');
        }
      } catch (e, st) {
        AppLogger.e('❌ Error saat refresh token', e, st);
      }
    }

    return handler.next(err);
  }

  Future<String?> _handleTokenRefresh() async {
    if (_isRefreshing) {
      AppLogger.d('⏳ Refresh token sedang berjalan, menunggu...');
      return _waitForRefresh();
    }

    _isRefreshing = true;
    AppLogger.d('🔒 Lock acquired → mulai refresh token');

    try {
      final newToken = await authRepository.refreshAccessToken();

      AppLogger.i('✅ Refresh token berhasil!');

      _isRefreshing = false;
      _notifyQueuedRequests(newToken);

      return newToken;
    } on DioException catch (e, st) {
      final status = e.response?.statusCode;
      AppLogger.e('❌ Refresh token gagal (status: $status)', e, st);

      _isRefreshing = false;
      _notifyQueuedRequests(null);

      if (status == 401 || status == 403) {
        AppLogger.w('⚠️ Refresh token expired → logout user');
        await authCubit.logout();
      }

      return null;
    } catch (e, st) {
      AppLogger.e('❌ Error tidak terduga saat refresh token', e, st);

      _isRefreshing = false;
      _notifyQueuedRequests(null);
      return null;
    }
  }

  Future<String?> _waitForRefresh() async {
    final item = _RequestQueueItem.withCompleter();
    _requestQueue.add(item);
    return item.future;
  }

  void _notifyQueuedRequests(String? token) {
    AppLogger.d('📢 Notifying ${_requestQueue.length} queued requests...');
    for (var item in _requestQueue) {
      item.complete(token);
    }
    _requestQueue.clear();
  }

  Future<Response> _retryRequest(RequestOptions options, String newToken) async {
    options.headers['Authorization'] = 'Bearer $newToken';

    AppLogger.d('🔄 Retrying request: ${options.method} ${options.path}');

    return dio.request(
      options.path,
      data: options.data,
      queryParameters: options.queryParameters,
      options: Options(
        method: options.method,
        headers: options.headers,
        responseType: options.responseType,
        contentType: options.contentType,
        sendTimeout: options.sendTimeout,
        receiveTimeout: options.receiveTimeout,
      ),
    );
  }
}

class _RequestQueueItem {
  late final Future<String?> future;
  late final void Function(String?) complete;

  _RequestQueueItem();

  factory _RequestQueueItem.withCompleter() {
    final item = _RequestQueueItem();

    String? token;
    bool done = false;

    item.future = Future(() async {
      final timeout = DateTime.now().add(const Duration(seconds: 10));

      while (!done && DateTime.now().isBefore(timeout)) {
        await Future.delayed(const Duration(milliseconds: 100));
      }
      return token;
    });

    item.complete = (String? value) {
      token = value;
      done = true;
    };

    return item;
  }
}
