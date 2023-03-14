import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/pages/login/models/dob.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:pie_chart/pie_chart.dart';


import 'package:d_chart/d_chart.dart';
// import 'package:number_display/number_display.dart';

// import 'liquid_script.dart' show liquidScript;
// import 'gl_script.dart' show glScript;
// import 'dark_theme_script.dart' show darkThemeScript;


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

  
// TooltipBehavior? _tooltipBehavior;

// @override
// void initState(){
//   _tooltipBehavior = TooltipBehavior(enable: true);
//   super.initState();
// }

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
    List hh = [
      "domain",
      "kkkl",
      "dadad",
      "asd2qw",
      "asasazzz"
    ];
        List hhk = [
      2,
      2,
      2,
      3,
      12
    ];
  return Scaffold(
    body: 
    SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            //  for(var i=0;i<hh.length;i++)
    
                  Center(
                      child: Container(
                        height: 400,
                        width: 400,
                        child:
                        PieChart(
                         chartType: ChartType.disc,
                        dataMap: dataMap,
                        // chartType: ChartType.ring,
                        baseChartColor: Colors.grey[300]!,
                        colorList: widget.availableColors,
                      ),
      
                      )
                    ),

                    
          
          
          ],
        ),
      ),
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

