import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';

// ignore: must_be_immutable
class Chart extends StatelessWidget {
  Chart({super.key});

  List<PieChartSectionData> paiChartSelectionData = [
    PieChartSectionData(
      color: Color(0xFFCE6462),
      value: 20,
      showTitle: false,
      radius: 22,
    ),
    PieChartSectionData(
      color: Color(0xFF4F53CE),
      value: 10,
      showTitle: false,
      radius: 20,
    ),
    PieChartSectionData(
      color: Color(0xFFEEA468),
      value: 15,
      showTitle: false,
      radius: 15,
    ),
    PieChartSectionData(
      color: Color(0xFFA83CE5),
      value: 25,
      showTitle: false,
      radius: 25,
    ),
    PieChartSectionData(
      color: Color(0xFF3395F7),
      value: 25,
      showTitle: false,
      radius: 15,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Stack(
        children: [
          PieChart(PieChartData(
              sectionsSpace: 0.5,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: paiChartSelectionData)),
          Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                "4300",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    height: 0.5),
              ),
              SizedBox(
                height: 8,
              ),
              Text("Employee",style: TextStyle(color: AppColor.blue),)
            ],
          ))
        ],
      ),
    );
  }
}