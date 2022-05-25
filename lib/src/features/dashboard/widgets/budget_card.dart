import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/app/constant/app_style_decoration.dart';
import 'package:flutter_web_admin_template/src/app/constant/app_theme_color.dart';
import 'package:sura_flutter/sura_flutter.dart';

import 'dashboard_card_container.dart';

class BudgetCard extends DashboardCardContainer {
  const BudgetCard({Key? key}) : super(key: key);

  @override
  Widget content(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "BUDGET",
                style: kSubtitleStyle.bold.setColor(AppColor.grey1).copyWith(
                      letterSpacing: 1.5,
                    ),
              ),
              const SpaceY(),
              const Text(
                "\$24K",
                style: kBigHeaderStyle,
              ),
              const SpaceY(24),
              Row(
                children: [
                  const Icon(Icons.arrow_downward, color: Colors.red),
                  Text("12% ", style: kNormalStyle.red),
                  Text("Since last month", style: kNormalStyle.grey),
                ],
              )
            ],
          ),
        ),
        SuraIconButton(
          onTap: () {},
          backgroundColor: Colors.red,
          borderRadius: 32,
          icon: const Icon(
            Icons.money,
            color: Colors.white,
            size: 32,
          ),
        ),
      ],
    );
  }
}
