import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_admin_template/src/app/constant/app_theme_color.dart';
import 'package:flutter_web_admin_template/src/features/inventory/data/product_model.dart';
import 'package:flutter_web_admin_template/src/features/inventory/inventory_page.dart';
import 'package:sura_manager/sura_manager.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final int productId;
  const ProductDetailPage({Key? key, required this.productId}) : super(key: key);

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  late FutureManager<List<DummyProduct>> productListManager = ref.read(productListProvider);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return productListManager.when(
      ready: (data) {
        late DummyProduct product = data.firstWhere((element) => element.id == widget.productId);
        return Title(
          title: product.name,
          color: AppColor.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${widget.productId}"),
            ],
          ),
        );
      },
    );
  }
}
