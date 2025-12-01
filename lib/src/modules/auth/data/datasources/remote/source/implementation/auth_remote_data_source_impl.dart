import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/auth/domain/enums/user_type.dart';
import '../abstract/auth_remote_data_source.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;      // Untuk Masyarakat (Service Desk)
  final Dio ariseDio; // Untuk Pegawai/Teknisi (Arise App) - RENAME

  // Inject ariseDio
  AuthRemoteDataSourceImpl(
    this.dio,
    @Named('ariseDio') this.ariseDio, // Update @Named
  );

  @override
  Future<String> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    String? phoneNumber,
    String? birthDate,
    String? address,
    String role = 'masyarakat',
  }) async {
    final Map<String, dynamic> body = {
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "password": password,
    };

    if (phoneNumber != null && phoneNumber.isNotEmpty) {
      body["phone_number"] = phoneNumber;
    }
    if (birthDate != null && birthDate.isNotEmpty) {
      body["birth_date"] = birthDate;
    }
    if (address != null && address.isNotEmpty) {
      body["address"] = address;
    }
    if (role.isNotEmpty) {
      body["role"] = role;
    }

    final resp = await dio.post(
      '/register',
      data: body,
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
    required UserType type,
  }) async {
    Response resp;

    if (type == UserType.employee) {
      // ==========================================================
      // FLOW PEGAWAI / ARISE APP
      // ==========================================================
      resp = await ariseDio.post( // Panggil ariseDio
        '/api/login',
        data: {
          "login": email, 
          "password": password,
        },
      );
    } else {
      // ==========================================================
      // FLOW MASYARAKAT / SERVICE DESK
      // ==========================================================
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
      if (resp.data is String) {
        return resp.data as String;
      }
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