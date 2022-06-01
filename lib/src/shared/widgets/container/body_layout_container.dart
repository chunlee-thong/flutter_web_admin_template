import 'package:flutter/material.dart';
import 'package:sura_flutter/sura_flutter.dart';

class BodyLayoutContainer extends StatelessWidget {
  final Widget child;
  const BodyLayoutContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(SuraResponsive.value(16, 24, 32)),
        child: child,
      ),
    );
  }
}
