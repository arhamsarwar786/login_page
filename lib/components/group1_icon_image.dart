import 'package:flutter/material.dart';
import 'package:login_page/utils/app_images.dart';

class Group1IconImage extends StatelessWidget {
  const Group1IconImage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
          bottom:size.width>500? 25:20,
          left: 20,
          child: SizedBox(
            height: size.height * 0.15,
            
            child: Image.asset(AppImages.group1,fit: BoxFit.cover,height:size.width<500? 100 : 250,
width: size.width<500?100:200),
          ),
        );
  }
}