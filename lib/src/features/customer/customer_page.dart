import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/features/customer/data/customer_model.dart';
import 'package:flutter_web_admin_template/src/shared/widgets/container/body_layout_container.dart';
import 'package:sura_flutter/sura_flutter.dart';
import 'package:sura_manager/sura_manager.dart';

import '../../shared/widgets/container/pager.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> with AutomaticKeepAliveClientMixin {
  FutureManager<List<CustomerModel>> customerManager = FutureManager();

  int total = 0;
  int page = 1;
  int limit = 5;

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
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    customerManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BodyLayoutContainer(
      child: FutureManagerBuilder<List<CustomerModel>>(
        futureManager: customerManager,
        ready: (context, customers) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: DataTable(
                  showCheckboxColumn: true,
                  dataRowHeight: 100,
                  columns: [
                    for (var col in ["", 'Name', "Email", "Role", "Action"]) DataColumn(label: Text(col)),
                  ],
                  rows: [
                    if (customerManager.isRefreshing)
                      for (var _ in [1, 2, 3, 4, 5])
                        DataRow(
                          cells: [
                            for (var _ in [1, 2, 3, 4, 5])
                              const DataCell(
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                          ],
                        )
                    else
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
                            DataCell(
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: SuraDecoration.radius(4),
                                ),
                                child: Text(
                                  customer.role.toUpperCase(),
                                ).textColor(),
                              ),
                            ),
                            DataCell(
                              PopupMenuButton<int>(
                                onSelected: (index) {},
                                itemBuilder: (context) {
                                  return [
                                    const PopupMenuItem(child: Text("View"), value: 1),
                                    const PopupMenuItem(child: Text("Edit"), value: 2),
                                    const PopupMenuItem(child: Text("Delete"), value: 3),
                                  ];
                                },
                              ),
                            ),
                          ],
                        )
                  ],
                ),
              ),
              PaginationPager(
                currentPage: page,
                totalPage: total,
                onChanged: (page) {
                  this.page = page;
                  fetchData();
                },
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MyDataSource extends DataTableSource {
  final List<CustomerModel> customers;
  final int total;
  MyDataSource({required this.customers, required this.total});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => total;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    if (customers.isEmpty) {
      return DataRow(cells: [
        for (var _ in [1, 2, 3, 4, 5]) const DataCell(emptySizedBox),
      ]);
    }
    final CustomerModel customer = customers[index];
    return DataRow(
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
        DataCell(Text(customer.role)),
        DataCell(
          PopupMenuButton<int>(
            onSelected: (index) {},
            itemBuilder: (context) {
              return [
                const PopupMenuItem(child: Text("View"), value: 1),
                const PopupMenuItem(child: Text("Edit"), value: 2),
                const PopupMenuItem(child: Text("Delete"), value: 3),
              ];
            },
          ),
        ),
      ],
    );
  }
}
