import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:provider/provider.dart';

class Appstyle {
  TextStyle bold(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    return TextStyle(
      fontSize: MediaQuery.of(context).size.width > 700 ? 30 : 22,
      color: isDark ? AppColor.black : AppColor.white,
      fontFamily: "hel",
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle bold1(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    return TextStyle(
      fontSize: MediaQuery.of(context).size.width > 700 ? 16 : 14,
      color: isDark ? AppColor.white : AppColor.white,
      fontFamily: "hel",
      fontWeight: FontWeight.bold,
    );
  }
 TextStyle bold3(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    return TextStyle(
      fontSize: MediaQuery.of(context).size.width > 700 ? 16 : 14,
      color: isDark ? AppColor.black : AppColor.white,
      fontFamily: "hel",
    
    );
  }
  TextStyle smalltext(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;

    return TextStyle(
      fontSize: MediaQuery.of(context).size.width > 700 ? 16 : 14,
      color: isDark ? AppColor.black : AppColor.white,
      fontFamily: "hel",
    );
  }

  TextStyle light(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    return TextStyle(
      fontFamily: "hel",
      fontSize: 13,
      color: isDark ? AppColor.black : AppColor.white,
    );
  }
   TextStyle light3(BuildContext context) {
    return TextStyle(
      fontFamily: "hel",
      fontSize: 13,
    );
  }
  
  TextStyle gradienttext(BuildContext context) {
    return TextStyle(
      fontFamily: "hel",
      fontSize: 13,
      foreground: Paint()..shader= LinearGradient(colors: [ AppColor.pink,
                                          AppColor.blue,]).createShader(Rect.fromLTWH(0, 0,200 , 0))
    );
  }
 TextStyle light2(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    return TextStyle(
      fontFamily: "hel",
      fontSize: 13,
      color: isDark ? AppColor.black : AppColor.white,
    );
  }
  TextStyle light1(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    return TextStyle(
      fontFamily: "hel",
      fontSize: 10,
      color: isDark
          ? const Color.fromARGB(255, 58, 57, 57)
          : const Color.fromARGB(255, 182, 181, 181),
    );
  }
}
