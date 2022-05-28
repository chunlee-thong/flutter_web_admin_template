import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/app/provider/index.dart';
import 'package:flutter_web_admin_template/src/app/provider/menu_controller.dart';
import 'package:flutter_web_admin_template/src/features/root/data/menu_model.dart';
import 'package:go_router/go_router.dart';
import 'package:sura_flutter/sura_flutter.dart';

class SideMenuLayout extends StatelessWidget {
  const SideMenuLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const unselected = Color(0xFF9CA3AF);
    const selected = Color(0xFF10B981);
    return Material(
      color: const Color(0xFF111827),
      child: ListTileTheme(
        data: const ListTileThemeData(
          iconColor: unselected,
          textColor: unselected,
          selectedColor: selected,
          selectedTileColor: Colors.white10,
        ),
        child: Container(
          width: 260,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCompanyInfo(),
              const Divider(color: Colors.white, thickness: 0.2),
              ...kMenuList.map((menu) {
                int index = kMenuList.indexOf(menu);
                bool selected = index == watchProvider<MenuController>(context).menuIndex;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    shape: SuraDecoration.roundRect(),
                    leading: Icon(menu.icon),
                    title: Text(menu.title),
                    onTap: () {
                      readProvider<MenuController>(context).menuIndex = index;
                      context.go("/home/${menu.title.toLowerCase()}");
                      if (SuraResponsive.screenWidth <= 800) {
                        Navigator.pop(context);
                      }
                    },
                    selected: selected,
                  ),
                );
              }).toList(),
              SuraAccordion(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                titlePadding: EdgeInsets.zero,
                icon: const Icon(Icons.arrow_drop_down_outlined, color: Colors.white),
                titleDecoration: BoxDecoration(
                  borderRadius: SuraDecoration.radius(),
                ),
                childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: ListTile(
                  shape: SuraDecoration.roundRect(),
                  leading: const Icon(Icons.menu),
                  title: const Text("CRM"),
                ),
                children: [
                  ListTile(
                    onTap: () {},
                    shape: SuraDecoration.roundRect(),
                    leading: const Icon(Icons.message_rounded),
                    title: const Text("Message"),
                  ),
                  ListTile(
                    onTap: () {},
                    shape: SuraDecoration.roundRect(),
                    leading: const Icon(Icons.people),
                    title: const Text("Top fan"),
                  ),
                ],
              ),
            ],
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
              SuraUtils.unsplashImage(category: "logo"),
            ),
          ),
          const SpaceY(24),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: SuraDecoration.radius(8),
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
