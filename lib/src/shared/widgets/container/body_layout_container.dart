import 'package:flutter/material.dart';

class BodyLayoutContainer extends StatelessWidget {
  final Widget child;
  const BodyLayoutContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: child,
      ),
    );
  }
}
