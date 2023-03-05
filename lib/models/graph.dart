import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/login/models/dob.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:pie_chart/pie_chart.dart';

  class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
class BarChartSample1 extends StatefulWidget {

  final List<Color> availableColors =  [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  BarChartSample1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {

  
TooltipBehavior? _tooltipBehavior;

@override
void initState(){
  _tooltipBehavior = TooltipBehavior(enable: true);
  super.initState();
}

  final Color? barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;
Map<String, double> dataMap = {
    "Limit": 6000,
    "Spending": userController.jj,
    // "Xamarin": 2,
    // "Ionic": 2,
  };
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
  return Scaffold(
    body: 
    Center(
        child: Container(
          child:
          PieChart(
          dataMap: dataMap,
          chartType: ChartType.ring,
          baseChartColor: Colors.grey[300]!,
          colorList: widget.availableColors,
        ),
//           charts.PieChart(
//   [
//     charts.Series<MyData, String>(
//       id: 'myData',
//       domainFn: (MyData data, _) => data.category,
//       measureFn: (MyData data, _) => data.value,
//       data: [
//         MyData('Category 1', 5),
//         MyData('Category 2', 10),
//         MyData('Category 3', 15),
//       ],
//     ),
//   ],
// )

          //  SfCartesianChart(

          //   primaryXAxis: CategoryAxis(),
          //   // Chart title
          //   title: ChartTitle(text: 'Half yearly sales analysis'),
          //   // Enable legend
          //   legend: Legend(isVisible: true),
          //   // Enable tooltip
          //   tooltipBehavior: _tooltipBehavior,

          //   series: <LineSeries<SalesData, String>>[
          //     LineSeries<SalesData, String>(
          //       dataSource:  <SalesData>[
          //         SalesData('Jan', 35),
          //         SalesData('Feb', 28),
          //         SalesData('Mar', 34),
          //         SalesData('Apr', 32),
          //         SalesData('May', 40)
          //       ],
          //       xValueMapper: (SalesData sales, _) => sales.year,
          //       yValueMapper: (SalesData sales, _) => sales.sales,
          //       // Enable data label
          //       dataLabelSettings: DataLabelSettings(isVisible: true)
          //     )
          //   ]
          // )
        )
      )
  );


    // AspectRatio(
    //   aspectRatio: 1.2,
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 2.0),
    //     child: 
    //     BarChart(
    //       mainBarData(),
    //       swapAnimationDuration: animDuration,
    //     ),
    //   ),
    // );
  }



 
  }

