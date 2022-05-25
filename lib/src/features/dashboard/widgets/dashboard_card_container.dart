import 'package:flutter/material.dart';

abstract class DashboardCardContainer extends StatelessWidget {
  const DashboardCardContainer({Key? key}) : super(key: key);

  Widget content(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.only(right: 16),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: content(context),
        ),
      ),
    );
  }
}
