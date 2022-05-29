import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/app/constant/app_style_decoration.dart';
import 'package:sura_flutter/sura_flutter.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CircleAvatar(
          radius: 32,
          child: Icon(Icons.dashboard),
        ),
        SpaceY(),
        Text("Admin Dashboard", style: kBigHeaderStyle),
      ],
    );
  }
}
