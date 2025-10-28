import 'package:injectable/injectable.dart';
import 'package:report/src/modules/auth/domain/repositories/auth_repository.dart';

class RegisterParams {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String role;
  final String? phoneNumber;
  final String? birthDate;
  final String? address;

  RegisterParams({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    this.role = 'masyarakat',
    this.phoneNumber,
    this.birthDate,
    this.address,
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
      phoneNumber: params.phoneNumber,
      birthDate: params.birthDate,
      address: params.address,
      role: params.role,
    );
  }
}
