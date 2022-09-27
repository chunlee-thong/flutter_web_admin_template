import 'package:flutter/material.dart';
import 'package:skadi/skadi.dart';

class Tag extends StatelessWidget {
  final String text;
  const Tag({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: SkadiDecoration.radius(8),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
