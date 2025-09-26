import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  /// Base URL API untuk REPORT (pusat disini)
  @Named('baseUrl')
  String get baseUrl => "https://cd67e0bbfdbe.ngrok-free.app";

  /// Dio client untuk REST API
  @lazySingleton
  Dio dio(@Named('baseUrl') String baseUrl) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    // Tambahkan interceptor log (opsional)
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ));

    return dio;
  }

  @preResolve
  @lazySingleton
  Future<SharedPreferences> prefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }
}
