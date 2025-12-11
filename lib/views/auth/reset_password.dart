import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/components/circle_icon.dart';
import 'package:login_page/components/confirm_button.dart';
import 'package:login_page/components/group1_icon_image.dart';
import 'package:login_page/components/group_icon_image.dart';
import 'package:login_page/components/simple_textfield.dart';
import 'package:login_page/components/triangle_icon.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';
import 'package:login_page/utils/bg_gradient.dart';
import 'package:login_page/views/auth/verify_password.dart';
class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spaceheigth = SizedBox(height: size.height * 0.04);

    return Scaffold(
      backgroundColor: AppColor.black,
      body: 
     Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(),
        child: 
        Stack(
              children: [
                 BgGradient().background3gradient(context),
        CircleIcon(),
        TriangleIcon(),
        GroupIconImage(),
        Group1IconImage(),
        Positioned(
          top: size.height * 0.3,
          left: size.width > 500 ? size.width * 0.3 : size.width * 0.035,
          child: Column(
            children: [
              Text(AppText.resetpassword, style: Appstyle().bold()),
              SizedBox(height: size.height * 0.01),
              Text(
                AppText
                    .typeyourauthorisedemailaddresstoreceiveresetpasswordlink,
                style: Appstyle().light(),
              ),
              Text(AppText.passwordlink, style: Appstyle().light()),
              spaceheigth,
            SimpleTextfield(label: AppText.emailaddress,),
              spaceheigth,
              InkWell(
                onTap: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (_)=>VerifyPassword()));
        
                },
                child: ConfirmButton(text: AppText.resetpasswordlink),
              ),
            ],
          ),
        ),
              ],
            )

      ),);
  }
}