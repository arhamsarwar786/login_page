import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';

// ignore: must_be_immutable
class GradientIcon extends StatelessWidget {

  IconData icon;
  double size;

  GradientIcon({super.key,required this.icon,required this.size});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) => RadialGradient(
        center: Alignment.topCenter,
        colors: [
         AppColor.blue,AppColor.pink
        ],
      ).createShader(bounds),
      child: Icon(
        icon,
        size: size,
      ),
    );
  }
}