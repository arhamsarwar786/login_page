import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:provider/provider.dart';

class CircularIcon extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onTap;

  const CircularIcon({
    super.key, 
    required this.iconData,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(60)),
        color: isDark 
            ?AppColor.white
            : AppColor.clrBoxBackground,
        boxShadow: [
          BoxShadow(
            color: isDark ? AppColor.black : AppColor.greydark,
            spreadRadius: 1
          )
        ]
      ),
      child: IconButton(
        icon: Icon(
          iconData,
          color: isDark ? AppColor.black : AppColor.clrWhite,
        ),
        onPressed: onTap,
      ),
    );
  }
}