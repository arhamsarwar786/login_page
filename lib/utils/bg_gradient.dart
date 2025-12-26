// ignore_for_file: strict_top_level_inference

import 'package:flutter/material.dart';
import 'package:login_page/components/mobile_gradient.dart';
import 'package:login_page/components/tablet_gradient.dart';
import 'package:login_page/utils/app_images.dart';
import 'package:login_page/views/auth/widgets/tablet_create_gradient.dart';
import 'package:login_page/views/auth/widgets/tablet_gradient_register.dart';
import 'package:login_page/views/auth/widgets/tablet_reset_gradient.dart';
import 'package:login_page/views/auth/widgets/tablet_verify_gradient.dart';

class BgGradient {
  
  StatelessWidget backgroundgradient( context) {
    Size size = MediaQuery.of(context).size;
    return size.width > 500 ? TabletCreateGradient() : MobileGradient();
  }

  StatelessWidget background1gradient(context) {
    Size size = MediaQuery.of(context).size;

   return size.width > 500
        ? TabletGradient(gradientimage: AppImages.gradient1): MobileGradient();
  }

StatelessWidget background2gradient(context){
  Size size = MediaQuery.of(context).size;
   return size.width > 500 ? TabletGradientRegister() : MobileGradient();
}
StatelessWidget background3gradient(context){
   Size size = MediaQuery.of(context).size;
 return size.width > 500 ? TabletResetGradient() : MobileGradient();
}
StatelessWidget background4gradient(context){
    Size size = MediaQuery.of(context).size;
  return size.width > 500 ? TabletVerifyGradient() : MobileGradient();
}
}
