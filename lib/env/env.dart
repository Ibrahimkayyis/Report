import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _Env.baseUrl;

  // Ganti TRACE menjadi ARISE
  @EnviedField(varName: 'ARISE_BASE_URL')
  static const String ariseBaseUrl = _Env.ariseBaseUrl;
}