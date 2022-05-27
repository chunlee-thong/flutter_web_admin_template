import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_web_admin_template/src/app/http/repository/index.dart';
import 'package:flutter_web_admin_template/src/app/models/response/user/auth_response.dart';
import 'package:flutter_web_admin_template/src/app/router/main_router.dart';
import 'package:flutter_web_admin_template/src/app/services/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider {
  AuthProvider(this.isLoggedIn);
  bool isLoggedIn = false;

  static Future<void> init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    bool isLoggedIn = token != null;
    var instance = AuthProvider(isLoggedIn);
    GetIt.I.registerSingleton<AuthProvider>(instance);
  }

  Future onSignIn(String email, String password) async {
    AuthResponse authResponse = await userRepository.loginUser(email: email, password: password);
    await AuthService.saveUserInfo(authResponse);
    isLoggedIn = true;
  }

  void logoutUser(BuildContext context) async {
    await AuthService.clearUserInfo();
    isLoggedIn = false;
    GoRouter.of(context).go(AppRoutes.login);
  }
}
