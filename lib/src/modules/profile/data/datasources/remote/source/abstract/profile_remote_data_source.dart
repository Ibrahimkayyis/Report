import 'package:report/src/modules/profile/domain/models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  /// 🔹 Ambil data profil user yang sedang login (GET /profile)
  Future<ProfileModel> getProfile();

  /// 🔹 Update profil user (PUT /profile)
  Future<ProfileModel> updateProfile({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? birthDate,
    String? address,
    String? filePath, // opsional, untuk upload foto profil
  });
}
