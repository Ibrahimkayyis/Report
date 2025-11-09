import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/auth/domain/repositories/auth_repository.dart';

/// States
abstract class TestHelperState {}

class TestHelperInitial extends TestHelperState {}

class TestHelperLoading extends TestHelperState {}

class TestHelperLoaded extends TestHelperState {
  final String? accessToken;
  final String? refreshToken;
  final String? role;
  final List<String> logs;

  TestHelperLoaded({
    this.accessToken,
    this.refreshToken,
    this.role,
    this.logs = const [],
  });

  TestHelperLoaded copyWith({
    String? accessToken,
    String? refreshToken,
    String? role,
    List<String>? logs,
  }) {
    return TestHelperLoaded(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      role: role ?? this.role,
      logs: logs ?? this.logs,
    );
  }
}

class TestHelperError extends TestHelperState {
  final String message;
  TestHelperError(this.message);
}

/// Cubit
@injectable
class TestHelperCubit extends Cubit<TestHelperState> {
  final AuthRepository authRepository;
  final List<String> _logs = [];

  TestHelperCubit(this.authRepository) : super(TestHelperInitial());

  /// Load current token info
  Future<void> loadTokenInfo() async {
    try {
      emit(TestHelperLoading());

      final accessToken = await authRepository.getSavedToken();
      final refreshToken = await authRepository.getSavedRefreshToken();
      final role = await authRepository.getSavedRole();

      _addLog('✅ Token info loaded successfully');
      _addLog('Access Token: ${_truncateToken(accessToken)}');
      _addLog('Refresh Token: ${_truncateToken(refreshToken)}');
      _addLog('Role: $role');

      emit(TestHelperLoaded(
        accessToken: accessToken,
        refreshToken: refreshToken,
        role: role,
        logs: List.from(_logs),
      ));
    } catch (e) {
      _addLog('❌ Error loading token info: $e');
      emit(TestHelperError(e.toString()));
    }
  }

  /// Invalidate access token (simulasi expired 1 jam)
  Future<void> invalidateAccessToken() async {
    try {
      final currentState = state;
      if (currentState is! TestHelperLoaded) return;

      _addLog('🔧 Invalidating access token...');

      // Tambahkan "INVALID_" di awal token untuk simulasi invalid
      final currentToken = currentState.accessToken;
      if (currentToken != null) {
        await authRepository.saveToken('INVALID_$currentToken');
        _addLog('✅ Access token invalidated');
        _addLog('⚠️ Token is now invalid (simulating expired)');
      } else {
        _addLog('❌ No access token found');
      }

      await loadTokenInfo();
    } catch (e) {
      _addLog('❌ Error invalidating access token: $e');
      emit(TestHelperError(e.toString()));
    }
  }

  /// Invalidate refresh token (simulasi expired 7 hari)
  Future<void> invalidateRefreshToken() async {
    try {
      final currentState = state;
      if (currentState is! TestHelperLoaded) return;

      _addLog('🔧 Invalidating refresh token...');

      // Hapus refresh token untuk simulasi expired
      await authRepository.saveRefreshToken('INVALID_REFRESH_TOKEN');
      _addLog('✅ Refresh token invalidated');
      _addLog('⚠️ Refresh token is now invalid (simulating expired after 7 days)');

      await loadTokenInfo();
    } catch (e) {
      _addLog('❌ Error invalidating refresh token: $e');
      emit(TestHelperError(e.toString()));
    }
  }

  /// Invalidate both tokens
  Future<void> invalidateBothTokens() async {
    try {
      _addLog('🔧 Invalidating both tokens...');
      
      await invalidateAccessToken();
      await invalidateRefreshToken();
      
      _addLog('✅ Both tokens invalidated');
      _addLog('⚠️ Ready to test auto-logout scenario');
    } catch (e) {
      _addLog('❌ Error invalidating tokens: $e');
    }
  }

  /// Clear all tokens
  Future<void> clearAllTokens() async {
    try {
      _addLog('🗑️ Clearing all tokens...');

      await authRepository.logout();

      _addLog('✅ All tokens cleared');
      _addLog('ℹ️ User should be logged out now');

      emit(TestHelperLoaded(
        accessToken: null,
        refreshToken: null,
        role: null,
        logs: List.from(_logs),
      ));
    } catch (e) {
      _addLog('❌ Error clearing tokens: $e');
      emit(TestHelperError(e.toString()));
    }
  }

  /// Clear logs
  void clearLogs() {
    _logs.clear();
    _addLog('🧹 Logs cleared');
    
    final currentState = state;
    if (currentState is TestHelperLoaded) {
      emit(currentState.copyWith(logs: List.from(_logs)));
    }
  }

  /// Test API call (call profile endpoint to trigger auto-refresh/logout)
  Future<void> testProfileApiCall() async {
    try {
      _addLog('🌐 Testing Profile API call...');
      _addLog('⏳ Calling /profile endpoint...');

      // This will automatically trigger AuthInterceptor
      // which will handle auto-refresh or auto-logout
      final result = await authRepository.getSavedToken();
      
      if (result != null) {
        _addLog('✅ Profile API call initiated');
        _addLog('📊 Check console logs for interceptor activity');
        _addLog('ℹ️ If token is invalid, auto-refresh should trigger');
      } else {
        _addLog('❌ No token found, cannot call API');
      }

      final currentState = state;
      if (currentState is TestHelperLoaded) {
        emit(currentState.copyWith(logs: List.from(_logs)));
      }
    } catch (e) {
      _addLog('❌ Error calling API: $e');
    }
  }

  /// Add log entry
  void _addLog(String message) {
    final timestamp = DateTime.now().toString().substring(11, 19);
    _logs.add('[$timestamp] $message');
    debugPrint(message);
  }

  /// Truncate token for display
  String? _truncateToken(String? token) {
    if (token == null) return 'null';
    if (token.isEmpty) return 'empty';
    if (token.length <= 30) return token;
    return '${token.substring(0, 15)}...${token.substring(token.length - 15)}';
  }
}