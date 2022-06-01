import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/app/constant/app_theme_color.dart';
import 'package:flutter_web_admin_template/src/app/provider/auth_provider.dart';
import 'package:flutter_web_admin_template/src/app/provider/menu_controller.dart';
import 'package:flutter_web_admin_template/src/app/router/main_router.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sura_flutter/sura_flutter.dart';

import 'src/features/login/login_page.dart';
import 'src/features/root/root_page.dart';

class AdminDashboardApp extends StatelessWidget {
  final AuthProvider authProvider = GetIt.I.get<AuthProvider>();
  AdminDashboardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var kRouter = GoRouter(
      routes: [
        GoRoute(
          path: AppRoutes.login,
          builder: (context, state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: '/home/:menu',
          builder: (context, state) {
            final menu = state.location;
            return RootPage(mainPageKey: menu);
          },
          redirect: (state) {
            return null;
          },
        ),
        GoRoute(
          path: '/home/product/:productId',
          builder: (context, state) {
            final productId = state.params['productId'];
            return RootPage(
              mainPageKey: AppRoutes.productDetail,
              subroute: ProductDetailRoute(productId!),
            );
          },
          redirect: (state) {
            return null;
          },
        ),
      ],
      initialLocation: authProvider.isLoggedIn ? AppRoutes.dashboard : AppRoutes.login,
      redirect: (state) {
        if (authProvider.isLoggedIn) {
          bool matchAtLeastOne = false;
          for (var route in kAuthenticatedRoutes) {
            if (state.location.startsWith(route)) {
              matchAtLeastOne = true;
              if (matchAtLeastOne) break;
            }
          }
          return matchAtLeastOne ? null : kAuthenticatedRoutes.first;
        } else {
          if (!kUnauthenticatedRoutes.contains(state.subloc)) {
            return kUnauthenticatedRoutes.first;
          }
        }
        return null;
      },
    );

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
            primarySwatch: AppColor.primaryMaterial,
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
