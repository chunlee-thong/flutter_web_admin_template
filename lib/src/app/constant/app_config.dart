import 'package:flutter/foundation.dart';

class AppConfig {
  //
  static const String appName = "Admin Dashboard";
  static const String baseApiUrl = "https://express-boilerplate-dev.lynical.com/api";
  static const String appVersion = "0.0.1";

  ///Empty string if in debug mode
  static String get sentryDsn => kDebugMode ? "" : "";
}
