import 'package:ewsapp/screens/graphscreen.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartWidget extends StatelessWidget {
  LineChartWidget({super.key, required this.points});
  List<GraphPoint> points;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 5, 62, 109),
          borderRadius: BorderRadius.all(Radius.circular(26))),
      child: LineChart(
        LineChartData(
          // minX: -1.5,
          // maxX: 1.5,
          // minY: -1000,
          // maxY: 1000,
          //titlesData: LineTitles.getTitleData(),
          gridData: FlGridData(
            show: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            //drawVerticalLine: true,
            // getDrawingVerticalLine: (value) {
            //   return FlLine(
            //     color: const Color(0xff37434d),
            //     strokeWidth: 1,
            //   );
            // },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: points
                  .map(
                    (point) => FlSpot(point.x, point.y),
                  )
                  .toList(),
              isCurved: true,
              color: Colors.blue,

              barWidth: 5,
              //dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}
