import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_admin_template/src/core/constant/app_style_decoration.dart';
import 'package:flutter_web_admin_template/src/features/dashboard/widgets/dashboard_card_container.dart';
import 'package:skadi/skadi.dart';

class WeeklySaleChart extends StatelessWidget {
  const WeeklySaleChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        double width = constraint.maxWidth >= 800 ? constraint.maxWidth / 2 : constraint.maxWidth;
        return SizedBox(
          width: width,
          child: Card(
            margin: const EdgeInsets.only(right: 8),
            elevation: 1.5,
            shape: SkadiDecoration.roundRect(8),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text("WEEKLY SALES", style: dashboardCardTitleStyle),
                  const SpaceY(32),
                  SizedBox(
                    height: 200,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          for (var drink in _drinkList)
                            PieChartSectionData(
                              title: drink.name,
                              titleStyle: kNormalStyle.bold.black,
                              value: drink.percent,
                              color: drink.color,
                              titlePositionPercentageOffset: 1.6,
                              badgeWidget: Text(
                                "${drink.percent} %",
                                style: kCaptionStyle.white,
                              ),
                            ),
                        ],
                      ),
                    ),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Drink {
  final Color color;
  final String name;
  final double percent;

  _Drink(this.color, this.name, this.percent);
}

final _drinkList = [
  _Drink(Colors.red, "Sting", 25.0),
  _Drink(Colors.black, "Coca", 36.6),
  _Drink(Colors.blue, "Vigor", 36.4),
  _Drink(Colors.orangeAccent, "Fanta", 14),
];
