import 'package:report/src/modules/profile/domain/models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  /// 🔹 Ambil data profil user yang sedang login
  Future<ProfileModel> getProfile();

  /// 🔹 Update profil user (PUT /me/masyarakat)
  Future<ProfileModel> updateProfile({
    String? fullName,    // API meminta full_name
    String? phoneNumber,
    String? address,
    String? filePath,    // foto profil
  });

  Future<bool> deleteProfilePicture();
}