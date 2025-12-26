import 'package:flutter/material.dart';
import 'package:login_page/utils/app_text.dart';

class MenuModel {
  IconData icon;
  String title;

  MenuModel({required this.icon, required this.title});
}

List<MenuModel> menu = [
  MenuModel(icon: Icons.home, title: AppText.dashboard),
  MenuModel(icon: Icons.supervised_user_circle_outlined, title: AppText.employee),
  MenuModel(icon: Icons.payment_rounded, title: AppText.payment),
  MenuModel(icon: Icons.ac_unit, title: AppText.attendance),
  MenuModel(icon: Icons.menu_book, title: AppText.permission),
  MenuModel(icon: Icons.other_houses_rounded, title: AppText.company),
];

List<MenuModel> bottomMenu = [
  MenuModel(icon: Icons.settings, title: AppText.settings),
  MenuModel(icon: Icons.logout, title: AppText.logout),
];