import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/app/constant/app_style_decoration.dart';
import 'package:flutter_web_admin_template/src/features/inventory/data/product_model.dart';
import 'package:flutter_web_admin_template/src/features/inventory/inventory_page.dart';
import 'package:sura_flutter/sura_flutter.dart';

class AddProductDialog extends StatelessWidget {
  const AddProductDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Add Product", style: kTitleStyle),
            const SpaceY(24),
            const TextField(
              decoration: InputDecoration(hintText: "No"),
            ),
            const SpaceY(16),
            const TextField(
              decoration: InputDecoration(hintText: "Name"),
            ),
            const SpaceY(16),
            const TextField(
              decoration: InputDecoration(hintText: "Quantity"),
            ),
            const SpaceY(16),
            const TextField(
              decoration: InputDecoration(hintText: "Price"),
            ),
            const SpaceY(16),
            SuraAsyncButton(
              onPressed: () async {
                await SuraUtils.wait();
                await productListManager.modifyData(
                  (p0) => [
                    if (p0 != null) ...p0,
                    const DummyProduct(no: 2, name: "Pepsi", quantity: 24, price: 12.99),
                  ],
                );
                Navigator.pop(context);
              },
              child: const Text("Add"),
            )
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}
