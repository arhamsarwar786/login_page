import 'package:flutter/material.dart';

class CostomSpacing {
 

  static SizedBox space(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width > 1200
        ? SizedBox(width: size.width * 0.25):
        size.width>1024?SizedBox(width: size.width * 0.23)
        : size.width > 750
        ? SizedBox(width: size.width * 0.31)
        :size.width>620?
        SizedBox(width: size.width * 0.35) :
         size.width > 500
        ? SizedBox(width: size.width * 0.39)
        : size.width > 400
        ? SizedBox(width: size.width * 0.33)
        : SizedBox(width: size.width * 0.18);
  }
  
}
