import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:skadi/skadi.dart';

import 'widgets/budget_card.dart';
import 'widgets/task_progress_card.dart';
import 'widgets/total_customer_card.dart';
import 'widgets/total_profit.dart';
import 'widgets/weekly_sales_chart.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int current = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardSummary(),
          const SpaceY(24),
          if (!kIsWeb) //Web doesn't support chart yet
            const WeeklySaleChart(),
        ],
      ),
    );
  }

  Widget _buildCardSummary() {
    return LayoutBuilder(
      builder: (context, constraint) {
        double maxWidth = constraint.maxWidth;
        int count = (maxWidth ~/ 335);

        return GridView.count(
          shrinkWrap: true,
          padding: const EdgeInsets.all(4),
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
    );
  }
}
