import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/profile/data/datasources/remote/mapper/profile_mapper.dart';
import 'package:report/src/modules/profile/data/datasources/remote/source/abstract/profile_remote_data_source.dart';
import 'package:report/src/modules/profile/domain/models/profile_model.dart';

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio dio;

  ProfileRemoteDataSourceImpl(this.dio);

  @override
  Future<ProfileModel> getProfile() async {
    final response = await dio.get('/profile');

    if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
      return ProfileMapper.fromJson(response.data);
    }

    throw Exception('Gagal mengambil data profil');
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
    final formData = FormData();

    if (firstName != null) formData.fields.add(MapEntry('first_name', firstName));
    if (lastName != null) formData.fields.add(MapEntry('last_name', lastName));
    if (phoneNumber != null) formData.fields.add(MapEntry('phone_number', phoneNumber));
    if (birthDate != null) formData.fields.add(MapEntry('birth_date', birthDate));
    if (address != null) formData.fields.add(MapEntry('address', address));

    if (filePath != null && filePath.isNotEmpty) {
      formData.files.add(MapEntry(
        'file',
        await MultipartFile.fromFile(filePath, filename: filePath.split('/').last),
      ));
    }

    final response = await dio.put('/profile', data: formData);

    if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
      return ProfileMapper.fromJson(response.data);
    }

    throw Exception('Gagal memperbarui data profil');
  }
}
