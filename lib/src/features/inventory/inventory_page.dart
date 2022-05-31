import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/features/inventory/data/product_model.dart';
import 'package:flutter_web_admin_template/src/shared/widgets/layout/custom_table.dart';
import 'package:sura_manager/sura_manager.dart';

import '../../shared/widgets/container/body_layout_container.dart';
import 'widgets/add_product_dialog.dart';

final FutureManager<List<DummyProduct>> productListManager = FutureManager(reloading: false);

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  void initState() {
    productListManager.asyncOperation(() => Future.value(kProductList));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BodyLayoutContainer(
      child: productListManager.when(
        ready: (products) => MyCustomDataTable<DummyProduct>(
          columns: const ["No", "Product name", "Quantity", "Price"],
          onEdit: (data) async {
            showDialog(context: context, builder: (c) => AddEditProductDialog(product: data));
          },
          onDelete: (data) {
            kProductList.removeWhere((element) => element.no == data.no);
            productListManager.updateData(kProductList);
          },
          createButton: ElevatedButton.icon(
            onPressed: () {
              showDialog(context: context, builder: (c) => const AddEditProductDialog());
            },
            icon: const Icon(Icons.add),
            label: const Text("Create"),
          ),
          rows: [
            for (var product in products)
              DataRow(
                cells: [
                  DataCell(Text("${product.no}")),
                  DataCell(Text(product.name)),
                  DataCell(Text("${product.quantity}")),
                  DataCell(Text("${product.price}")),
                ],
              ),
          ],
          dataRowHeight: 64,
          headingRowHeight: 64,
          isLoading: false,
          data: products,
        ),
      ),
    );
  }
}
