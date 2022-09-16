import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/features/inventory/data/product_model.dart';

import '../inventory/inventory_page.dart';

class ProductDetailPage extends StatefulWidget {
  final int productId;
  const ProductDetailPage({Key? key, required this.productId}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return productListManager.when(
      ready: (data) {
        late DummyProduct product = data.firstWhere((element) => element.id == widget.productId);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${widget.productId}"),
          ],
        );
      },
    );
  }
}
