import 'package:flutter/material.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:provider/provider.dart';
class TabletGradient extends StatelessWidget {
  final String gradientimage;
  const TabletGradient({super.key ,required this.gradientimage});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    return SizedBox(
                height: size.height * 0.6,
                width: size.width,
                child: Image.asset(gradientimage, fit: BoxFit.fill, color: isDark ? Color(0xffBFBEDE) : null),
            ) ;
  }
}