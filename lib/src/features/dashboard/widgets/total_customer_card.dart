import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/features/dashboard/widgets/dashboard_card_container.dart';
import 'package:sura_flutter/sura_flutter.dart';

import '../../../app/constant/app_style_decoration.dart';
import '../../../app/constant/app_theme_color.dart';

class TotalCustomerCard extends DashboardCardContainer {
  const TotalCustomerCard({Key? key}) : super(key: key);

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
                "TOTAL CUSTOMER",
                style: kSubtitleStyle.bold.setColor(AppColor.grey1).copyWith(
                      letterSpacing: 1.5,
                    ),
              ),
              const SpaceY(),
              const Text(
                "1,5K",
                style: kBigHeaderStyle,
              ),
              const SpaceY(24),
              Row(
                children: [
                  const Icon(Icons.arrow_upward, color: Colors.green),
                  Text("12% ", style: kNormalStyle.green),
                  Text("Since last month", style: kNormalStyle.grey),
                ],
              )
            ],
          ),
        ),
        SuraIconButton(
          onTap: () {},
          backgroundColor: Colors.green,
          borderRadius: 32,
          icon: const Icon(
            Icons.people,
            color: Colors.white,
            size: 32,
          ),
        ),
      ],
    );
  }
}
