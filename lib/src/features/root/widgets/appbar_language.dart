import 'package:flutter/material.dart';

class AppBarLanguage extends StatelessWidget {
  const AppBarLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(Icons.language),
      initialValue: 1,
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: 1,
            child: Text("English"),
          ),
          const PopupMenuItem(
            value: 2,
            child: Text("Khmer"),
          ),
          const PopupMenuItem(
            value: 3,
            child: Text("Chinese"),
          ),
        ];
      },
    );
  }
}
