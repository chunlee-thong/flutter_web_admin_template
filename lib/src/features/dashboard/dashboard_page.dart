import 'dart:math';

import 'package:flutter/material.dart';

import '../../shared/widgets/container/body_layout_container.dart';
import 'widgets/budget_card.dart';
import 'widgets/task_progress_card.dart';
import 'widgets/total_customer_card.dart';
import 'widgets/total_profit.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int current = 1;

  @override
  Widget build(BuildContext context) {
    return BodyLayoutContainer(
      child: Column(
        children: [
          _buildCardSummary(),
        ],
      ),
    );
  }

  Widget _buildCardSummary() {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraint) {
          double maxWidth = constraint.maxWidth;
          int count = (maxWidth ~/ 335);
          return GridView.count(
            childAspectRatio: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            crossAxisCount: max(count, 1),
            children: const [
              BudgetCard(),
              TotalCustomerCard(),
              TaskProgressCard(),
              TotalProfitCard(),
            ],
          );
        },
      ),
    );
  }
}
