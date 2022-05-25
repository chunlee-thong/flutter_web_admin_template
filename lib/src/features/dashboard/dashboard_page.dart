import 'package:flutter/material.dart';

import '../../shared/widgets/container/body_layout_container.dart';
import 'widgets/budget_card.dart';
import 'widgets/task_progress_card.dart';
import 'widgets/total_customer_card.dart';

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
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          BudgetCard(),
          TotalCustomerCard(),
          TaskProgressCard(),
        ],
      ),
    );
  }
}
