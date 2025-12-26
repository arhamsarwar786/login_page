import 'package:flutter/material.dart';
import 'package:login_page/components/social_login_button.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_images.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:provider/provider.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    var spacewidth = SizedBox(width: size.width * 0.032);
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    return  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialLoginButton(imge: AppImages.google, color: isDark ? AppColor.white : AppColor.black),
                spacewidth,
                SocialLoginButton(imge: AppImages.facebook, color: isDark ? AppColor.white : AppColor.black),
                spacewidth,
                SocialLoginButton(imge: AppImages.apple, color: isDark ? AppColor.white : AppColor.black,imagecolor: isDark ? AppColor.black : AppColor.white,),
              ],
            );
  }
}