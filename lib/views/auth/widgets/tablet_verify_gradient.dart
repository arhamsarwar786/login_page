import 'package:flutter/material.dart';
import 'package:login_page/utils/app_images.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:provider/provider.dart';

class TabletVerifyGradient extends StatelessWidget {
  const TabletVerifyGradient({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark= Provider.of<ThemeProvider>(context).isDarkMode;
    return  Positioned(
      bottom: 0,
      right: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width ,
        child: Image.asset(AppImages.gradient5, fit: BoxFit.fill,color: isDark ? Color(0xffBFBEDE) : null),
      ),
    );
    
  }
}
