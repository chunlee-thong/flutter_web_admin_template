import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/core/provider/index.dart';
import 'package:flutter_web_admin_template/src/core/provider/menu_controller.dart';
import 'package:flutter_web_admin_template/src/features/root/data/menu_model.dart';
import 'package:go_router/go_router.dart';
import 'package:skadi/skadi.dart';

const unselected = Color(0xFF9CA3AF);
const selected = Color(0xFF10B981);

class SideMenuLayout extends StatelessWidget {
  const SideMenuLayout({Key? key}) : super(key: key);

  static const double width = 260;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF111827),
      child: SafeArea(
        child: ListTileTheme(
          data: const ListTileThemeData(
            iconColor: unselected,
            textColor: unselected,
            selectedColor: selected,
            selectedTileColor: Colors.white10,
          ),
          child: Container(
            width: width,
            padding: EdgeInsets.only(top: SkadiResponsive.value(4, 16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCompanyInfo(),
                const Divider(color: Colors.white, thickness: 0.2),
                const _MenuList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompanyInfo() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              SkadiUtils.unsplashImage(category: "logo"),
            ),
          ),
          const SpaceY(24),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: SkadiDecoration.radius(8),
              color: Colors.white10,
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Acme Corporation",
                  style: const TextStyle(fontSize: 18).white.bold,
                ),
                const SpaceY(4),
                Text(
                  "Your Role : Admin",
                  style: const TextStyle(fontSize: 14).grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuList extends StatelessWidget {
  const _MenuList({Key? key}) : super(key: key);

  void onNavigate(BuildContext context, MenuModel menu) {
    readProvider<MenuController>(context).menuIndex = menu.index;
    context.go("/home/${menu.title.toLowerCase()}");
    if (SkadiResponsive.screenWidth <= 800) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final menuController = watchProvider<MenuController>(context);
    String location = GoRouter.of(context).location.split("/").last;
    return Column(
      children: kMenuList.map((menu) {
        if (menu.children != null) {
          List<String> children = menu.children!.map((e) => e.title.toLowerCase()).toList();
          return ExpansionTile(
            initiallyExpanded: children.contains(location),
            tilePadding: EdgeInsets.zero,
            textColor: unselected,
            collapsedTextColor: unselected,
            collapsedIconColor: unselected,
            iconColor: unselected,
            title: ListTile(
              shape: SkadiDecoration.roundRect(),
              leading: const Icon(Icons.menu),
              title: const Text("CRM"),
            ),
            children: [
              for (var child in menu.children!)
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 32),
                  onTap: () {
                    onNavigate(context, child);
                  },
                  leading: Icon(child.icon),
                  title: Text(child.title),
                  selected: menuController.menuIndex == child.index,
                ),
            ],
          );
        }
        return ListTile(
          leading: Icon(menu.icon),
          title: Text(menu.title),
          onTap: () {
            onNavigate(context, menu);
          },
          selected: menuController.menuIndex == menu.index,
        );
      }).toList(),
    );
  }
}
