import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartHome extends StatefulWidget {
  @override
  _LineChartHomeState createState() => _LineChartHomeState();
}

class _LineChartHomeState extends State<LineChartHome> {
  final xLabels = {1: 'A', 3: 'B', 5: 'C', 7: 'D'};
  final yLabels = {2: '2m', 4: '4m', 6: '6m', 8: '8m'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line Chart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text('Title of the Chart'),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                    Colors.black,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              width: 400,
              height: 350,
              // color: Colors.amber,
              child: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.07),
                  // height: 300,
                  // width: 350,
                  child: LineChart(
                    data(),
                    swapAnimationDuration: const Duration(milliseconds: 850),
                  )),
              // testLine()),
            )
          ],
        ),
      ),
    );
  }

  LineChartData data() {
    return LineChartData(
      borderData: FlBorderData(show: false),
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {
          print('Callback');
        },
        handleBuiltInTouches: true,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin: 10,
          // bottomTitles: SideTitles(
          // showTitles: true,
          getTitles: (value) => xLabels[value.toInt()],
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTitles: (value) => yLabels[value.toInt()],
        ),
      ),
      minX: 0,
      maxX: 9,
      maxY: 10,
      minY: 0,
      lineBarsData: barData(),
    );
  }

  List<LineChartBarData> barData() {
    return [
      LineChartBarData(
        isCurved: true,
        spots: List.generate(9, (i) => FlSpot(i.toDouble(), i.toDouble())),
        colors: [
          Colors.cyan,
        ],
      ),
      LineChartBarData(
        isCurved: true,
        spots:
            List.generate(9, (i) => FlSpot(i.toDouble() + 1, i.toDouble() / 2)),
        colors: [
          const Color(0xff4af699),
        ],
      )
    ];
  }
}
