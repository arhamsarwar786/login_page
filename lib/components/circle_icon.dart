import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_images.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:provider/provider.dart';
class CircleIcon extends StatelessWidget {
  const CircleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isDark=Provider.of<ThemeProvider>(context).isDarkMode;
    return  SizedBox(

      child: Image.asset(AppImages.circle ,color:isDark ? AppColor.black : null,
       height:size.width>500? 25 : 40,
width: 20
      ),
    );
  }
}