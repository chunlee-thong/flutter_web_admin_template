import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/app/constant/app_theme_color.dart';
import 'package:flutter_web_admin_template/src/app/provider/menu_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sura_flutter/sura_flutter.dart';

import 'src/features/login/login_page.dart';
import 'src/features/root/root_page.dart';

class AdminTemplateApp extends StatelessWidget {
  AdminTemplateApp({Key? key}) : super(key: key);

  final kRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/:menu',
        builder: (context, state) {
          final menu = state.params['menu']!;
          int index = RootPage.pages.keys.toList().indexOf(menu);
          return RootPage(index: index);
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/',
        redirect: (state) => "/home/dashboard",
      ),
    ],
    initialLocation: "/login",
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => MenuController()),
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
