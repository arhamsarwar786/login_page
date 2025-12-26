import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';

class CostomSpacer extends StatelessWidget {
  const CostomSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: size.width>1200?
   size.width*0.185 :
    size.width > 1024
        ? size.width * 0.205
        : size.width > 700
        ? size.width * 0.28
        
        : size.width > 600
        ? size.width * 0.33
        :size.width>500?
        size.width*0.37
        : size.width * 0.4,
                  color: AppColor.grey,
                ),
                SizedBox(width: size.width*0.012),
                Text(AppText.or.tr(), style: Appstyle().light(context)),
                SizedBox(width:size.width*0.012),
                Container(
                  height: 1,
                  width: size.width>1200?
   size.width*0.185 :
    size.width > 1024
        ? size.width * 0.205
        : size.width > 700
        ? size.width * 0.28
        
        : size.width > 600
        ? size.width * 0.33
        :size.width>500?
        size.width*0.37
        : size.width * 0.4,

                  color: AppColor.grey,
                ),
              ],
            )
;
  }
}