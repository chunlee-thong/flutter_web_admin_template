import 'package:flutter/material.dart';
import 'package:skadi/skadi.dart';

class PaginationPager extends StatelessWidget {
  final int totalPage;
  final ValueChanged<int> onChanged;
  final int currentPage;
  const PaginationPager({
    Key? key,
    required this.totalPage,
    required this.onChanged,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double size = 16;
    const emptySpace = Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text("..."));
    final bool startOrEnd = currentPage <= 4 || currentPage >= totalPage - 3;
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: currentPage > 1
                ? () {
                    onChanged(currentPage - 1);
                  }
                : null,
            icon: const Icon(Icons.arrow_back_ios, size: size),
          ),
          if (totalPage > 6) ...[
            _buildPageWrapper(1),
            if (currentPage <= 4) ...[
              for (var i in [2, 3, 4, 5]) _buildPageWrapper(i),
              emptySpace,
            ],
            if (!startOrEnd) ...[
              emptySpace,
              _buildPageWrapper(currentPage - 1),
              _buildPageWrapper(currentPage),
              _buildPageWrapper(currentPage + 1),
              emptySpace,
            ],
            if (currentPage >= totalPage - 3) ...[
              emptySpace,
              for (var i in [4, 3, 2, 1]) _buildPageWrapper(totalPage - i),
            ],
            _buildPageWrapper(totalPage),
          ] else ...[
            for (var i in [1, 2, 3, 4, 5, 6]) _buildPageWrapper(i),
          ],
          IconButton(
            onPressed: currentPage < totalPage
                ? () {
                    onChanged(currentPage + 1);
                  }
                : null,
            icon: const Icon(Icons.arrow_forward_ios, size: size),
          ),
        ],
      ),
    );
  }

  Widget _buildPageWrapper(int page) {
    bool selected = page == currentPage;
    return InkWell(
      onTap: () {
        onChanged.call(page);
      },
      customBorder: const CircleBorder(),
      child: Container(
        width: 36,
        height: 36,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: selected ? Colors.blue : null,
          borderRadius: SkadiDecoration.radius(32),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "$page",
          style: TextStyle(color: selected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
