import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:provider/provider.dart';

class Chart extends StatelessWidget {
  final String pieCharttext;
  final String piechartfield;
  final String piechartvalue;
  Chart({super.key, required this.pieCharttext, required this.piechartfield, required this.piechartvalue});
 
  List<PieChartSectionData> get paiChartSelectionData => [
    PieChartSectionData(
      color: Color(0xFFCE6462),
      value: double.parse(piechartvalue),
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
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
  
    return SizedBox(
      height:MediaQuery.of(context).size.width>350? 120:170,
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
                pieCharttext,
                style: TextStyle(
                    color:isDark?AppColor.black: AppColor.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,fontFamily: "hel",
                    height: 0.5),
              ),
              SizedBox(
                height: 8,
              ),
              Text(piechartfield,style: TextStyle(color: AppColor.blue,fontFamily: "hel",),)
            ],
          ))
        ],
      ),
    );
  }
}