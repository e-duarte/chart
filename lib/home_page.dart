import 'package:flutter/material.dart';
import 'package:chart/pie_chart.dart';
import 'package:chart/line_chart.dart';

class ChartsPage extends StatelessWidget {
  final charts = ['Pie Chart', 'Line Chart'];

  final colors = [
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.blueGrey,
    Colors.lightGreenAccent
  ];

  final pages = [
    PieChartHome(),
    LineChartHome(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('fl_chart package'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(pages.length, (i) {
            return TextButton(
              child: Center(
                child: Text(charts[i]),
              ),
              style: TextButton.styleFrom(
                backgroundColor: colors[i],
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => pages[i]),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
