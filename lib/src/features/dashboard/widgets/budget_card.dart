import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/core/constant/app_style_decoration.dart';
import 'package:skadi/skadi.dart';

import 'dashboard_card_container.dart';

class BudgetCard extends DashboardCardContainer {
  const BudgetCard({Key? key}) : super(key: key);

  @override
  String get title => "budget";

  @override
  String get value => "\$24K";

  @override
  Widget footer() {
    return Row(
      children: [
        const Icon(Icons.arrow_downward, color: Colors.red),
        Text("12% ", style: kNormalStyle.red),
        Text("Since last month", style: kNormalStyle.grey),
      ],
    );
  }

  @override
  DashboardCardIcon get cardIcon => DashboardCardIcon(
        Colors.red,
        const Icon(
          Icons.money,
          color: Colors.white,
        ),
      );
}
