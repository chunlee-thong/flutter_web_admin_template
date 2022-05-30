import 'package:flutter/material.dart';

class MenuModel {
  final int index;
  final IconData icon;
  final String title;
  final List<MenuModel>? children;
  const MenuModel({
    required this.index,
    required this.icon,
    required this.title,
    this.children,
  });
}

const kMenuList = [
  MenuModel(index: 0, icon: Icons.bar_chart, title: "Dashboard"),
  MenuModel(index: 1, icon: Icons.shopping_cart_checkout_outlined, title: "Inventory"),
  MenuModel(index: 2, icon: Icons.person, title: "Customer"),
  MenuModel(index: 3, icon: Icons.pie_chart, title: "Report"),
  MenuModel(index: 4, icon: Icons.admin_panel_settings, title: "Admin"),
  MenuModel(index: 5, icon: Icons.settings, title: "Setting"),
  MenuModel(
    index: 9999999,
    icon: Icons.menu,
    title: "CRM",
    children: [
      MenuModel(
        index: 6,
        icon: Icons.message,
        title: "Message",
      ),
      MenuModel(
        index: 7,
        icon: Icons.question_answer_outlined,
        title: "Request",
      ),
    ],
  ),
];
