import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../abstract/auth_remote_data_source.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<String> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    String role = 'user',
  }) async {
    try {
      final resp = await dio.post(
        '/register', // pakai relative path
        data: {
          "email": email,
          "last_name": lastName,
          "first_name": firstName,
          "password": password,
          "role": role,
        },
      );

      if (resp.statusCode == 200) {
        return resp.data is String ? resp.data as String : resp.data.toString();
      }
      throw Exception('Unexpected status code: ${resp.statusCode}');
    } on DioException catch (e) {
      // biarkan repository yang handle lebih detail
      throw Exception(e.response?.data ?? e.message ?? 'Register request failed');
    }
  }

  @override
  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final resp = await dio.post(
        '/login', // pakai relative path
        data: {
          "email": email,
          "password": password,
        },
      );

      if (resp.statusCode == 200) {
        return resp.data is String ? resp.data as String : resp.data.toString();
      }
      throw Exception('Unexpected status code: ${resp.statusCode}');
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? e.message ?? 'Login request failed');
    }
  }
}
