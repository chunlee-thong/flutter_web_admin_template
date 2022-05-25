import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/app/constant/app_theme_color.dart';
import 'package:flutter_web_admin_template/src/features/dashboard/widgets/dashboard_card_container.dart';
import 'package:sura_flutter/sura_flutter.dart';

import '../../../app/constant/app_style_decoration.dart';

class TaskProgressCard extends DashboardCardContainer {
  const TaskProgressCard({Key? key}) : super(key: key);

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
                "TASK PROGRESS",
                style: kSubtitleStyle.bold.setColor(AppColor.grey1).copyWith(
                      letterSpacing: 1.5,
                    ),
              ),
              const SpaceY(),
              const Text(
                "34.6%",
                style: kBigHeaderStyle,
              ),
              const SpaceY(24),
              const LinearProgressIndicator(
                value: .6,
              ),
            ],
          ),
        ),
        SuraIconButton(
          onTap: () {},
          backgroundColor: Colors.orangeAccent,
          borderRadius: 32,
          icon: const Icon(
            Icons.auto_graph_outlined,
            color: Colors.white,
            size: 32,
          ),
        ),
      ],
    );
  }
}
