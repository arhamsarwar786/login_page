import 'package:flutter/material.dart';
import 'package:login_page/components/button.dart';
import 'package:login_page/components/textfield.dart';
import 'package:login_page/utils/app_images.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';
import 'package:login_page/views/verify_your_password/verify_password.dart';

class ResetPasswordComponents extends StatelessWidget {
  const ResetPasswordComponents({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spaceheigth = SizedBox(height: size.height * 0.04);
    return Stack(
      children: [
        
        size.width > 500
            ? Positioned(bottom: 0,
            right: 0,
              child: Container(
                 height: size.height*1.1,
                  child: Image.asset(AppImages.gradient3, fit: BoxFit.fill),
              ),
            )
            : Positioned(
                right: 0,
                top: 20,
                child: Container(
                
                  child: Image.asset(AppImages.gradient6, fit: BoxFit.fill),
                ),
              ),
             
        Positioned(
          left: 20,
          top: size.height * 0.03,
          child: Container(
            height: size.height * 0.02,
            child: Image.asset(AppImages.circle),
          ),
        ),
        Positioned(
        
          left: 35,
          top: size.height * 0.03,
          child: Container(
            height: size.height * 0.02,
            child: Image.asset(AppImages.polygon),
          ),
        ),
        Positioned(
          right: 20,
          top: 10,
          child: Container(
            height: size.height * 0.2,
            child: Image.asset(AppImages.group),
          ),
        ),
        Positioned(
          bottom: 25,
          left: 5,
          child: Container(
            height: size.height * 0.15,
            child: Image.asset(AppImages.group1),
          ),
        ),

      
         Positioned(top: size.height*0.3,
         left: size.width>500?  size.width*0.3:size.width*0.035,
           child: Column(
            children: [
            Text(AppText.resetpassword,style: Appstyle().bold(),),
            SizedBox(height: size.height*0.01,),
            Text(AppText.typeyourauthorisedemailaddresstoreceiveresetpasswordlink,style: Appstyle().light(),),
           Text(AppText.passwordlink,style: Appstyle().light(),),
           spaceheigth,
           CustomTextfields(label: AppText.emailaddress, eye: false),
         spaceheigth,  InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyPassword()));
          },
          child: Button(text: AppText.resetpasswordlink))
            ]
                  ),
         )
      ],
    );
  }
}
