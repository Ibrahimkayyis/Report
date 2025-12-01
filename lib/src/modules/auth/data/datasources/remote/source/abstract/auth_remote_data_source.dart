import 'package:report/src/modules/auth/domain/enums/user_type.dart';

abstract class AuthRemoteDataSource {
  Future<String> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    String? phoneNumber,
    String? birthDate,
    String? address,
    String role,
  });

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
    required UserType type,
  });

  Future<String> refreshToken({
    required String refreshToken,
  });
}