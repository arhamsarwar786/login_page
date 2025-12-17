import 'package:flutter/material.dart';
import 'package:login_page/components/circle_icon.dart';
import 'package:login_page/components/triangle_icon.dart';

class Circletriangle extends StatelessWidget {
  const Circletriangle({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Positioned(
      top:size.width>800? 30:20,
      left:size.width>800? 30:30,
      child: InkWell(
        onTap: () {
          Navigator.maybePop(context);
        },
        child: Row(children: [CircleIcon(),
        SizedBox(width: 20,)
      ,      TriangleIcon()],)),
    );
  }
}