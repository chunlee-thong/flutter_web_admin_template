class AppRoutes {
  static const dashboard = "/home/dashboard";
  static const inventory = "/home/inventory";
  static const customer = "/home/customer";
  static const setting = "/home/setting";
  static const admin = "/home/admin";
  static const report = "/home/report";
  static const message = "/home/message";
  static const request = "/home/request";
  static const productDetail = "/home/product";
  //
  static const login = "/login";
  static const register = "/register";
}

const List<String> kAuthenticatedRoutes = [
  AppRoutes.dashboard,
  AppRoutes.inventory,
  AppRoutes.customer,
  AppRoutes.setting,
  AppRoutes.admin,
  AppRoutes.report,
  AppRoutes.message,
  AppRoutes.request,
  AppRoutes.productDetail,
];

//
const List<String> kUnauthenticatedRoutes = [
  AppRoutes.login,
  AppRoutes.register,
];

abstract class AppSubRoute {
  int? get sideMenuIndex;
  String? get param;
}

class ProductDetailRoute implements AppSubRoute {
  final String productId;
  ProductDetailRoute(this.productId);
  @override
  int? get sideMenuIndex => 1;

  @override
  String? get param => productId;
}
