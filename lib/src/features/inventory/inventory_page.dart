import 'package:flutter/material.dart';

import '../../shared/widgets/container/body_layout_container.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  Widget build(BuildContext context) {
    return const BodyLayoutContainer(
      child: Text("Inventory Page"),
    );
  }
}
