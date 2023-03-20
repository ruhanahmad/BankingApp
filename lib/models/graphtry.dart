import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/pages/login/models/dob.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:d_chart/d_chart.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
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

  class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
class Paga extends StatefulWidget {

  @override
  State<Paga> createState() => _PagaState();
}

class _PagaState extends State<Paga> {
   
    final Color? barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;
Map<String, double> dataMap = {
    "Limit": userController.numz,
    "Spending": userController.jj,
    // "Xamarin": 2,
    // "Ionic": 2,
  };
    final List<Color> availableColors =  [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
   

   return
Scaffold(

  appBar: AppBar(
      iconTheme: IconThemeData(
    color: Colors.black, //change your color here
  ),
    title: Text("Analysis",style: TextStyle(color: Colors.black)),


  ),
  body: SingleChildScrollView(
    child: Column(
      children: [
        Text("Balance",style: TextStyle(color: Colors.black)),
        Container(
          height: 500,
          width: 500,
          child: SfCartesianChart(
            series: <ColumnSeries>[
              ColumnSeries<ChartData, String>(
                dataSource: userController.chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
              )
            ],
            primaryXAxis: CategoryAxis(),
          ),
        ),
        Text("Analysis",style: TextStyle(color: Colors.black)),
              Center(
                        child: Container(
                          height: 400,
                          width: 400,
                          child:
                          PieChart(
                          dataMap: dataMap,
                        chartType: ChartType.disc,
                          baseChartColor: Colors.grey[300]!,
                          colorList: availableColors,
                        ),
        
                        )
                      ),
  
      ],
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