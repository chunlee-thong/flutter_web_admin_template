import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/app/provider/index.dart';
import 'package:flutter_web_admin_template/src/app/provider/menu_controller.dart';
import 'package:flutter_web_admin_template/src/features/customer/customer_page.dart';
import 'package:flutter_web_admin_template/src/features/inventory/inventory_page.dart';
import 'package:sura_flutter/sura_flutter.dart';

import '../dashboard/dashboard_page.dart';
import 'widgets/side_menu_layout.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  static const List<Widget> pages = [
    DashboardPage(),
    InventoryPage(),
    CustomerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        final isBigScreen = constraint.maxWidth > 800;
        return Row(
          children: [
            if (isBigScreen) const SideMenuLayout(),
            Expanded(
              child: Scaffold(
                drawer: isBigScreen ? null : const SideMenuLayout(),
                backgroundColor: const Color(0xFFF9FAFC),
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
                    final pageController = readProvider<MenuController>(context).pageController;
                    return PageView.builder(
                      controller: pageController,
                      itemBuilder: (context, index) => pages[index],
                      itemCount: pages.length,
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
