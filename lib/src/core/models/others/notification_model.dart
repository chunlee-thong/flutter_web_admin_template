import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String description;
  final IconData icon;

  const NotificationModel({
    required this.title,
    required this.description,
    required this.icon,
  });
}

const kNotificationList = [
  NotificationModel(
    title: "Update completed",
    description: "Restart server to complete update.",
    icon: Icons.storage,
  ),
  NotificationModel(
    title: "New connection",
    description: "Anna accepted your request.",
    icon: Icons.person_add,
  ),
  NotificationModel(
    title: "New login",
    description: "New login from 192.168.1.1",
    icon: Icons.home_outlined,
  ),
];
