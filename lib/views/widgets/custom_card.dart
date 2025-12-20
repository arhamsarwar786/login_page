import 'package:flutter/material.dart';
import 'package:login_page/model/main_card_model.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/responsive.dart';

class CustomCard extends StatelessWidget {
  final MainCardModel mainCardModel;

  const CustomCard({super.key, required this.mainCardModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(!Responsive.isMobile(context) ? 15 : 10),
      decoration: BoxDecoration(
          color: AppColor.clrBoxBackground,
          boxShadow: [BoxShadow(color: Color(0xff333333), spreadRadius: 1)],
      borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    AppColor.clrGradient1,
                    AppColor.clrGradient2,
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Icon(
              mainCardModel.iconData,
              color: AppColor.clrWhite,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            mainCardModel.title!,
            maxLines: 1,
            style: TextStyle(
                color: AppColor.clrBigText,
                fontSize: Responsive.isMobile(context) ? 13 : 16),
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                mainCardModel.count.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColor.clrBigText,
                    fontSize: Responsive.isMobile(context) ? 15 : 27),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                mainCardModel.subTitle!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColor.clrSmallText,
                    fontSize: Responsive.isMobile(context) ? 13 : 16),
              )
            ],
          ),
          Text(
            mainCardModel.percentage!,
            style: TextStyle(
              color: mainCardModel.color,
            ),
          ),
       
        ],
      ),
      
    );
  }
}