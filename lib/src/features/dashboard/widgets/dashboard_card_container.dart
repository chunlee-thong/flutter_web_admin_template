import 'package:flutter/material.dart';
import 'package:sura_flutter/sura_flutter.dart';

import '../../../app/constant/app_style_decoration.dart';
import '../../../app/constant/app_theme_color.dart';

TextStyle get dashboardCardTitleStyle {
  return kSubtitleStyle.bold.setColor(AppColor.grey1).copyWith(
        letterSpacing: 1.5,
      );
}

abstract class DashboardCardContainer extends StatelessWidget {
  const DashboardCardContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: SuraDecoration.radius(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            spreadRadius: 2,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: dashboardCardTitleStyle,
                  ),
                  const SpaceY(),
                  Text(value, style: kBigHeaderStyle),
                  const SpaceY(24),
                  footer(),
                ],
              ),
            ),
            SuraIconButton(
              onTap: () {},
              backgroundColor: cardIcon.color,
              borderRadius: 32,
              icon: cardIcon.icon,
            ),
          ],
        ),
      ),
    );
  }

  String get title;
  String get value;
  Widget footer();
  DashboardCardIcon get cardIcon;
}

class DashboardCardIcon {
  final Color color;
  final Widget icon;

  DashboardCardIcon(this.color, this.icon);
}
