import 'package:flutter/material.dart';
import 'package:login_page/utils/app_images.dart';
class CircleIcon extends StatelessWidget {
  const CircleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SizedBox(
  
      child: Image.asset(AppImages.circle ,
       height:size.width>500? 25 : 40,
width: 20
      ),
    );
  }
}