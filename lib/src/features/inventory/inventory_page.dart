import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_admin_template/src/app/router/main_router.dart';
import 'package:flutter_web_admin_template/src/features/inventory/data/product_model.dart';
import 'package:flutter_web_admin_template/src/shared/widgets/layout/custom_table.dart';
import 'package:go_router/go_router.dart';
import 'package:sura_flutter/sura_flutter.dart';
import 'package:sura_manager/sura_manager.dart';

import 'widgets/add_product_dialog.dart';

// final FutureManager<List<DummyProduct>> productListManager = FutureManager(
//   reloading: false,
//   cacheOption: const ManagerCacheOption(cacheTime: Duration(minutes: 1)),
//   futureFunction: () async {
//     await SuraUtils.wait(500);
//     return Future.value(kProductList);
//   },
// );

final productListProvider = Provider<FutureManager<List<DummyProduct>>>(
  (ref) {
    final FutureManager<List<DummyProduct>> productListManager = FutureManager(
      reloading: false,
      futureFunction: () async {
        await SuraUtils.wait(500);
        return Future.value(kProductList);
      },
    );

    return productListManager;
  },
);

class InventoryPage extends ConsumerStatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  ConsumerState<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends ConsumerState<InventoryPage> {
  late final productListManager = ref.watch(productListProvider);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    infoLog("rebuild inventory");
    return productListManager.when(
      ready: (products) => MyCustomDataTable<DummyProduct>(
        columns: const ["ID", "Product name", "Quantity", "Price"],
        rows: [
          for (var product in products)
            DataRow(
              cells: [
                DataCell(Text("${product.id}")),
                DataCell(Text(product.name)),
                DataCell(Text("${product.quantity}")),
                DataCell(Text("${product.price}")),
              ],
            ),
        ],
        onEdit: (data) async {
          showDialog(context: context, builder: (c) => AddEditProductDialog(product: data));
        },
        onDelete: (data) {
          kProductList.removeWhere((element) => element.id == data.id);
          productListManager.updateData(kProductList);
        },
        onView: (data) {
          context.push("${AppRoutes.productDetail}/${data.id}");
        },
        createButton: ElevatedButton.icon(
          onPressed: () {
            showDialog(context: context, builder: (c) => const AddEditProductDialog());
          },
          icon: const Icon(Icons.add),
          label: const Text("Create"),
        ),
        dataRowHeight: 64,
        headingRowHeight: 64,
        isLoading: false,
        data: products,
      ),
    );
  }
}
