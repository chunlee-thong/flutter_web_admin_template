import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_admin_template/src/core/provider/index.dart';
import 'package:flutter_web_admin_template/src/core/provider/menu_controller.dart';
import 'package:flutter_web_admin_template/src/core/router/main_router.dart';
import 'package:flutter_web_admin_template/src/features/customer/customer_page.dart';
import 'package:flutter_web_admin_template/src/features/inventory/inventory_page.dart';
import 'package:flutter_web_admin_template/src/features/product-detail/product_detail_page.dart';
import 'package:flutter_web_admin_template/src/shared/widgets/container/body_layout_container.dart';
import 'package:go_router/go_router.dart';
import 'package:skadi/skadi.dart';

import '../dashboard/dashboard_page.dart';
import '../message/message_page.dart';
import 'widgets/appbar_avatar.dart';
import 'widgets/appbar_language.dart';
import 'widgets/appbar_notification.dart';
import 'widgets/side_menu_layout.dart';

const double kMenuBreakpoint = 800;

class RootPage extends StatefulWidget {
  final String mainPageKey;
  final AppSubRoute? subroute;
  const RootPage({Key? key, this.mainPageKey = AppRoutes.dashboard, this.subroute}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late PageController pageController;
  late MenuController menuController = readProvider<MenuController>(context);

  Map<String, Widget> get pages => {
        AppRoutes.dashboard: const DashboardPage(),
        AppRoutes.inventory: const InventoryPage(),
        AppRoutes.customer: const CustomerPage(),
        AppRoutes.setting: const Text("Setting"),
        AppRoutes.report: const Text("Report"),
        AppRoutes.admin: const Text("Admin"),
        AppRoutes.message: const MessagePage(),
        AppRoutes.request: const Text("Request"),
        AppRoutes.productDetail: ProductDetailPage(
          productId: int.parse(widget.subroute?.param ?? "0"),
        ),
      };

  void initSideMenuIndex() {
    int menuIndex = widget.subroute?.sideMenuIndex != null
        ? widget.subroute!.sideMenuIndex!
        : pages.keys.toList().indexOf(widget.mainPageKey);
    pageController = PageController(initialPage: menuIndex);
    menuController.setController(pageController);
  }

  @override
  void initState() {
    infoLog("root page init");
    initSideMenuIndex();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  String get getTitle {
    String current = GoRouter.of(context).location.split("/").last;
    String title = "Web Admin | ${current.replaceFirst('/', '').capitalize}";
    infoLog("Get title:", title);
    return title;
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
        label: getTitle,
      ));
    }
    return LayoutBuilder(
      builder: (context, constraint) {
        final isBigScreen = constraint.maxWidth > kMenuBreakpoint;
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
                      itemBuilder: (context, index) {
                        Widget child = pages[widget.mainPageKey] ?? emptySizedBox;
                        return BodyLayoutContainer(child: child);
                      },
                      itemCount: pages.keys.length,
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
