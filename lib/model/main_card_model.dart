import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:login_page/utils/app_text.dart';

class MainCardModel {
  final IconData iconData;
  final String? title, subTitle, count;
  final String? percentage;
  final Color? color;

  MainCardModel({
    required this.iconData,
    required this.title,
    required this.subTitle,
    required this.count,
    required this.percentage,
    required this.color,
  });
}

List myCards = [
  MainCardModel(
    title: AppText.monthlyPayroll,
    iconData: Icons.home,
    subTitle: AppText.usd,
    count: "\$ 13900",
    percentage: "-10%",
    color: Colors.red,
  ),
  MainCardModel(
    title: AppText.companyExpenses,
    subTitle: AppText.usd,
    iconData: HugeIcons.strokeRoundedExpander,
    count: "\$ 23100",
    percentage: "-8%",
    color: Colors.red,
  ),
  MainCardModel(
    title: AppText.totalEmployee,
    subTitle: AppText.people,
    iconData: CupertinoIcons.group,
    count: "4300",
    percentage: "+10%",
    color: Colors.green,
  ),
  MainCardModel(
    title: AppText.newHires,
    subTitle: AppText.people,
    iconData: Icons.person,
    count: "102",
    percentage: "+2%",
    color: Colors.green,
  ),
];