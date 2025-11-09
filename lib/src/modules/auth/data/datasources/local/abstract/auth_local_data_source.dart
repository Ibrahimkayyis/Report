abstract class AuthLocalDataSource {
  // Access Token
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();

  // Refresh Token - NEW
  Future<void> saveRefreshToken(String refreshToken);
  Future<String?> getRefreshToken();
  Future<void> deleteRefreshToken();

  // User Role
  Future<void> saveRole(String role);
  Future<String?> getRole();

  // Clear all auth data
  Future<void> clear();
}