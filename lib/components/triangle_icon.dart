import 'package:flutter/material.dart';
import 'package:login_page/utils/app_images.dart';
class TriangleIcon extends StatelessWidget {
  const TriangleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  Positioned(
          left:size.width>450? 35:45,
          top: size.height * 0.03,
          child: SizedBox(
            height: size.height * 0.02,
            child: Image.asset(AppImages.polygon),
          ),
        );
  }
}