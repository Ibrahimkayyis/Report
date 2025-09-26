// lib/src/modules/data/repositories_impl/auth_repository_impl.dart

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/errors/failures.dart';
import 'package:report/src/modules/data/datasources/local/abstract/auth_local_data_source.dart';
import 'package:report/src/modules/data/datasources/remote/source/abstract/auth_remote_data_source.dart';
import 'package:report/src/modules/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final AuthLocalDataSource local;

  AuthRepositoryImpl({required this.remote, required this.local});

  @override
  Future<String> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    String role = 'user',
  }) async {
    try {
      return await remote.register(
        email: email,
        firstName: firstName,
        lastName: lastName,
        password: password,
        role: role,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 422) {
          final errorMsg = _extractValidationMessage(e.response?.data);
          throw ValidationFailure(errorMsg);
        }
        throw ServerFailure(e.response?.statusMessage ?? 'Server error');
      }
      throw NetworkFailure(e.message ?? 'Network error');
    }
  }

  @override
  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remote.login(email: email, password: password);

      final token = response['access_token'] as String;
      final role = response['user']?['role'] as String? ?? 'user';

      // Simpan ke local
      await saveToken(token);
      await saveRole(role);

      return token;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 422) {
          final errorMsg = _extractValidationMessage(e.response?.data);
          throw ValidationFailure(errorMsg);
        }
        throw ServerFailure(e.response?.statusMessage ?? 'Server error');
      }
      throw NetworkFailure(e.message ?? 'Network error');
    }
  }

  @override
  Future<String?> getSavedToken() => local.getToken();

  @override
  Future<String?> getSavedRole() => local.getRole();

  @override
  Future<void> saveToken(String token) => local.saveToken(token);

  @override
  Future<void> saveRole(String role) => local.saveRole(role);

  @override
  Future<void> logout() async {
    await local.clear();
  }

  /// Helper untuk ambil pesan error dari format API
  String _extractValidationMessage(dynamic data) {
    try {
      if (data is Map<String, dynamic>) {
        final details = data['detail'];
        if (details is List && details.isNotEmpty) {
          final msg = details.first['msg'];
          if (msg is String) return msg;
        }
      }
    } catch (_) {}
    return 'Validation error';
  }
}
