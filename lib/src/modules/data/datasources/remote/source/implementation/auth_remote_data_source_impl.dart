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
    final resp = await dio.post(
      '/register',
      data: {
        "email": email,
        "last_name": lastName,
        "first_name": firstName,
        "password": password,
        "role": role,
      },
    );

    if (resp.statusCode == 200) {
      if (resp.data is String) return resp.data;
      if (resp.data is Map && resp.data['message'] != null) {
        return resp.data['message'];
      }
      return resp.data.toString();
    }
    throw Exception('Register failed: ${resp.statusCode}');
  }

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final resp = await dio.post(
      '/login',
      data: {
        "email": email,
        "password": password,
      },
    );

    if (resp.statusCode == 200) {
      if (resp.data is Map<String, dynamic>) {
        return resp.data as Map<String, dynamic>;
      }
      throw Exception("Unexpected login response format");
    }
    throw Exception('Login failed: ${resp.statusCode}');
  }
}
