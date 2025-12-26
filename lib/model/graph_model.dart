import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/app_text.dart';

class GraphModel {
  String subTitle;
  String title;
  Color color;
  String image;

  GraphModel({
    required this.subTitle,
    required this.title,
    required this.color,
    required this.image,
  });
}

List<GraphModel> getgraphCardData() {  return [
  GraphModel(
    title: AppText.seniorLevel.tr(),
    subTitle: AppText.seniorLevelSubtitle.tr(),
    color: Color(0xFFCE6462),
    image: '',
  ),
  GraphModel(
    title: AppText.middleLevel.tr(),
    subTitle: AppText.middleLevelSubtitle.tr(),
    color: Color(0xFF4F53CE),
    image: '',
  ),
  GraphModel(
    title: AppText.juniorLevel.tr(),
    subTitle: AppText.juniorLevelSubtitle.tr(),
    color: Color(0xFFEEA468),
    image: '',
  ),
  GraphModel(
    title: AppText.male.tr(),
    subTitle: AppText.maleSubtitle.tr(),
    color: Color(0xFFA83CE5),
    image: '',
  ),
  GraphModel(
    title: AppText.female.tr(),
    subTitle: AppText.femaleSubtitle.tr(),
    color: Color(0xFF3395F7),
    image: '',
  ),
];
}
List<GraphModel> countryData() {return [
  GraphModel(
    title: AppText.usa.tr(),
    subTitle: AppText.usaSubtitle.tr(),
    color: Color(0xFFCE6462),
    image: 'assets/images/apple.png',
  ),
  GraphModel(
    title: AppText.uk.tr(),
    subTitle: AppText.ukSubtitle.tr(),
    color: Color(0xFF4F53CE),
    image: 'assets/images/apple.png',
  ),
  GraphModel(
    title: AppText.india.tr(),
    subTitle: AppText.indiaSubtitle.tr(),
    color: Color(0xFFEEA468),
    image: 'assets/images/apple.png',
  ),
  GraphModel(
    title: AppText.japan.tr(),
    subTitle: AppText.japanSubtitle.tr(),
    color: Color(0xFFA83CE5),
    image: 'assets/images/apple.png',
  ),
  GraphModel(
    title: AppText.indonesia.tr(),
    subTitle: AppText.indonesiaSubtitle.tr(),
    color: Color(0xFF3395F7),
    image: 'assets/images/apple.png',
  ),
];}