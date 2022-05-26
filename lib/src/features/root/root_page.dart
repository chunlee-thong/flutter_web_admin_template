import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_admin_template/src/app/provider/index.dart';
import 'package:flutter_web_admin_template/src/app/provider/menu_controller.dart';
import 'package:flutter_web_admin_template/src/features/customer/customer_page.dart';
import 'package:flutter_web_admin_template/src/features/inventory/inventory_page.dart';
import 'package:go_router/go_router.dart';
import 'package:sura_flutter/sura_flutter.dart';

import '../dashboard/dashboard_page.dart';
import 'widgets/side_menu_layout.dart';

class RootPage extends StatefulWidget {
  final int index;
  const RootPage({Key? key, this.index = 0}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();

  static const Map<String, Widget> pages = {
    "dashboard": DashboardPage(),
    "inventory": InventoryPage(),
    "customer": CustomerPage(),
  };

  static const List<String> routes = [
    "/home/dashboard",
    "/home/inventory",
    "/home/customer",
  ];
}

class _RootPageState extends State<RootPage> {
  late PageController pageController = PageController(initialPage: widget.index);
  late MenuController menuController = readProvider<MenuController>(context);
  @override
  void initState() {
    menuController.setController(pageController);
    super.initState();
  }

  @override
  void dispose() {
    menuController.clearController();
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
                  actions: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.people)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_active)),
                    IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        backgroundImage: NetworkImage(
                          SuraUtils.unsplashImage(category: "person"),
                        ),
                      ),
                    ),
                  ],
                ),
                body: Builder(
                  builder: (context) {
                    return PageView.builder(
                      controller: pageController,
                      itemBuilder: (context, index) => RootPage.pages.values.toList()[index],
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
