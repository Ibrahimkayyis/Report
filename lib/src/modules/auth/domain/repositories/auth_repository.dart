
abstract class AuthRepository {
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

  Future<String> login({required String email, required String password});

  Future<String?> getSavedToken();
  Future<void> saveToken(String token);

  Future<String?> getSavedRefreshToken();
  Future<void> saveRefreshToken(String refreshToken);

  Future<String?> getSavedRole();
  Future<void> saveRole(String role);

  Future<String> refreshAccessToken();

  Future<void> logout();
}
