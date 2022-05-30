import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/app/constant/app_style_decoration.dart';
import 'package:flutter_web_admin_template/src/app/models/others/notification_model.dart';
import 'package:sura_flutter/sura_flutter.dart';

class AppBarNotification extends StatelessWidget {
  const AppBarNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const popupDivider = PopupMenuItem<String>(
      child: Divider0(),
      enabled: false,
      height: 4,
      padding: EdgeInsets.zero,
    );

    //
    return Stack(
      alignment: Alignment.center,
      children: [
        PopupMenuButton<String>(
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
              for (var notification in kNotificationList)
                PopupMenuItem(
                  padding: EdgeInsets.zero,
                  value: notification.title,
                  child: ListTile(
                    mouseCursor: MouseCursor.defer,
                    leading: CircleAvatar(child: Icon(notification.icon)),
                    title: Text(notification.title),
                    subtitle: Text(notification.description),
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
