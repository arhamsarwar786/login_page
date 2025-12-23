import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CircularIcon extends StatelessWidget {

  IconData iconData;

  CircularIcon({super.key,required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(60)),
          color: const Color.fromARGB(255, 240, 242, 247),
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