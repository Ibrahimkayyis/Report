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

  Future<String?> getSavedToken();
  Future<String?> getSavedRole();

  Future<void> saveToken(String token);
  Future<void> saveRole(String role);
  
  Future<void> logout();
}
