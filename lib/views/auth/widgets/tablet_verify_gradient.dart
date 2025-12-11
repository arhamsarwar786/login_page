import 'package:flutter/material.dart';
import 'package:login_page/utils/app_images.dart';

class TabletVerifyGradient extends StatelessWidget {
  const TabletVerifyGradient({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
    right:-400,
      bottom: 0,
      child: SizedBox(
        width: size.width,
        child: Image.asset(AppImages.gradient5, fit: BoxFit.fill),
      ),
    );
  }
}
