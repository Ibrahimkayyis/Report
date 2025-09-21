abstract class AuthRemoteDataSource {
  Future<String> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    String role,
  });

  Future<String> login({
    required String email,
    required String password,
  });
}
