import 'package:flutter/material.dart';

import '../../shared/widgets/container/body_layout_container.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BodyLayoutContainer(
      child: Column(
        children: const [
          Text("Dashboard"),
        ],
      ),
    );
  }
}
