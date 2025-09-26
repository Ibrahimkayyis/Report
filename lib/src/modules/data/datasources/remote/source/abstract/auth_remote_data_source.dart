// lib/src/modules/data/datasources/remote/source/abstract/auth_remote_data_source.dart

abstract class AuthRemoteDataSource {
  Future<String> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    String role,
  });

  Future<Map<String, dynamic>> login({  // ⬅️ return Map
    required String email,
    required String password,
  });
}
