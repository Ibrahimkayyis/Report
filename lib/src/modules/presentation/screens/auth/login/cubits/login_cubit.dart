import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/domain/usecase/login_usecase.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      final result = await loginUseCase(
        LoginParams(email: email, password: password),
      );
      emit(LoginSuccess(result));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
