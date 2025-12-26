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

List<GraphModel> graphCardData = [
  GraphModel(
    title: AppText.seniorLevel,
    subTitle: AppText.seniorLevelSubtitle,
    color: Color(0xFFCE6462),
    image: '',
  ),
  GraphModel(
    title: AppText.middleLevel,
    subTitle: AppText.middleLevelSubtitle,
    color: Color(0xFF4F53CE),
    image: '',
  ),
  GraphModel(
    title: AppText.juniorLevel,
    subTitle: AppText.juniorLevelSubtitle,
    color: Color(0xFFEEA468),
    image: '',
  ),
  GraphModel(
    title: AppText.male,
    subTitle: AppText.maleSubtitle,
    color: Color(0xFFA83CE5),
    image: '',
  ),
  GraphModel(
    title: AppText.female,
    subTitle: AppText.femaleSubtitle,
    color: Color(0xFF3395F7),
    image: '',
  ),
];

List<GraphModel> countryData = [
  GraphModel(
    title: AppText.usa,
    subTitle: AppText.usaSubtitle,
    color: Color(0xFFCE6462),
    image: 'assets/images/apple.png',
  ),
  GraphModel(
    title: AppText.uk,
    subTitle: AppText.ukSubtitle,
    color: Color(0xFF4F53CE),
    image: 'assets/images/apple.png',
  ),
  GraphModel(
    title: AppText.india,
    subTitle: AppText.indiaSubtitle,
    color: Color(0xFFEEA468),
    image: 'assets/images/apple.png',
  ),
  GraphModel(
    title: AppText.japan,
    subTitle: AppText.japanSubtitle,
    color: Color(0xFFA83CE5),
    image: 'assets/images/apple.png',
  ),
  GraphModel(
    title: AppText.indonesia,
    subTitle: AppText.indonesiaSubtitle,
    color: Color(0xFF3395F7),
    image: 'assets/images/apple.png',
  ),
];