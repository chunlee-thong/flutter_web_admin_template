import 'package:flutter/material.dart';
import 'package:sura_flutter/sura_flutter.dart';

class Tag extends StatelessWidget {
  final String text;
  const Tag({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: SuraDecoration.radius(4),
      ),
      child: Text(text).textColor(),
    );
  }
}
