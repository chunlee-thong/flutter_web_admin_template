import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/app/constant/app_style_decoration.dart';
import 'package:sura_flutter/sura_flutter.dart';

class AppBarNotification extends StatelessWidget {
  const AppBarNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const popupDivider = PopupMenuItem<int>(
      child: Divider0(),
      enabled: false,
      height: 4,
      padding: EdgeInsets.zero,
    );

    //
    return Stack(
      alignment: Alignment.center,
      children: [
        PopupMenuButton<int>(
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.notifications_none),
          enableFeedback: true,
          shape: RoundedRectangleBorder(
            borderRadius: SuraDecoration.radius(6),
            side: const BorderSide(color: Colors.grey, width: 0.5),
          ),
          offset: const Offset(100.0, 50),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                enabled: false,
                child: SizedBox(
                  child: Center(child: Text("7 New Notifications", style: kSubtitleStyle.black)),
                  width: 400,
                ),
              ),
              popupDivider,
              const PopupMenuItem(
                padding: EdgeInsets.zero,
                value: 1,
                child: ListTile(
                  leading: CircleAvatar(child: Icon(Icons.storage)),
                  title: Text("Update complete"),
                  subtitle: Text("Restart server to complete update."),
                ),
              ),
              const PopupMenuItem(
                padding: EdgeInsets.zero,
                value: 1,
                child: ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person_add)),
                  title: Text("New connection"),
                  subtitle: Text("Anna accepted your request."),
                ),
              ),
              const PopupMenuItem(
                padding: EdgeInsets.zero,
                value: 1,
                child: ListTile(
                  leading: CircleAvatar(child: Icon(Icons.home_outlined)),
                  title: Text("New login"),
                  subtitle: Text("New login from 192.168.1.1"),
                ),
              ),
            ];
          },
        ),
        const Positioned(
          child: SuraBadge(text: "3"),
          right: 8,
          top: 8,
        ),
      ],
    );
  }
}
