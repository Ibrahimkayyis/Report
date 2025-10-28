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
      // role mungkin tidak diperlukan dari UI, backend default 'masyarakat'
      // tambahkan field opsional hanya jika tidak null
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
    // include role only if explicitly provided and non-empty
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
