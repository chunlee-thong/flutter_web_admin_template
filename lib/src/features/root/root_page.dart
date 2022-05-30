import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_admin_template/src/app/provider/index.dart';
import 'package:flutter_web_admin_template/src/app/provider/menu_controller.dart';
import 'package:flutter_web_admin_template/src/app/router/main_router.dart';
import 'package:flutter_web_admin_template/src/features/crm/message/message_page.dart';
import 'package:flutter_web_admin_template/src/features/customer/customer_page.dart';
import 'package:flutter_web_admin_template/src/features/inventory/inventory_page.dart';
import 'package:go_router/go_router.dart';
import 'package:sura_flutter/sura_flutter.dart';

import '../dashboard/dashboard_page.dart';
import 'widgets/appbar_avatar.dart';
import 'widgets/appbar_language.dart';
import 'widgets/appbar_notification.dart';
import 'widgets/side_menu_layout.dart';

class RootPage extends StatefulWidget {
  final String pageKey;
  const RootPage({Key? key, this.pageKey = AppRoutes.dashboard}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();

  static const Map<String, Widget> pages = {
    AppRoutes.dashboard: DashboardPage(),
    AppRoutes.inventory: InventoryPage(),
    AppRoutes.customer: CustomerPage(),
    AppRoutes.setting: Text("Setting"),
    AppRoutes.report: Text("Report"),
    AppRoutes.admin: Text("Admin"),
    AppRoutes.message: MessagePage(),
    AppRoutes.request: Text("Request"),
  };
}

class _RootPageState extends State<RootPage> {
  late PageController pageController;
  late MenuController menuController = readProvider<MenuController>(context);

  void initPage() {
    int index = RootPage.pages.keys.toList().indexOf(widget.pageKey);
    pageController = PageController(initialPage: index);
    menuController.setController(pageController);
  }

  @override
  void initState() {
    initPage();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  String get getTitle {
    String current = GoRouter.of(context).location.split("/").last;
    return "Web Admin | ${current.replaceFirst('/', '').capitalize()}";
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
      label: getTitle,
    ));
    return LayoutBuilder(
      builder: (context, constraint) {
        final isBigScreen = constraint.maxWidth > 800;
        return Row(
          children: [
            if (isBigScreen) const SideMenuLayout(),
            Expanded(
              child: Scaffold(
                drawer: isBigScreen ? null : const SideMenuLayout(),
                appBar: AppBar(
                  actions: const [
                    AppBarNotification(),
                    AppBarLanguage(),
                    AppBarAvatar(),
                  ],
                ),
                body: Builder(
                  builder: (context) {
                    return PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pageController,
                      itemBuilder: (context, index) => RootPage.pages[widget.pageKey] ?? emptySizedBox,
                      itemCount: RootPage.pages.keys.length,
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
