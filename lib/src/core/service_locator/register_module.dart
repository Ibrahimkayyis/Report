import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:report/src/modules/auth/data/datasources/local/abstract/auth_local_data_source.dart';
import 'package:report/src/core/service_locator/service_locator.dart';

@module
abstract class RegisterModule {
  /// 🌐 Base URL API utama
  @Named('baseUrl')
  String get baseUrl => "https://service-desk-be-production.up.railway.app";

  /// 🧩 Setup Dio client tanpa interceptor dulu (untuk menghindari circular dependency)
  @lazySingleton
  Dio dio(@Named('baseUrl') String baseUrl) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // 🪄 Interceptor untuk logging (optional, untuk debugging)
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
      logPrint: (obj) {
        // ignore: avoid_print
        print(obj);
      },
    ));

    // 🔐 Interceptor sederhana untuk menambahkan token
    // AuthInterceptor akan ditambahkan secara manual setelah service locator ready
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          try {
            // Ambil token dari AuthLocalDataSource
            final token = await sl<AuthLocalDataSource>().getToken();
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
              // ignore: avoid_print
              print('🟢 Interceptor: Token ditambahkan ke header');
            } else {
              // ignore: avoid_print
              print('⚠️ Interceptor: Token kosong, request tanpa Authorization');
            }
          } catch (e) {
            // ignore: avoid_print
            print('❌ Interceptor error: $e');
          }
          return handler.next(options);
        },
      ),
    );

    return dio;
  }

  /// 📦 SharedPreferences untuk penyimpanan lokal
  @preResolve
  @lazySingleton
  Future<SharedPreferences> prefs() async {
    return await SharedPreferences.getInstance();
  }
}