import 'package:flutter/material.dart';
import 'package:sura_flutter/sura_flutter.dart';

class AppColor {
  static const Color primary = Color.fromARGB(255, 96, 5, 182);
  static MaterialColor get primaryMaterial => SuraColor.toMaterial(primary.value);

  static const Color grey1 = Color(0xFF738392);
}
