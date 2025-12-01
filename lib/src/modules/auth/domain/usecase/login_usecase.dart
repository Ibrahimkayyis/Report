import 'package:injectable/injectable.dart';
import 'package:report/src/modules/auth/domain/repositories/auth_repository.dart';

class LoginParams {
  final String email;
  final String password;
  // Hapus UserType dari sini

  LoginParams({required this.email, required this.password});
}

@injectable
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<String> call(LoginParams params) {
    return repository.login(
      email: params.email,
      password: params.password,
    );
  }
}