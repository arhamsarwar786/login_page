import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/appstyle.dart';
class ConfirmButton extends StatelessWidget {
  final String text;
  const ConfirmButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
    
     Container(
              width: _getWidth(size),
      height: _getHeight(size),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(colors:  [
          AppColor.pink,AppColor.blue

        ] ),
      ),
      child: Center(child: Text(text,style: Appstyle().bold1(context),)),
    );
  }



   double _getWidth(Size size) {
    if (size.width < 600) {
      // Mobile
      return size.width * 0.85;
    }
    
    
     else if (size.width < 768) {
      // Small tablet
      return size.width * 0.7;
    } else if (size.width < 1024) {
      // Tablet
      return size.width * 0.6;
    } else if (size.width < 1440) {
      // Laptop
      return size.width * 0.45;
    } else {
      // Desktop
      return size.width * 0.4;
    }
  }

  double _getHeight(Size size) {
    if (size.width < 400) {
      // Mobile
      return 43;
    }else if (size.width < 600) {
      // large laptop
      return 48;
    }
    else if (size.width > size.height){
      return 48;
    } else if (size.width < 1024) {
      // Tablet
      return 48;
    } else {
      // Laptop/Desktop
      return 50;
    }
  }

}