import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/core/provider/auth_provider.dart';
import 'package:flutter_web_admin_template/src/core/router/main_router.dart';
import 'package:flutter_web_admin_template/src/shared/widgets/common/app_logo.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';
import 'package:skadi/skadi.dart' hide SkadiContextX;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SkadiFormMixin {
  TextEditingController emailTC = TextEditingController(text: "admin@gmail.com");
  TextEditingController passwordTC = TextEditingController(text: "123456");
  AuthProvider authProvider = GetIt.I.get<AuthProvider>();

  FutureOr<void> onSignIn() async {
    try {
      String email = emailTC.text.trim();
      String password = passwordTC.text.trim();
      await authProvider.onSignIn(email, password);
      GoRouter.of(context).go(AppRoutes.dashboard);
    } catch (e) {
      showToast(e.toString());
    }
  }

  @override
  void dispose() {
    emailTC.dispose();
    passwordTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Web Admin | Login",
      color: Colors.white,
      child: KeyboardDismiss(
        child: Scaffold(
          body: Center(
            child: Container(
              width: 400,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: SkadiDecoration.radius(24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppLogo(),
                  const SpaceY(32),
                  TextFormField(
                    controller: emailTC,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SpaceY(24),
                  TextFormField(
                    controller: passwordTC,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  const SpaceY(24),
                  SkadiAsyncButton(
                    height: 46,
                    margin: EdgeInsets.zero,
                    onPressed: onSignIn,
                    child: const Text("LOGIN"),
                  ),
                  const SpaceY(24),
                  _buildFooter(),
                  const SpaceY(32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Doesn't have an account?"),
        TextButton(
          onPressed: () {
            context.push(AppRoutes.register);
          },
          child: const Text("Sign up"),
        ),
      ],
    );
  }
}
