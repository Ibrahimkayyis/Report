import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/core/errors/failures.dart';
import 'package:report/src/modules/domain/repositories/auth_repository.dart';
import '../datasources/remote/source/abstract/auth_remote_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl({required this.remote});

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
          // Ambil pesan error dari response detail
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
      return await remote.login(email: email, password: password);
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
    } catch (_) {
      // fallback
    }
    return 'Validation error';
  }
}
