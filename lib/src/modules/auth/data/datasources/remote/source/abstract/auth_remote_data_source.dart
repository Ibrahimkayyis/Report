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
  });

  /// Refresh access token menggunakan refresh token
  /// 
  /// Endpoint: POST /refresh?refresh_token=xxx
  /// Returns: String (new access token)
  Future<String> refreshToken({
    required String refreshToken,
  });
}