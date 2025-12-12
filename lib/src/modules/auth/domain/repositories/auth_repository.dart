abstract class AuthRepository {
  Future<String> register({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
    required String nik,
    required String address,
  });

  Future<String> login({required String email, required String password});

  // ... sisa method auth (getSavedToken dll) tetap sama ...
  Future<String?> getSavedToken();
  Future<void> saveToken(String token);
  Future<String?> getSavedRefreshToken();
  Future<void> saveRefreshToken(String refreshToken);
  Future<String?> getSavedRole();
  Future<void> saveRole(String role);
  Future<String> refreshAccessToken();
  Future<void> logout();
}