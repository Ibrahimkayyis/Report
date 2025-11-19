import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:report/env/env.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/auth/data/datasources/local/abstract/auth_local_data_source.dart';
import 'package:report/src/core/service_locator/service_locator.dart';

@module
abstract class RegisterModule {

  @Named('baseUrl')
  String get baseUrl => Env.baseUrl;

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

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          AppLogger.i(
              "➡️ Request: ${options.method} ${options.uri}\n"
              "Headers: ${options.headers}\n"
              "Body: ${options.data}"
          );
          handler.next(options);
        },
        onResponse: (response, handler) {
          AppLogger.i(
              "⬅️ Response (${response.statusCode}): ${response.realUri}\n"
              "Body: ${response.data}"
          );
          handler.next(response);
        },
        onError: (DioException e, handler) {
          AppLogger.e(
            "❌ Error on ${e.requestOptions.method} ${e.requestOptions.uri}",
            e,
            e.stackTrace,
          );
          handler.next(e);
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          try {
            final token = await sl<AuthLocalDataSource>().getToken();

            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
              AppLogger.d("🔐 Token attached to request");
            } else {
              AppLogger.w("⚠️ Request without token");
            }
          } catch (e, st) {
            AppLogger.e("Interceptor error", e, st);
          }

          handler.next(options);
        },
      ),
    );

    return dio;
  }

  @preResolve
  @lazySingleton
  Future<SharedPreferences> prefs() async =>
      await SharedPreferences.getInstance();
}
