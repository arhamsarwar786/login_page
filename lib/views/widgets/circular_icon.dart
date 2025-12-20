import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';

// ignore: must_be_immutable
class CircularIcon extends StatelessWidget {

  IconData iconData;

  CircularIcon({super.key,required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(60)),
          color: AppColor.clrBoxBackground,
          boxShadow: [
            BoxShadow(
                color: Color(0xFF333333),spreadRadius: 1
            )
          ]
      ),
      child: IconButton(
        icon: Icon(
            iconData
        ),
        onPressed: () {},
      ),
    );
  }
}