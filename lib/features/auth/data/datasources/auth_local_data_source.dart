import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheToken(String token);
  Future<String?> getToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _sharedPref;

  AuthLocalDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPref = sharedPreferences;
  @override
  Future<void> cacheToken(String token) async {
    await _sharedPref.setString('token', token);
  }

  @override
  Future<String?> getToken() async {
    return _sharedPref.getString('token');
  }
}
