import 'package:flutter/material.dart';
import 'package:login_page/utils/app_images.dart';
class GroupIconImage extends StatelessWidget {
  const GroupIconImage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
          right: 20,
          top: 10,
          child: SizedBox(
            height: size.height * 0.2,
            child: Image.asset(AppImages.group,fit: BoxFit.cover,height:size.width<500? 100 : 250,
width: size.width<500?100:200),
          ),
        );
  }
}