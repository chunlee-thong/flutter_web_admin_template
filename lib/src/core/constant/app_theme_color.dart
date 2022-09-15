import 'package:flutter/material.dart';
import 'package:skadi/skadi.dart';

class AppColor {
  static const Color primary = Color.fromARGB(255, 96, 5, 182);
  static MaterialColor get primaryMaterial => SkadiColor.toMaterial(primary);

  static const Color grey1 = Color(0xFF738392);
}
