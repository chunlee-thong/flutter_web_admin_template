import 'package:flutter_web_admin_template/src/features/login/login_page.dart';
import 'package:flutter_web_admin_template/src/features/root/root_page.dart';
import 'package:go_router/go_router.dart';

final kRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/home/:menu',
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
