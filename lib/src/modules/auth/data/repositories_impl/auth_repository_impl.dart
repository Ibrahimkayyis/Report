import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/errors/failures.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/auth/data/datasources/local/abstract/auth_local_data_source.dart';
import 'package:report/src/modules/auth/data/datasources/remote/source/abstract/auth_remote_data_source.dart';
import 'package:report/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:report/src/modules/auth/domain/enums/user_type.dart';
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
      AppLogger.i("🔄 [SmartLogin] Mencoba login sebagai Masyarakat...");
      return await _attemptLogin(email, password, UserType.masyarakat);
    } catch (eMasyarakat) {
      
      if (eMasyarakat is DioException && 
          (eMasyarakat.type == DioExceptionType.connectionError || 
           eMasyarakat.type == DioExceptionType.connectionTimeout)) {
          throw _mapDioException(eMasyarakat);
      }

      AppLogger.w("⚠️ [SmartLogin] Gagal di Masyarakat, mencoba Pegawai/Teknisi...");

      try {
        return await _attemptLogin(email, password, UserType.employee);
      } catch (ePegawai) {
        AppLogger.e("❌ [SmartLogin] Gagal di kedua server.");
        
        if (ePegawai is DioException) {
          throw _mapDioException(ePegawai);
        } else {
           throw _mapDioException(eMasyarakat is DioException ? eMasyarakat : ePegawai as DioException);
        }
      }
    }
  }
  Future<String> _attemptLogin(String email, String password, UserType type) async {
    final response = await remote.login(
      email: email, 
      password: password, 
      type: type
    );

    String token;
    String refreshToken = '';
    String role;

    if (type == UserType.employee) {
      token = response['access_token'] as String;
      
      if (response['refresh_token'] != null) {
        refreshToken = response['refresh_token'] as String;
      }

      final user = response['user'];
      
      if (user != null && user['role_id'] != null) {
          final roleId = int.tryParse(user['role_id'].toString()) ?? 0;

          switch (roleId) {
            case 6:
              role = 'teknisi';
              break;
            case 1:
              role = 'diskominfo'; 
              break;
            case 2:
              role = 'opd'; 
              break;
            case 5:
              role = 'admin_dinas'; 
              break;
            case 7:
              role = 'bidang';
              break;
            case 8:
              role = 'seksi';
              break;
            case 3:
              role = 'verifikator';
              break;
            case 4:
              role = 'auditor';
              break;
            default:
              role = 'pegawai'; // Default
              break;
          }
      } else {
          role = 'pegawai';
      }

    } else {
      // --- FLOW MASYARAKAT (SERVICE DESK) ---
      // Endpoint login masyarakat terbaru tidak mengembalikan object user/role
      token = response['access_token'] as String;
      if (response['refresh_token'] != null) {
         refreshToken = response['refresh_token'] as String;
      }
      role = 'masyarakat';
    }

    AppLogger.i('✅ [SmartLogin] Sukses ($type) | Role Result: $role');
    
    await saveToken(token);
    if (refreshToken.isNotEmpty) await saveRefreshToken(refreshToken);
    await saveRole(role);

    return token;
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
      
      final newAccessToken =
          await remote.refreshToken(refreshToken: refreshToken);

      await saveToken(newAccessToken);
      return newAccessToken;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
        await logout();
      }
      throw _mapDioException(e);
    } catch (e) {
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
  }

  // ========== Error Mapper ==========
  Failure _mapDioException(DioException e) {
    if (e.response != null) {
      final data = e.response?.data;
      final detailMessage = (data is Map<String, dynamic> && data['detail'] != null)
              ? data['detail'].toString() : null;

      if (e.response?.statusCode == 401) return ServerFailure(t.app.errors.invalid_credentials);
      if (e.response?.statusCode == 403) return ServerFailure('Token tidak valid');
      if (e.response?.statusCode == 422) return ValidationFailure(_extractValidationMessage(data));
      if (e.response?.statusCode == 404) return ServerFailure(t.app.errors.not_found);

      return ServerFailure(detailMessage ?? t.app.errors.server_error);
    }
    return NetworkFailure(t.app.errors.network_error);
  }

  String _extractValidationMessage(dynamic data) {
    try {
      if (data is Map<String, dynamic>) {
        // Cek Service Desk Format: detail is List
        final details = data['detail'];
        if (details is List && details.isNotEmpty) {
           return details.first['msg'] ?? t.app.errors.validation_error;
        }

        // Cek Arise Format: errors is Map { field: [msg] }
        final errors = data['errors'];
        if (errors is Map) {
           final firstKey = errors.keys.first;
           final firstErrorList = errors[firstKey];
           if (firstErrorList is List && firstErrorList.isNotEmpty) {
              return firstErrorList.first.toString();
           }
        }
        
        if (data['message'] != null) return data['message'].toString();
      }
    } catch (_) {}
    return t.app.errors.validation_error;
  }
}