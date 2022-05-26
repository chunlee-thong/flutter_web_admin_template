import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sura_flutter/sura_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SuraFormMixin {
  TextEditingController emailTC = TextEditingController();
  TextEditingController passwordTC = TextEditingController();

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
      child: Scaffold(
        body: Center(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SpaceY(24),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                const SpaceY(24),
                SuraAsyncButton(
                  height: 46,
                  margin: EdgeInsets.zero,
                  onPressed: () {
                    context.go("/");
                  },
                  child: const Text("LOGIN"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
