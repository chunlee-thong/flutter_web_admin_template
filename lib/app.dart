import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/app/constant/app_theme_color.dart';
import 'package:flutter_web_admin_template/src/app/provider/menu_controller.dart';
import 'package:provider/provider.dart';
import 'package:sura_flutter/sura_flutter.dart';

import 'src/features/root/root_page.dart';

class AdminTemplateApp extends StatelessWidget {
  const AdminTemplateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => MenuController()),
      ],
      child: MaterialApp(
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
        ),
        home: const RootPage(),
        builder: (context, child) {
          return SuraResponsiveBuilder(
            builder: (context) => child!,
          );
        },
      ),
    );
  }
}
