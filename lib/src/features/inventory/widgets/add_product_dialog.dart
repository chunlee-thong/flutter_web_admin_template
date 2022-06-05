import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_admin_template/src/app/constant/app_style_decoration.dart';
import 'package:flutter_web_admin_template/src/features/inventory/data/product_model.dart';
import 'package:sura_flutter/sura_flutter.dart';

import '../inventory_page.dart';

class AddEditProductDialog extends ConsumerStatefulWidget {
  final DummyProduct? product;
  const AddEditProductDialog({Key? key, this.product}) : super(key: key);

  @override
  ConsumerState<AddEditProductDialog> createState() => _AddEditProductDialogState();
}

class _AddEditProductDialogState extends ConsumerState<AddEditProductDialog> {
  late final bool isEdit = widget.product != null;
  late TextEditingController nameTC, noTC, qtyTC, priceTC;

  late final productListManager = ref.read(productListProvider);

  @override
  void initState() {
    noTC = TextEditingController(text: "${widget.product?.id ?? "2"}");
    nameTC = TextEditingController(text: widget.product?.name ?? "Pepsi");
    qtyTC = TextEditingController(text: "${widget.product?.quantity ?? "24"}");
    priceTC = TextEditingController(text: "${widget.product?.price ?? "24.99"}");
    super.initState();
  }

  @override
  void dispose() {
    nameTC.dispose();
    noTC.dispose();
    qtyTC.dispose();
    priceTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(isEdit ? "Edit Product" : "Add Product", style: kTitleStyle),
            const SpaceY(24),
            TextFormField(
              controller: noTC,
              decoration: const InputDecoration(hintText: "ID"),
            ),
            const SpaceY(16),
            TextFormField(
              controller: nameTC,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            const SpaceY(16),
            TextFormField(
              controller: qtyTC,
              decoration: const InputDecoration(hintText: "Quantity"),
            ),
            const SpaceY(16),
            TextFormField(
              controller: priceTC,
              decoration: const InputDecoration(hintText: "Price"),
            ),
            const SpaceY(16),
            SuraAsyncButton(
              onPressed: () async {
                await SuraUtils.wait();
                final dummy = DummyProduct(
                  id: int.parse(noTC.text),
                  name: nameTC.text,
                  quantity: int.parse(qtyTC.text),
                  price: double.parse(priceTC.text),
                );
                if (isEdit) {
                  kProductList[0] = dummy;
                } else {
                  kProductList.add(dummy);
                }
                productListManager.updateData(kProductList);
                Navigator.pop(context);
              },
              child: Text(isEdit ? "Edit" : "Add"),
            )
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}
