import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/errors/failures.dart';
import 'package:report/src/core/log/app_logger.dart';
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
    String? phoneNumber,
    String? birthDate,
    String? address,
    String role = 'masyarakat',
  }) async {
    try {
      return await remote.register(
        email: email,
        firstName: firstName,
        lastName: lastName,
        password: password,
        phoneNumber: phoneNumber,
        birthDate: birthDate,
        address: address,
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
      final refreshToken = response['refresh_token'] as String;

      final user = response['user'];
      final roles = (user?['roles'] as List<dynamic>?) ?? [];
      final role = roles.isNotEmpty ? roles.first.toString() : 'masyarakat';

      AppLogger.i('Login berhasil → email: $email');
      AppLogger.d('Role: $role');
      AppLogger.d('AccessToken: ${token.substring(0, 20)}...');
      AppLogger.d('RefreshToken: ${refreshToken.substring(0, 20)}...');

      await saveToken(token);
      await saveRefreshToken(refreshToken);
      await saveRole(role);

      return token;
    } on DioException catch (e) {
      throw _mapDioException(e);
    }
  }

  // ========== Access Token ==========
  @override
  Future<String?> getSavedToken() => local.getToken();

  @override
  Future<void> saveToken(String token) => local.saveToken(token);

  // ========== Refresh Token ==========
  @override
  Future<String?> getSavedRefreshToken() => local.getRefreshToken();

  @override
  Future<void> saveRefreshToken(String refreshToken) =>
      local.saveRefreshToken(refreshToken);

  @override
  Future<String> refreshAccessToken() async {
    try {
      final refreshToken = await getSavedRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        AppLogger.w('Refresh token tidak ditemukan di local storage');
        throw ServerFailure('Refresh token tidak tersedia');
      }

      AppLogger.i('Melakukan refresh token...');
      AppLogger.d('RefreshToken: ${refreshToken.substring(0, 20)}...');

      final newAccessToken =
          await remote.refreshToken(refreshToken: refreshToken);

      AppLogger.i('Refresh token berhasil');
      AppLogger.d('NewAccessToken: ${newAccessToken.substring(0, 20)}...');

      await saveToken(newAccessToken);

      return newAccessToken;
    } on DioException catch (e) {
      AppLogger.e('Refresh token gagal: ${e.message}', e);

      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
        AppLogger.w('Refresh token expired → logout()');
        await logout();
      }

      throw _mapDioException(e);
    } catch (e, st) {
      AppLogger.e('Error tidak terduga saat refresh token', e, st);
      throw ServerFailure('Gagal memperbarui token');
    }
  }

  // ========== User Role ==========
  @override
  Future<String?> getSavedRole() => local.getRole();

  @override
  Future<void> saveRole(String role) => local.saveRole(role);

  // ========== Logout ==========
  @override
  Future<void> logout() async {
    await local.clear();
    AppLogger.i('Logout berhasil → semua data auth dihapus');
  }

  // ========== Error Mapper ==========
  Failure _mapDioException(DioException e) {
    if (e.response != null) {
      final data = e.response?.data;

      final detailMessage =
          (data is Map<String, dynamic> && data['detail'] != null)
              ? data['detail'].toString()
              : null;

      if (e.response?.statusCode == 401) {
        return ServerFailure(t.app.errors.invalid_credentials);
      }

      if (e.response?.statusCode == 403) {
        return ServerFailure('Token tidak valid atau sudah kadaluarsa');
      }

      if (e.response?.statusCode == 422) {
        return ValidationFailure(_extractValidationMessage(data));
      }

      if (e.response?.statusCode == 404) {
        return ServerFailure(t.app.errors.not_found);
      }

      return ServerFailure(detailMessage ?? t.app.errors.server_error);
    }

    return NetworkFailure(t.app.errors.network_error);
  }

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
