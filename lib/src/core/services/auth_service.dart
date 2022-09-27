import 'package:flutter_web_admin_template/src/core/models/response/user/auth_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("token");
  }

  static Future<void> saveUserInfo(AuthResponse authResponse) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("token", authResponse.token);
    await sharedPreferences.setString("userId", authResponse.userId);
  }

  static Future<void> clearUserInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
