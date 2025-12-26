import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_page/model/bottom_card_model.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/responsive.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:login_page/views/widgets/chart.dart';
import 'package:provider/provider.dart';

class ChartCard extends StatelessWidget {
  final BottomCardModel bottomCardModel;

  const ChartCard({super.key, required this.bottomCardModel});

  @override
  Widget build(BuildContext context) {
       final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
      
    return Container(
      padding: EdgeInsets.all(!Responsive.isMobile(context) ? 15 : 10),
      decoration: BoxDecoration(
        color:isDark? AppColor.white:
         AppColor.clrBoxBackground,
        boxShadow: [BoxShadow(color: Color(0xff333333), spreadRadius: 1)],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  stops: [0.1, 0.9],
                  colors: [AppColor.clrGradient1, AppColor.clrGradient2],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Icon(bottomCardModel.iconData, color: AppColor.clrWhite),
            ),
            SizedBox(height: 10),
            Text(
              bottomCardModel.title!,
              maxLines: 1,
              style: TextStyle(
                color:isDark? AppColor.black : AppColor.clrBigText,
                fontSize: Responsive.isMobile(context) ? 11 : 12,
                overflow: TextOverflow.ellipsis, fontFamily: "hel",
              ),
            ),
            SizedBox(height: 10),
        
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (
                        var i = 0; i < bottomCardModel.graphData!.length; i++
                      )
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: bottomCardModel.graphData![i].color,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      bottomCardModel.graphData![i].title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 13, fontFamily: "hel",
                                        color:isDark? AppColor.black : AppColor.clrBigText,
                                      ),
                                    ),
                                    Text(
                                      bottomCardModel.graphData![i].subTitle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 10, fontFamily: "hel",
                                        color: AppColor.clrSmallText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                   
                    child: bottomCardModel.type == 0
                        ? Chart(pieCharttext:"2500",piechartfield: AppText.employes.tr(),piechartvalue: "20",)
                        : Chart(pieCharttext: "196",piechartfield: AppText.client.tr(),piechartvalue: "35",),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}