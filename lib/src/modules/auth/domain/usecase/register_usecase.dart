import 'package:injectable/injectable.dart';
import 'package:report/src/modules/auth/domain/repositories/auth_repository.dart';

class RegisterParams {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String role;

  RegisterParams({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    this.role = 'user',
  });
}

@injectable
class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<String> call(RegisterParams params) {
    return repository.register(
      email: params.email,
      firstName: params.firstName,
      lastName: params.lastName,
      password: params.password,
      role: params.role,
    );
  }
}
