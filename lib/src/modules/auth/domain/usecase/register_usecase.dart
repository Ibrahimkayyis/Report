import 'package:injectable/injectable.dart';
import 'package:report/src/modules/auth/domain/repositories/auth_repository.dart';

class RegisterParams {
  final String email;
  final String password;
  final String fullName;
  final String phoneNumber;
  final String nik;
  final String address;

  RegisterParams({
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNumber,
    required this.nik,
    required this.address,
  });
}

@injectable
class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<String> call(RegisterParams params) {
    return repository.register(
      email: params.email,
      password: params.password,
      fullName: params.fullName,
      phoneNumber: params.phoneNumber,
      nik: params.nik,
      address: params.address,
    );
  }
}