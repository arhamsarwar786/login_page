import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login_page/components/button.dart';
import 'package:login_page/components/contain.dart';
import 'package:login_page/components/textfield.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_images.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';
import 'package:login_page/viewmodel/login_view_model.dart';
import 'package:login_page/views/register_screen/register_screen.dart';
import 'package:provider/provider.dart';

class LoginComponents extends StatelessWidget {
  const LoginComponents ({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spacewidth = SizedBox(width: size.width * 0.02);
    var spaceheigth = SizedBox(height: size.height * 0.025);
    return Stack(
      children: [
        
        size.width > 500
            ? Container(
                height: size.height * 0.6,
                width: size.width,
                child: Image.asset(AppImages.gradient1, fit: BoxFit.fill),
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

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.2),
            Text(AppText.welcomebacktrailblazer, style: Appstyle().bold()),
            spaceheigth,
            Text(AppText.weareexiting, style: Appstyle().light()),
            Text(AppText.youraccount, style: Appstyle().light()),
            spaceheigth,

            CustomTextfields(label: AppText.usernameoremail, eye: false),
            spaceheigth,
CustomTextfields(label: AppText.password, eye: true),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: context.read<LoginViewModel>().check,
                  onChanged: (value) {
                    Icon(Icons.check, color: AppColor.white);
                  },
                ),
                Text(AppText.rememberme, style: Appstyle().light()),
             size.width>500?   SizedBox(width: size.width * 0.12):
              SizedBox(width: size.width * 0.35),
                Text(AppText.forgetpassword, style: Appstyle().light()),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
              },
              child: Button(text: AppText.login)),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: size.width * 0.17,
                  color: AppColor.grey,
                ),
                SizedBox(width: 2),
                Text(AppText.or, style: Appstyle().light()),
                SizedBox(width: 2),
                Container(
                  height: 1,
                  width: size.width * 0.17,
                  color: AppColor.grey,
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Contain(imge: AppImages.google),
                spacewidth,
                Contain(imge: AppImages.facebook),
                spacewidth,
                Contain(imge: AppImages.apple),
              ],
            ),
             SizedBox(height: size.height*0.02,),
            size.width<500?

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
             
                Text(AppText.donthave, style: Appstyle().light1()),
                InkWell(onTap: () {
                   Navigator.push(context,MaterialPageRoute(builder: (_)=>RegisterScreen() ));
                  
                }, child: Text(AppText.register, style: Appstyle().light())),
            ],):
          
            
           
          
            Row(
              children: [
                spacewidth,
                Text(AppText.donthave, style: Appstyle().light1()),
                InkWell(
                 onTap: () {
                   Navigator.push(context,MaterialPageRoute(builder: (_)=>RegisterScreen() ));
                 }, child: Text(AppText.register, style: Appstyle().light())),
                Spacer(),
                Text(AppText.contactsupport, style: Appstyle().light()),
                spacewidth,
              ],
            ),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ],
    );
  }
}