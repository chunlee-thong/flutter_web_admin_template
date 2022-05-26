import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/features/dashboard/widgets/dashboard_card_container.dart';

class TaskProgressCard extends DashboardCardContainer {
  const TaskProgressCard({Key? key}) : super(key: key);

  @override
  String get title => "tasks progress";

  @override
  String get value => "54.5%";

  @override
  Widget footer() {
    return const LinearProgressIndicator(value: 0.54);
  }

  @override
  DashboardCardIcon get cardIcon => DashboardCardIcon(
        Colors.orangeAccent,
        const Icon(
          Icons.graphic_eq_outlined,
          color: Colors.white,
        ),
      );
}
