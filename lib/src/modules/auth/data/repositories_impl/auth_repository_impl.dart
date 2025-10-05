import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/errors/failures.dart';
import 'package:report/src/modules/auth/data/datasources/local/abstract/auth_local_data_source.dart';
import 'package:report/src/modules/auth/data/datasources/remote/source/abstract/auth_remote_data_source.dart';
import 'package:report/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:report/gen/i18n/translations.g.dart';

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
      throw _mapDioException(e);
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
      throw _mapDioException(e);
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

  /// 🔑 Centralized error mapping supaya UI dapat pesan yang jelas + translate
  Failure _mapDioException(DioException e) {
    if (e.response != null) {
      final data = e.response?.data;

      // Ambil pesan "detail" jika ada
      final detailMessage = (data is Map<String, dynamic> && data['detail'] != null)
          ? data['detail'].toString()
          : null;

      if (e.response?.statusCode == 401) {
        return ServerFailure(t.app.errors.invalid_credentials);
      }

      if (e.response?.statusCode == 422) {
        final errorMsg = _extractValidationMessage(data);
        return ValidationFailure(errorMsg);
      }

      if (e.response?.statusCode == 404) {
        return ServerFailure(t.app.errors.not_found);
      }

      return ServerFailure(detailMessage ?? t.app.errors.server_error);
    }

    return NetworkFailure(t.app.errors.network_error);
  }

  /// Helper untuk ambil pesan validasi dari API (misalnya dari FastAPI / DRF).
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
    return t.app.errors.validation_error;
  }
}
