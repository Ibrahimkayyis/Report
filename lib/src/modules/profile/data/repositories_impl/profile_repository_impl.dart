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
    String? birthDate,
    String? address,
    String? filePath,
  }) async {
    try {
      return await remoteDataSource.updateProfile(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        birthDate: birthDate,
        address: address,
        filePath: filePath,
      );
    } catch (e) {
      throw Exception('Gagal memperbarui profil: $e');
    }
  }
}
