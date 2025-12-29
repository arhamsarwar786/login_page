import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_images.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:provider/provider.dart';

class TabletCreateGradient extends StatelessWidget {
  const TabletCreateGradient({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark= Provider.of<ThemeProvider>(context).isDarkMode;
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Image.asset(AppImages.gradient4, fit: BoxFit.fill,color: isDark ?AppColor.lightpurple : null,),
      ),
    );
  }
}
