import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/features/customer/data/customer_model.dart';
import 'package:flutter_web_admin_template/src/shared/widgets/common/tag.dart';
import 'package:sura_flutter/sura_flutter.dart';
import 'package:sura_manager/sura_manager.dart';

import '../../shared/widgets/container/pager.dart';
import '../../shared/widgets/layout/custom_table.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> with AutomaticKeepAliveClientMixin {
  FutureManager<List<CustomerModel>> customerManager = FutureManager();
  final ScrollController scrollController = ScrollController();

  int total = 0;
  int page = 1;
  int limit = 10;

  Future fetchData() async {
    customerManager.asyncOperation(
      () async {
        var response = await Dio().get("https://express-boilerplate-dev.lynical.com/api/user/all", queryParameters: {
          "page": page,
          "count": limit,
        });
        total = response.data['pagination']['total_items'];
        final list = response.data["data"] as List;
        infoLog("Fetch data on page: $page, data: ${list.length}");
        List<CustomerModel> newData = list.map((e) => CustomerModel.fromJson(e)).toList();
        return newData;
      },
      reloading: false,
    );
  }

  @override
  void initState() {
    infoLog("double render");
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    customerManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureManagerBuilder<List<CustomerModel>>(
      futureManager: customerManager,
      ready: (context, customers) {
        return MyCustomDataTable<CustomerModel>(
          data: customers,
          isLoading: customerManager.isRefreshing,
          onEdit: (data) async {},
          pager: PaginationPager(
            currentPage: page,
            totalPage: total ~/ limit,
            onChanged: (page) {
              this.page = page;
              fetchData();
            },
          ),
          headingRowHeight: 64,
          dataRowHeight: 64,
          columns: const [
            "Profile",
            'Name',
            "Email",
            "Role",
            //
            "Role",
            "Role",
            "Role",
            "Role",
            "Role",
            "Role",
          ],
          rows: [
            for (var customer in customers)
              DataRow(
                cells: [
                  DataCell(CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      SuraUtils.unsplashImage(
                        category: "person",
                        width: 201 + customers.indexOf(customer),
                      ),
                    ),
                  )),
                  DataCell(Text("${customer.firstName} ${customer.lastName}")),
                  DataCell(Text(customer.email)),
                  DataCell(Tag(text: customer.role.toUpperCase())),
                  //
                  DataCell(Tag(text: customer.role.toUpperCase())),
                  DataCell(Tag(text: customer.role.toUpperCase())),
                  DataCell(Tag(text: customer.role.toUpperCase())),
                  DataCell(Tag(text: customer.role.toUpperCase())),
                  DataCell(Tag(text: customer.role.toUpperCase())),
                  DataCell(Tag(text: customer.role.toUpperCase())),
                ],
              )
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
