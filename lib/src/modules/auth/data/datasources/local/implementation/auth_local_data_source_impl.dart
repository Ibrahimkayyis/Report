import 'package:injectable/injectable.dart';
import 'package:report/src/modules/auth/data/datasources/local/abstract/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences prefs;
  static const String _tokenKey = 'REPORT_access_token';
  static const String _roleKey = 'REPORT_user_role';

  AuthLocalDataSourceImpl(this.prefs);

  @override
  Future<void> saveToken(String token) async {
    await prefs.setString(_tokenKey, token);
  }
  
  @override
  Future<String?> getToken() async {
    return prefs.getString(_tokenKey);
  }

  @override
  Future<void> deleteToken() async {
    await prefs.remove(_tokenKey);
  }

  @override
  Future<void> saveRole(String role) async {
    await prefs.setString(_roleKey, role);
  }

  @override
  Future<String?> getRole() async {
    return prefs.getString(_roleKey);
  }

  @override
  Future<void> clear() async {
    await prefs.remove(_tokenKey);
    await prefs.remove(_roleKey);
  }

}