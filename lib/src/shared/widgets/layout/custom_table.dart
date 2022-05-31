import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/shared/widgets/container/pager.dart';
import 'package:sura_flutter/sura_flutter.dart';

class MyCustomDataTable<T extends Object> extends StatefulWidget {
  final List<String> columns;
  final List<DataRow> rows;
  final double dataRowHeight;
  final double headingRowHeight;
  final PaginationPager? pager;
  final bool isLoading;
  final List<T> data;
  final FutureOr<void> Function(T)? onEdit;
  final FutureOr<void> Function(T)? onView;
  final FutureOr<void> Function(T)? onDelete;
  final Widget? createButton;
  const MyCustomDataTable({
    Key? key,
    required this.columns,
    required this.rows,
    required this.dataRowHeight,
    required this.headingRowHeight,
    required this.isLoading,
    required this.data,
    this.pager,
    this.onEdit,
    this.onView,
    this.onDelete,
    this.createButton,
  }) : super(key: key);

  @override
  State<MyCustomDataTable<T>> createState() => _MyCustomDataTableState<T>();
}

class _MyCustomDataTableState<T extends Object> extends State<MyCustomDataTable<T>> {
  List get _dummyRowList => List.generate(widget.data.length, (index) => index);
  List get _dummyColumnList => List.generate(widget.columns.length, (index) => index);

  //
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const headerStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );

    const actionPaneWidth = 84.0;
    return ListView(
      children: [
        _buildTableAction(),
        const SpaceY(16),
        Scrollbar(
          controller: scrollController,
          isAlwaysShown: true,
          scrollbarOrientation: ScrollbarOrientation.bottom,
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(
                  bottom: 16,
                  right: actionPaneWidth,
                ),
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: context.screenSize.width - 400,
                  child: DataTable(
                    headingTextStyle: headerStyle,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    headingRowHeight: widget.headingRowHeight,
                    dataRowHeight: widget.dataRowHeight,
                    columns: [
                      for (var col in widget.columns) DataColumn(label: Text(col)),
                    ],
                    rows: widget.isLoading ? _buildLoadingRows() : widget.rows,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(left: BorderSide(width: 0.2, color: Colors.grey)),
                  ),
                  child: SizedBox(
                    width: actionPaneWidth,
                    child: Column(
                      children: [
                        SizedBox(
                          height: widget.headingRowHeight,
                          child: const Center(child: Text("Action", style: headerStyle)),
                        ),
                        const Divider(height: 0),
                        for (var index in _dummyRowList)
                          SizedBox(
                            height: widget.dataRowHeight,
                            child: _buildActionButton(index),
                          ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        if (widget.pager != null) widget.pager!,
      ],
    );
  }

  Widget _buildActionButton(int rowIndex) {
    return Column(
      children: [
        Expanded(
          child: PopupMenuButton<int>(
            onSelected: (index) {
              switch (index) {
                case 1:
                  widget.onView?.call(widget.data[rowIndex]);
                  break;
                case 2:
                  widget.onEdit?.call(widget.data[rowIndex]);
                  break;
                case 3:
                  widget.onDelete?.call(widget.data[rowIndex]);
                  break;
                default:
                  break;
              }
            },
            itemBuilder: (context) {
              return [
                if (widget.onEdit != null) const PopupMenuItem(child: Text("View"), value: 1),
                if (widget.onEdit != null) const PopupMenuItem(child: Text("Edit"), value: 2),
                if (widget.onEdit != null) const PopupMenuItem(child: Text("Delete"), value: 3),
              ];
            },
          ),
        ),
        if (rowIndex != _dummyRowList.last) const Divider(height: 0),
      ],
    );
  }

  List<DataRow> _buildLoadingRows() {
    return [
      for (var _ in _dummyRowList)
        DataRow(cells: [
          for (var _ in _dummyColumnList)
            DataCell(
              SizedBox(
                height: widget.dataRowHeight,
                width: widget.dataRowHeight,
              ),
            ),
        ])
    ];
  }

  Widget _buildTableAction() {
    return Row(
      children: [
        if (widget.createButton != null) widget.createButton!,
      ],
    );
  }
}
