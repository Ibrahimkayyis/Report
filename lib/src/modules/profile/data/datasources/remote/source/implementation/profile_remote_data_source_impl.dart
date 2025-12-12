import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/modules/auth/data/datasources/local/abstract/auth_local_data_source.dart';
import 'package:report/src/modules/profile/data/datasources/remote/mapper/profile_mapper.dart';
import 'package:report/src/modules/profile/data/datasources/remote/source/abstract/profile_remote_data_source.dart';
import 'package:report/src/modules/profile/domain/models/profile_model.dart';

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio dio;

  ProfileRemoteDataSourceImpl(this.dio);

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final authLocal = sl<AuthLocalDataSource>();
      final role = await authLocal.getRole();
      
      bool isInternalUser = false;
      String endpoint = '/me/masyarakat';

      if (role != null) {
        final r = role.toLowerCase();
        if (r == 'teknisi' || r == 'opd' || r == 'diskominfo' || r == 'pegawai' || r == 'admin_dinas') {
          isInternalUser = true;
          endpoint = '/me'; 
        }
      }

      AppLogger.i("📡 Fetching Profile ($role) -> Endpoint: $endpoint");

      final response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        // Data sukses diambil
        AppLogger.d("✅ Profile Data Raw: ${response.data}");

        if (isInternalUser) {
          // Response pegawai sekarang punya struktur {user: {...}, opd: {...}}
          // Mapper sudah disesuaikan untuk handle ini
          return ProfileMapper.fromInternalJson(response.data);
        } else {
          return ProfileMapper.fromMasyarakatJson(response.data);
        }
      } else {
        throw Exception('Failed to load profile: ${response.statusCode}');
      }
    } catch (e) {
      AppLogger.e("Gagal fetch profile", e);
      rethrow;
    }
  }

  @override
  Future<ProfileModel> updateProfile({
    String? fullName,
    String? phoneNumber,
    String? address,
    String? filePath,
  }) async {
    try {
      final formData = FormData();

      if (fullName != null) formData.fields.add(MapEntry('full_name', fullName));
      if (phoneNumber != null) formData.fields.add(MapEntry('phone_number', phoneNumber));
      if (address != null) formData.fields.add(MapEntry('address', address));

      if (filePath != null && filePath.isNotEmpty) {
        formData.files.add(MapEntry(
          'file',
          await MultipartFile.fromFile(filePath, filename: filePath.split('/').last),
        ));
      }

      AppLogger.i("📡 Updating Profile Masyarakat...");
      
      final response = await dio.put('/me/masyarakat', data: formData);

      if (response.statusCode == 200) {
        return ProfileMapper.fromMasyarakatJson(response.data);
      }
      
      throw Exception('Update failed: ${response.statusCode}');
    } catch (e) {
       AppLogger.e("Gagal update profile", e);
       rethrow;
    }
  }
}