import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/features/dashboard/widgets/dashboard_card_container.dart';
import 'package:skadi/skadi.dart';

class TotalProfitCard extends DashboardCardContainer {
  const TotalProfitCard({Key? key}) : super(key: key);

  @override
  DashboardCardIcon get cardIcon => DashboardCardIcon(
        Colors.purple,
        const Icon(
          Icons.attach_money,
          color: Colors.white,
        ),
      );

  @override
  Widget footer() {
    return emptySizedBox;
  }

  @override
  String get title => "total profit";

  @override
  String get value => "\$23K";
}
