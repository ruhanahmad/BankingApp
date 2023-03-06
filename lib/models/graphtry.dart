import 'package:bnacash/Controller/userController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:d_chart/d_chart.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

// class BarChartWidget extends StatelessWidget {


//   @override
//   Widget build(BuildContext context) {
//     return 
//      DChartBar(
//       barColor:(barData, index, id) => Colors.green,
//       data:scores,

     
//     );
//   }
// }
class Paga extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    UserController _ = Get.put(UserController());

   return
Scaffold(
  body: Container(
    height: 500,
    width: 500,
    child: SfCartesianChart(
      series: <BarSeries>[
        BarSeries<ChartData, String>(
          dataSource: _.chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
        )
      ],
      primaryXAxis: CategoryAxis(),
    ),
  ),
);
  }
}
class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}