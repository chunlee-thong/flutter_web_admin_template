import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/app/constant/app_theme_color.dart';
import 'package:flutter_web_admin_template/src/app/provider/auth_provider.dart';
import 'package:flutter_web_admin_template/src/app/provider/menu_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sura_flutter/sura_flutter.dart';

import 'src/features/login/login_page.dart';
import 'src/features/root/root_page.dart';

class AdminTemplateApp extends StatelessWidget {
  final AuthProvider authProvider = AuthProvider();
  AdminTemplateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var kRouter = GoRouter(
      routes: [
        GoRoute(
          path: "/login",
          name: "not-authenticated",
          builder: (context, state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: '/home/:menu',
          name: "authenticated",
          builder: (context, state) {
            final menu = state.params['menu']!;
            int index = RootPage.pages.keys.toList().indexOf(menu);
            return RootPage(index: index);
          },
          redirect: (state) {
            return null;
          },
        ),
      ],
      initialLocation: "/",
      redirect: (state) {
        if (authProvider.isLoggedIn) {
          if (!RootPage.routes.contains(state.subloc)) {
            return "/home/dashboard";
          }
        } else {
          if (state.subloc != "/login") {
            return "/login";
          }
        }
        return null;
      },
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => MenuController()),
        Provider.value(value: authProvider),
      ],
      child: MaterialApp.router(
        routeInformationParser: kRouter.routeInformationParser,
        routerDelegate: kRouter.routerDelegate,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          platform: TargetPlatform.windows,
          visualDensity: VisualDensity.standard,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: SuraColor.toMaterial(AppColor.primary.value),
          ),
          appBarTheme: const AppBarTheme(
            elevation: 1.0,
            backgroundColor: Colors.white,
            foregroundColor: Color(0xFF6B7280),
          ),
          scaffoldBackgroundColor: const Color(0xFFF9FAFC),
          inputDecorationTheme: const InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(),
            alignLabelWithHint: false,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
        builder: (context, child) {
          return SuraResponsiveBuilder(
            builder: (context) => child!,
          );
        },
      ),
    );
  }
}
