import 'package:report/src/modules/profile/domain/models/profile_model.dart';

abstract class ProfileRepository {
  /// 🔹 Ambil data profil pengguna yang sedang login
  Future<ProfileModel> getProfile();

  /// 🔹 Update profil pengguna
  ///
  /// Field yang tidak ingin diubah boleh dikirim `null`
  Future<ProfileModel> updateProfile({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? birthDate,
    String? address,
    String? filePath,
  });
}
