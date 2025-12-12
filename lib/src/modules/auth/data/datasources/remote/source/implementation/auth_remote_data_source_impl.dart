import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/auth/domain/enums/user_type.dart';
import '../abstract/auth_remote_data_source.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  // Hapus 'ariseDio'
  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<String> register({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
    required String nik,
    required String address,
  }) async {
    final Map<String, dynamic> body = {
      "email": email,
      "password": password,
      "full_name": fullName,
      "phone_number": phoneNumber,
      "nik": nik,
      "address": address,
    };

    // Endpoint sesuai dokumentasi: /register/masyarakat
    final resp = await dio.post(
      '/register/masyarakat',
      data: body,
    );

    if (resp.statusCode == 200) {
      // Backend mengembalikan token langsung
      if (resp.data is Map && resp.data['access_token'] != null) {
        return resp.data['access_token'];
      }
      return "Registration Successful";
    }

    throw Exception('Register failed: ${resp.statusCode}');
  }

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
    required UserType type,
  }) async {
    Response resp;

    if (type == UserType.employee) {
      // Endpoint SSO (Pegawai/Teknisi)
      // Body param: "login"
      resp = await dio.post(
        '/login/sso',
        data: {
          "login": email, 
          "password": password,
        },
      );
    } else {
      // Endpoint Masyarakat
      // Body param: "email"
      resp = await dio.post(
        '/login/masyarakat',
        data: {
          "email": email,
          "password": password,
        },
      );
    }

    if (resp.statusCode == 200) {
      if (resp.data is Map<String, dynamic>) {
        return resp.data as Map<String, dynamic>;
      }
      throw Exception("Unexpected login response format");
    }

    throw Exception('Login failed: ${resp.statusCode}');
  }

  @override
  Future<String> refreshToken({
    required String refreshToken,
  }) async {
    final resp = await dio.post(
      '/refresh',
      queryParameters: {
        'refresh_token': refreshToken,
      },
    );

    if (resp.statusCode == 200) {
      if (resp.data is String) return resp.data as String;
      if (resp.data is Map<String, dynamic>) {
        if (resp.data['access_token'] != null) {
          return resp.data['access_token'] as String;
        }
      }
      throw Exception("Unexpected refresh token response format");
    }
    throw Exception('Refresh token failed: ${resp.statusCode}');
  }
}