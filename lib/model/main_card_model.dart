import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:login_page/utils/app_color.dart';
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

List myCards() 
{ return [
  MainCardModel(
    title: AppText.monthlyPayroll.tr(),
    iconData: Icons.home,
    subTitle: AppText.usd.tr(),
    count: "\$ 13900",
    percentage: "-10%",
    color: AppColor.red,
  ),
  MainCardModel(
    title: AppText.companyExpenses.tr(),
    subTitle: AppText.usd.tr(),
    iconData: HugeIcons.strokeRoundedExpander,
    count: "\$ 23100",
    percentage: "-8%",
    color: AppColor.red,
  ),
  MainCardModel(
    title: AppText.totalEmployee.tr(),
    subTitle: AppText.people.tr(),
    iconData: CupertinoIcons.group,
    count: "4300",
    percentage: "+10%",
    color: AppColor.green,
  ),
  MainCardModel(
    title: AppText.newHires.tr(),
    subTitle: AppText.people.tr(),
    iconData: Icons.person,
    count: "102",
    percentage: "+2%",
    color: AppColor.green,
  ),
];}