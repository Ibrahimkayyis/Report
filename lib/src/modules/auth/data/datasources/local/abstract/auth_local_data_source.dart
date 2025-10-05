abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();

  Future<void> saveRole(String role);
  Future<String?> getRole();
  Future<void> clear();
}