import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/components/button.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_images.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';
import 'package:login_page/views/create_new_password/create_new_password.dart';
import 'package:login_page/views/verify_your_password/widget/otp.dart';
class VerifyPasswordComponents extends StatelessWidget {
  const VerifyPasswordComponents({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spacewidth = SizedBox(width: size.width * 0.012);
    return  Stack(
      children: [
        size.width > 500
            ? Positioned(
              bottom: 0,
              left: 0,
              child: Container(
               
                 
                  child: Image.asset(AppImages.gradient5, fit: BoxFit.fill),
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
        Positioned(
          top: size.height*0.3,
          left: size.width>600?    size.width*0.32:size.width*0.04,
          child: Column(children: [
            Text(AppText.verifyyourcode,style: Appstyle().bold(),),
            Text(AppText.enterthepasscodeyoujust,style: Appstyle().light(),),
            Text(AppText.endingwithgmailcom,style: Appstyle().light(),),
            SizedBox(height: size.height*0.04,),
             Otp(),
           
                       SizedBox(height: size.height*0.03,),

            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateNewPassword()) );
            },
            child: Button(text: AppText.verify))


          ],),
        )
        ]) ;
  }
}