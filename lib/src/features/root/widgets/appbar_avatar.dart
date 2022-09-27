import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:skadi/skadi.dart';

import '../../../core/provider/auth_provider.dart';

class AppBarAvatar extends StatelessWidget {
  const AppBarAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = GetIt.I.get<AuthProvider>();
    return PopupMenuButton<int>(
      icon: CircleAvatar(
        backgroundImage: NetworkImage(
          SkadiUtils.unsplashImage(category: "person"),
        ),
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 2,
            onTap: () {},
            child: const ListTile(
              mouseCursor: MouseCursor.defer,
              title: Text("Profile"),
              trailing: Icon(Icons.person),
            ),
          ),
          PopupMenuItem(
            value: 1,
            onTap: () {
              authProvider.logoutUser(context);
            },
            child: const ListTile(
              mouseCursor: MouseCursor.defer,
              title: Text("Logout"),
              trailing: Icon(Icons.logout),
            ),
          ),
        ];
      },
    );
  }
}
