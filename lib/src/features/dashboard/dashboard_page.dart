import 'package:flutter/material.dart';

import '../../shared/widgets/container/body_layout_container.dart';
import '../../shared/widgets/container/pager.dart';

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
          const Text("Dashboard"),
          PaginationPager(
            currentPage: current,
            totalPage: 20,
            onChanged: (page) {
              setState(() {
                current = page;
              });
            },
          ),
        ],
      ),
    );
  }
}
