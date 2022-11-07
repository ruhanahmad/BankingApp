// import 'package:bnacash/constants/constants.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class BarChartSample1 extends StatefulWidget {
//   final List<Color> availableColors = const [
//     Colors.purpleAccent,
//     Colors.yellow,
//     Colors.lightBlue,
//     Colors.orange,
//     Colors.pink,
//     Colors.redAccent,
//   ];

//   const BarChartSample1({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => BarChartSample1State();
// }

// class BarChartSample1State extends State<BarChartSample1> {
//   final Color? barBackgroundColor = const Color(0xff72d8bf);
//   final Duration animDuration = const Duration(milliseconds: 250);

//   int touchedIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.2,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 2.0),
//         child: BarChart(
//           mainBarData(),
//           swapAnimationDuration: animDuration,
//         ),
//       ),
//     );
//   }

//   BarChartGroupData makeGroupData(
//     int x,
//     double y, {
//     bool isTouched = false,
//     Color barColor = Colors.blue,
//     double width = 16,
//     List<int> showTooltips = const [],
//   }) {
//     return BarChartGroupData(
//       x: x,
//       barRods: [
//         BarChartRodData(
//           y: isTouched ? y + 1 : y,
//           colors: isTouched ? [Colors.yellow] : [kTertiaryColor],
//           width: width,
//           borderSide: isTouched
//               ? const BorderSide(color: Colors.yellow, width: 1)
//               : const BorderSide(color: Colors.blue, width: 0),
//           backDrawRodData: BackgroundBarChartRodData(
//             show: true,
//             y: 20,
//             color: [barBackgroundColor!],
//           ),
//         ),
//       ],
//       showingTooltipIndicators: showTooltips,
//     );
//   }

//   List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
//         switch (i) {
//           case 0:
//             return makeGroupData(0, 5, isTouched: i == touchedIndex);
//           case 1:
//             return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
//           case 2:
//             return makeGroupData(2, 5, isTouched: i == touchedIndex);
//           case 3:
//             return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
//           case 4:
//             return makeGroupData(4, 9, isTouched: i == touchedIndex);
//           case 5:
//             return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
//           case 6:
//             return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
//           default:
//             return throw Error();
//         }
//       });

//   BarChartData mainBarData() {
//     return BarChartData(
//       barTouchData: BarTouchData(
//         touchTooltipData: BarTouchTooltipData(
//             tooltipBgColor: Colors.blueGrey,
//             getTooltipItem: (group, groupIndex, rod, rodIndex) {
//               String weekDay;
//               switch (group.x.toInt()) {
//                 case 0:
//                   weekDay = 'Monday';
//                   break;
//                 case 1:
//                   weekDay = 'Tuesday';
//                   break;
//                 case 2:
//                   weekDay = 'Wednesday';
//                   break;
//                 case 3:
//                   weekDay = 'Thursday';
//                   break;
//                 case 4:
//                   weekDay = 'Friday';
//                   break;
//                 case 5:
//                   weekDay = 'Saturday';
//                   break;
//                 case 6:
//                   weekDay = 'Sunday';
//                   break;
//                 default:
//                   throw Error();
//               }
//               return BarTooltipItem(
//                 weekDay + '\n',
//                 const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//                 children: <TextSpan>[
//                   TextSpan(
//                     text: (rod.y - 1).toString(),
//                     style: const TextStyle(
//                       color: Colors.yellow,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               );
//             }),
//         touchCallback: (FlTouchEvent event, barTouchResponse) {
//           setState(() {
//             if (!event.isInterestedForInteractions ||
//                 barTouchResponse == null ||
//                 barTouchResponse.spot == null) {
//               touchedIndex = -1;
//               return;
//             }
//             touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
//           });
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         rightTitles: SideTitles(showTitles: false),
//         topTitles: SideTitles(showTitles: false),
//         bottomTitles: SideTitles(
//           showTitles: false,
//         ),
//         leftTitles: SideTitles(
//           showTitles: false,
//         ),
//       ),
//       borderData: FlBorderData(
//         show: false,
//       ),
//       barGroups: showingGroups(),
//       gridData: FlGridData(show: false),
//     );
//   }
// }
