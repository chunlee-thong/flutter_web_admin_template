import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sura_flutter/sura_flutter.dart';

import '../../../app/provider/auth_provider.dart';

class AppBarAvatar extends StatelessWidget {
  const AppBarAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = GetIt.I.get<AuthProvider>();
    return PopupMenuButton<int>(
      icon: CircleAvatar(
        backgroundImage: NetworkImage(
          SuraUtils.unsplashImage(category: "person"),
        ),
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 1,
            onTap: () {},
            child: const ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout),
            ),
          ),
        ];
      },
    );
  }
}
