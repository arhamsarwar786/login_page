import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/components/circle_icon.dart';
import 'package:login_page/components/confirm_button.dart';
import 'package:login_page/components/group1_icon_image.dart';
import 'package:login_page/components/group_icon_image.dart';
import 'package:login_page/components/triangle_icon.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';
import 'package:login_page/utils/bg_gradient.dart';
import 'package:login_page/views/auth/create_new_password.dart';
import 'package:login_page/views/auth/widgets/otp.dart';
class VerifyPassword extends StatelessWidget {
  const VerifyPassword({super.key});

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.black,
      body:   
       Stack(
             children: [
              BgGradient().backround4gradient(context),
        CircleIcon(),
        TriangleIcon(),
        GroupIconImage(),
        Group1IconImage(),
        Positioned(
          top: size.height * 0.3,
          left: size.width > 600 ? size.width * 0.32 : size.width * 0.04,
          child: Column(
            children: [
              Text(AppText.verifyyourcode, style: Appstyle().bold()),
              Text(AppText.enterthepasscodeyoujust, style: Appstyle().light()),
              Text(AppText.endingwithgmailcom, style: Appstyle().light()),
              SizedBox(height: size.height * 0.04),
              Otp(),
       
              SizedBox(height: size.height * 0.03),
       
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>CreateNewPassword()));
                  
                },
                child: ConfirmButton(text: AppText.verify),
              ),
            ],
          ),
        ),
             ],
           )
      
      );
  }
}