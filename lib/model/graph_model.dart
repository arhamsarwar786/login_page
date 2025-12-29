import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_text.dart';

class GraphModel {
  String subTitle;
  String title;
  Color color;

  GraphModel({
    required this.subTitle,
    required this.title,
    required this.color,
   
  });
}

List<GraphModel> getgraphCardData() {  return [
  GraphModel(
    title: AppText.seniorLevel.tr(),
    subTitle: AppText.seniorLevelSubtitle.tr(),
    color: AppColor.red,
   
  ),
  GraphModel(
    title: AppText.middleLevel.tr(),
    subTitle: AppText.middleLevelSubtitle.tr(),
    color: AppColor.blue,
   
  ),
  GraphModel(
    title: AppText.juniorLevel.tr(),
    subTitle: AppText.juniorLevelSubtitle.tr(),
    color:AppColor.orange,
   
  ),
  GraphModel(
    title: AppText.male.tr(),
    subTitle: AppText.maleSubtitle.tr(),
    color: AppColor.deeppurple,
   
  ),
  GraphModel(
    title: AppText.female.tr(),
    subTitle: AppText.femaleSubtitle.tr(),
    color: AppColor.sky,
   
  ),
];
}
List<GraphModel> countryData() {return [
  GraphModel(
    title: AppText.usa.tr(),
    subTitle: AppText.usaSubtitle.tr(),
    color: AppColor.red,
    
  ),
  GraphModel(
    title: AppText.uk.tr(),
    subTitle: AppText.ukSubtitle.tr(),
    color: AppColor.blue,
    
  ),
  GraphModel(
    title: AppText.india.tr(),
    subTitle: AppText.indiaSubtitle.tr(),
    color: AppColor.skin,
    
  ),
  GraphModel(
    title: AppText.japan.tr(),
    subTitle: AppText.japanSubtitle.tr(),
    color: AppColor.deeppurple,
    
  ),
  GraphModel(
    title: AppText.indonesia.tr(),
    subTitle: AppText.indonesiaSubtitle.tr(),
    color: AppColor.sky,
    
  ),
];}