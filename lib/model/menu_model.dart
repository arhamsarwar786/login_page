import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/app_text.dart';

class MenuModel {
  IconData icon;
  String title;

  MenuModel({required this.icon, required this.title});
}

List<MenuModel> menu(){  return [
  MenuModel(icon: Icons.home, title: AppText.dashboard.tr()),
  MenuModel(icon: Icons.supervised_user_circle_outlined, title: AppText.employee.tr()),
  MenuModel(icon: Icons.payment_rounded, title: AppText.payment.tr()),
  MenuModel(icon: Icons.ac_unit, title: AppText.attendance.tr()),
  MenuModel(icon: Icons.menu_book, title: AppText.permission.tr()),
  MenuModel(icon: Icons.other_houses_rounded, title: AppText.company.tr()),
];}

List<MenuModel> bottomMenu() {  return [
  MenuModel(icon: Icons.settings, title: AppText.settings.tr()),
  MenuModel(icon: Icons.logout, title: AppText.logout.tr()),
];}