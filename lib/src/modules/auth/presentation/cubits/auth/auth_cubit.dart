import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/auth/domain/repositories/auth_repository.dart';
import 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> checkAuthStatus() async {
    emit(AuthLoading());
    try {
      AppLogger.d("AuthCubit: checking saved token...");

      final token = await authRepository.getSavedToken();

      if (token != null && token.isNotEmpty) {
        final role = await authRepository.getSavedRole();
        AppLogger.i("AuthCubit: token ditemukan, role: $role");

        emit(AuthAuthenticated(token: token, role: role ?? 'user'));
      } else {
        AppLogger.w("AuthCubit: token kosong, user belum login");
        emit(AuthUnauthenticated());
      }
    } catch (e, st) {
      AppLogger.e("AuthCubit: gagal membaca token", e, st);
      emit(AuthError(e.toString()));
    }
  }

  Future<void> setAuthenticated(String token, {String role = 'user'}) async {
    AppLogger.i("AuthCubit: menyimpan token + role $role");

    await authRepository.saveToken(token);
    await authRepository.saveRole(role);

    emit(AuthAuthenticated(token: token, role: role));
  }

  Future<void> logout() async {
    await authRepository.logout();
    AppLogger.i("🔐 AuthCubit: logout dipanggil");

    emit(AuthUnauthenticated());
    AppLogger.i("🔐 AuthCubit: emit AuthUnauthenticated");
  }
}
