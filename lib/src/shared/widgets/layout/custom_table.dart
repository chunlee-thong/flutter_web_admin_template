import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/core/constant/app_style_decoration.dart';
import 'package:flutter_web_admin_template/src/features/root/root_page.dart';
import 'package:flutter_web_admin_template/src/features/root/widgets/side_menu_layout.dart';
import 'package:flutter_web_admin_template/src/shared/widgets/container/pager.dart';
import 'package:skadi/skadi.dart';

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
  final Widget? refreshButton;
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
    this.refreshButton,
  }) : super(key: key);

  @override
  State<MyCustomDataTable<T>> createState() => _MyCustomDataTableState<T>();
}

class _MyCustomDataTableState<T extends Object> extends State<MyCustomDataTable<T>> {
  List<int> get _dummyRowList => List.generate(widget.data.length, (index) => index);
  List<int> get _dummyColumnList => List.generate(widget.columns.length, (index) => index);

  //
  final ScrollController scrollController = ScrollController();
  final ScrollController verticalScroll = ScrollController();
  bool get isEmpty => widget.data.isEmpty;
  final GlobalKey tableKey = GlobalKey();

  static const double actionPaneWidth = 84.0;
  ValueNotifier<double?> tableSize = ValueNotifier(null);

  double get getTableWidth {
    double somePadding = 32 + actionPaneWidth;
    double screenWidth = MediaQuery.of(context).size.width;
    bool hasSideMenu = screenWidth > kMenuBreakpoint;
    return (hasSideMenu ? (screenWidth - SideMenuLayout.width) : screenWidth) - somePadding;
  }

  @override
  void dispose() {
    scrollController.dispose();
    verticalScroll.dispose();
    tableSize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const headerStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    final table = DataTable(
      key: tableKey,
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
    );
    return ListView(
      controller: verticalScroll,
      children: [
        _buildTableAction(),
        const SpaceY(16),
        Scrollbar(
          controller: scrollController,
          thumbVisibility: true,
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
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    if (tableSize.value == null) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        RenderBox box = tableKey.currentContext!.findRenderObject() as RenderBox;
                        tableSize.value = box.size.width;
                      });
                    }

                    return ValueListenableBuilder<double?>(
                      valueListenable: tableSize,
                      child: table,
                      builder: (context, width, child) {
                        if (width == null) {
                          return AnimatedOpacity(
                            child: table,
                            opacity: 0.0,
                            duration: Duration.zero,
                          );
                        }

                        if (width < context.screenSize.width) {
                          return SizedBox(
                            child: table,
                            width: getTableWidth,
                          );
                        }
                        return table;
                      },
                    );
                  },
                ),
              ),
              if (isEmpty) _buildNoDataWidget(),
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
                        const Divider(
                          thickness: 0.2,
                          height: 0.5,
                        ),
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
                if (widget.onView != null) const PopupMenuItem(child: Text("View"), value: 1),
                if (widget.onEdit != null) const PopupMenuItem(child: Text("Edit"), value: 2),
                if (widget.onDelete != null) const PopupMenuItem(child: Text("Delete"), value: 3),
              ];
            },
          ),
        ),
        if (rowIndex != _dummyRowList.last) const Divider(height: 0, thickness: 0.2),
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

  Widget _buildNoDataWidget() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: widget.headingRowHeight),
      height: 200,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(height: 0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.storage, size: 32),
                SpaceY(12),
                Text("No data", style: kSubtitleStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableAction() {
    return Row(
      children: [
        if (widget.createButton != null) widget.createButton!,
        const SpaceX(),
        if (widget.refreshButton != null) widget.refreshButton!,
      ],
    );
  }
}
