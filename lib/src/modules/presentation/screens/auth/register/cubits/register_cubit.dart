import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/errors/failures_mapper.dart';
import 'package:report/src/modules/domain/usecase/register_usecase.dart';
import 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  Future<void> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    emit(RegisterLoading());

    try {
      final result = await registerUseCase(
        RegisterParams(
          email: email,
          firstName: firstName,
          lastName: lastName,
          password: password,
        ),
      );
      emit(RegisterSuccess(result));
    } catch (e) {
      emit(RegisterFailure(mapFailureToMessage(e)));
    }
  }
}
