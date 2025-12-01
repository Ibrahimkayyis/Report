import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:report/env/env.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/auth/data/datasources/local/abstract/auth_local_data_source.dart';
import 'package:report/src/core/service_locator/service_locator.dart';

@module
abstract class RegisterModule {
  // ===========================================================================
  // 1. DEFAULT DIO (SMART DIO)
  // ===========================================================================

  @Named('baseUrl')
  String get baseUrl => Env.baseUrl;

  // Rename getter injection
  @Named('ariseBaseUrl')
  String get ariseBaseUrl => Env.ariseBaseUrl;

  @lazySingleton
  Dio dio(
    @Named('baseUrl') String baseUrl,
    @Named('ariseBaseUrl') String ariseBaseUrl, // Rename param
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // -------------------------------------------------------------------------
    // INTERCEPTOR: DYNAMIC REDIRECT TO ARISE APP
    // -------------------------------------------------------------------------
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          try {
            final role = await sl<AuthLocalDataSource>().getRole();

            // Daftar Role Penghuni Arise App
            final ariseRoles = [
              'diskominfo',   
              'opd',          
              'verifikator',  
              'auditor',      
              'admin_dinas',  
              'teknisi',      
              'bidang',       
              'seksi',        
              'pegawai',      
              'employee'      
            ];

            // Jika user adalah penghuni Arise App, belokkan request
            if (role != null && ariseRoles.contains(role.toLowerCase())) {
              AppLogger.d("🔀 [Interceptor] Redirecting to Arise Server for role: $role");
              
              // 1. Ganti Base URL ke Arise App
              options.baseUrl = ariseBaseUrl;

              // 2. Fix Path: Arise App butuh '/api'
              if (!options.path.startsWith('/api') && !options.path.startsWith('http')) {
                 options.path = '/api${options.path}';
              }
            }
          } catch (e) {
            // Ignore error
          }
          handler.next(options);
        },
      ),
    );

    // Logger
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          AppLogger.i("➡️ Request: ${options.method} ${options.uri}\nBody: ${options.data}");
          handler.next(options);
        },
        onResponse: (response, handler) {
          AppLogger.i("⬅️ Response (${response.statusCode}): ${response.realUri}\nBody: ${response.data}");
          handler.next(response);
        },
        onError: (DioException e, handler) {
          AppLogger.e("❌ Error on ${e.requestOptions.method} ${e.requestOptions.uri}", e, e.stackTrace);
          handler.next(e);
        },
      ),
    );

    // Auth Token
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          try {
            final token = await sl<AuthLocalDataSource>().getToken();
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
              AppLogger.d("🔐 Token attached to request");
            }
          } catch (_) {}
          handler.next(options);
        },
      ),
    );

    return dio;
  }

  // ===========================================================================
  // 2. ARISE DIO (Khusus Auth Repository)
  // ===========================================================================
  @Named('ariseDio') // Rename Token Injection
  @lazySingleton
  Dio ariseDio(@Named('ariseBaseUrl') String url) { // Rename Method & Param
    final dio = Dio(
      BaseOptions(
        baseUrl: url,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json', 
        },
      ),
    );

    // Logger Khusus Arise
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          AppLogger.i("➡️ [ARISE-AUTH] Request: ${options.method} ${options.uri}");
          handler.next(options);
        },
        onResponse: (response, handler) {
          AppLogger.i("⬅️ [ARISE-AUTH] Response (${response.statusCode})");
          handler.next(response);
        },
        onError: (DioException e, handler) {
          AppLogger.e("❌ [ARISE-AUTH] Error", e, e.stackTrace);
          handler.next(e);
        },
      ),
    );
    return dio;
  }

  @preResolve
  @lazySingleton
  Future<SharedPreferences> prefs() async => await SharedPreferences.getInstance();
}