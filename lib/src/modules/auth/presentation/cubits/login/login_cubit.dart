import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/errors/failures_mapper.dart';
import 'package:report/src/modules/auth/domain/usecase/login_usecase.dart';
import 'package:report/src/modules/auth/domain/repositories/auth_repository.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  final AuthRepository authRepository;

  LoginCubit(this.loginUseCase, this.authRepository) : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      // 🔹 Jalankan use case login (akan return token)
      final token = await loginUseCase(
        LoginParams(email: email, password: password),
      );

      // 🔹 Ambil role yang disimpan (karena repository menyimpannya di login)
      final role = await authRepository.getSavedRole() ?? 'masyarakat';

      // 🔹 Emit LoginSuccess dengan token + role
      emit(LoginSuccess(token, role));
    } catch (e) {
      emit(LoginFailure(mapFailureToMessage(e)));
    }
  }
}
