import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
      final refreshToken = response['refresh_token'] as String; // NEW

      // ✅ Ambil role pertama dari daftar roles (default: masyarakat)
      final user = response['user'];
      final roles = (user?['roles'] as List<dynamic>?) ?? [];
      final role = roles.isNotEmpty ? roles.first.toString() : 'masyarakat';

      debugPrint('✅ Login berhasil:');
      debugPrint('   Email: $email');
      debugPrint('   Role terdeteksi: $role');
      debugPrint('   Access Token: ${token.substring(0, 20)}...');
      debugPrint('   Refresh Token: ${refreshToken.substring(0, 20)}...'); // NEW

      // Simpan ke local storage
      await saveToken(token);
      await saveRefreshToken(refreshToken); // NEW
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

  // ========== Refresh Token - NEW ==========
  @override
  Future<String?> getSavedRefreshToken() => local.getRefreshToken();

  @override
  Future<void> saveRefreshToken(String refreshToken) =>
      local.saveRefreshToken(refreshToken);

  @override
  Future<String> refreshAccessToken() async {
    try {
      // Ambil refresh token dari local storage
      final refreshToken = await getSavedRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        debugPrint('❌ Refresh token tidak ditemukan di local storage');
        throw ServerFailure('Refresh token tidak tersedia');
      }

      debugPrint('🔄 Melakukan refresh token...');
      debugPrint('   Refresh Token: ${refreshToken.substring(0, 20)}...');

      // Call API refresh token
      final newAccessToken = await remote.refreshToken(
        refreshToken: refreshToken,
      );

      debugPrint('✅ Refresh token berhasil!');
      debugPrint('   New Access Token: ${newAccessToken.substring(0, 20)}...');

      // Simpan access token baru
      await saveToken(newAccessToken);

      return newAccessToken;
    } on DioException catch (e) {
      debugPrint('❌ Refresh token gagal: ${e.message}');
      
      // Jika refresh token expired (401/403), hapus semua data auth
      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
        debugPrint('⚠️ Refresh token expired, melakukan logout...');
        await logout();
      }
      
      throw _mapDioException(e);
    } catch (e) {
      debugPrint('❌ Error tidak terduga saat refresh token: $e');
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
    debugPrint('🚪 Logout berhasil, semua data auth dihapus');
  }

  /// 🔑 Centralized error mapping supaya UI dapat pesan yang jelas + translate
  Failure _mapDioException(DioException e) {
    if (e.response != null) {
      final data = e.response?.data;
      
      // Ambil pesan "detail" jika ada
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