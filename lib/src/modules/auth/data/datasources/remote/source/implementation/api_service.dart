import 'package:injectable/injectable.dart';

@lazySingleton
class ApiService {
  Future<String> ping() async {
    return "pong";
  }
}
