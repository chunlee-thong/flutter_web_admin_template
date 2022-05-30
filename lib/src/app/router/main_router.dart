class AppRoutes {
  static const dashboard = "/home/dashboard";
  static const inventory = "/home/inventory";
  static const customer = "/home/customer";
  static const setting = "/home/setting";
  static const admin = "/home/admin";
  static const report = "/home/report";
  static const message = "/home/message";
  static const request = "/home/request";
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
  AppRoutes.message,
  AppRoutes.request,
];

//
const List<String> kUnauthenticatedRoutes = [
  AppRoutes.login,
];
