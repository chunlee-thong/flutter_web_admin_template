import 'package:flutter/material.dart';

class MenuModel {
  final IconData icon;
  final String title;

  const MenuModel({required this.icon, required this.title});
}

const kMenuList = [
  MenuModel(icon: Icons.bar_chart, title: "Dashboard"),
  MenuModel(icon: Icons.shopping_cart_checkout_outlined, title: "Inventory"),
  MenuModel(icon: Icons.person, title: "Customer"),
  MenuModel(icon: Icons.pie_chart, title: "Report"),
  MenuModel(icon: Icons.admin_panel_settings, title: "Admin"),
  MenuModel(icon: Icons.settings, title: "Setting"),
];
