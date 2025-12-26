import 'package:flutter/material.dart';
import 'package:login_page/utils/app_images.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:provider/provider.dart';
class MobileGradient extends StatelessWidget {
  const MobileGradient({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark= Provider.of<ThemeProvider>(context).isDarkMode;
    return Positioned(
                right: 0,
                top: 20,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(AppImages.gradient6, fit: BoxFit.fill,color: isDark ? Color(0xffBFBEDE) : null,),
                ),
              );
  }
}