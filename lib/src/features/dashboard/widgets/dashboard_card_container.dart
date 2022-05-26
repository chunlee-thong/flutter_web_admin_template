import 'package:flutter/material.dart';
import 'package:sura_flutter/sura_flutter.dart';

import '../../../app/constant/app_style_decoration.dart';
import '../../../app/constant/app_theme_color.dart';

abstract class DashboardCardContainer extends StatelessWidget {
  const DashboardCardContainer({Key? key}) : super(key: key);

  TextStyle get cardTitleStyle => kSubtitleStyle.bold.setColor(AppColor.grey1).copyWith(
        letterSpacing: 1.5,
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 1.5,
      shape: SuraDecoration.roundRect(8),
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
                    style: cardTitleStyle,
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
