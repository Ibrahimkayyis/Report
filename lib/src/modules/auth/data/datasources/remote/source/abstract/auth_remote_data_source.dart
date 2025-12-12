import 'package:report/src/modules/auth/domain/enums/user_type.dart';

abstract class AuthRemoteDataSource {
  Future<String> register({
    required String email,
    required String password,
    required String fullName,    // Baru
    required String phoneNumber, // Baru
    required String nik,         // Baru
    required String address,     // Baru
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