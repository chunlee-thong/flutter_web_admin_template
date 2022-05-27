class AppRoutes {
  static const dashboard = "/home/dashboard";
  static const inventory = "/home/inventory";
  static const customer = "/home/customer";
  static const setting = "/home/setting";
  static const admin = "/home/admin";
  static const report = "/home/report";
  //
  static const login = "/login";
}

const List<String> kAuthenticatedRoutes = [
  AppRoutes.dashboard,
  AppRoutes.inventory,
  AppRoutes.customer,
  AppRoutes.setting,
  AppRoutes.admin,
  AppRoutes.report,
];

//
const List<String> kUnauthenticatedRoutes = [
  AppRoutes.login,
];
