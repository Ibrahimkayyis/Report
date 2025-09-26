import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/domain/repositories/auth_repository.dart';
import 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  /// Cek status login dari local storage
  Future<void> checkAuthStatus() async {
    emit(AuthLoading());
    try {
      final token = await authRepository.getSavedToken();
      if (token != null && token.isNotEmpty) {
        final role = await authRepository.getSavedRole();
        emit(AuthAuthenticated(token: token, role: role ?? 'user'));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  /// Set user authenticated (dipanggil setelah login sukses)
  Future<void> setAuthenticated(String token, {String role = 'user'}) async {
    await authRepository.saveToken(token);
    await authRepository.saveRole(role);
    emit(AuthAuthenticated(token: token, role: role));
  }

  /// Logout -> hapus token di local
  Future<void> logout() async {
    await authRepository.logout();
    print("✅ AuthCubit: logout dipanggil");
    emit(AuthUnauthenticated());
    print("✅ AuthCubit: emit AuthUnauthenticated");
  }
}
