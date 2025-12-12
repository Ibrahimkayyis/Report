import 'package:injectable/injectable.dart';
import 'package:report/src/modules/profile/data/datasources/remote/source/abstract/profile_remote_data_source.dart';
import 'package:report/src/modules/profile/domain/models/profile_model.dart';
import 'package:report/src/modules/profile/domain/repositories/profile_repository.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<ProfileModel> getProfile() async {
    try {
      return await remoteDataSource.getProfile();
    } catch (e) {
      throw Exception('Gagal memuat profil: $e');
    }
  }

  @override
  Future<ProfileModel> updateProfile({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? birthDate, // API tidak support update birthDate, tapi kita terima paramnya (ignore)
    String? address,
    String? filePath,
  }) async {
    try {
      // Gabungkan Name
      String? fullName;
      if (firstName != null || lastName != null) {
         fullName = "${firstName ?? ''} ${lastName ?? ''}".trim();
      }

      return await remoteDataSource.updateProfile(
        fullName: fullName,
        phoneNumber: phoneNumber,
        address: address,
        filePath: filePath,
        // birthDate diabaikan karena tidak ada param-nya di API Update Masyarakat
      );
    } catch (e) {
      throw Exception('Gagal memperbarui profil: $e');
    }
  }
}