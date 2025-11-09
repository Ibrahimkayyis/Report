abstract class AuthRepository {
  Future<String> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    String? phoneNumber,
    String? birthDate,
    String? address,
    String role, // default role jika diperlukan
  });

  Future<String> login({
    required String email,
    required String password,
  });

  // Access Token
  Future<String?> getSavedToken();
  Future<void> saveToken(String token);

  // Refresh Token - NEW
  Future<String?> getSavedRefreshToken();
  Future<void> saveRefreshToken(String refreshToken);

  // User Role
  Future<String?> getSavedRole();
  Future<void> saveRole(String role);

  /// Refresh access token menggunakan refresh token yang tersimpan
  /// Returns: new access token
  /// Throws: Failure jika refresh gagal (refresh token expired, network error, etc)
  Future<String> refreshAccessToken();

  Future<void> logout();
}