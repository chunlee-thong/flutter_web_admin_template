import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/app.dart';
import 'package:go_router/go_router.dart';
import 'package:sentry/sentry.dart';
import 'package:sura_flutter/sura_flutter.dart';

void main() {
  if (kIsWeb) {
    GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  }
  runApp(AdminTemplateApp());
  return;
  runZonedGuarded(() async {
    await Sentry.init(
      (options) {
        options.dsn = "";
      },
      appRunner: () => runApp(AdminTemplateApp()),
    );
  }, (exception, stackTrace) async {
    errorLog("RunZonedGuard error: $exception", stackTrace);
  });
}
