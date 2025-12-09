
import 'package:flutter/material.dart';
import 'package:login_page/components/button.dart';
import 'package:login_page/components/textfield.dart';
import 'package:login_page/utils/app_images.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';
import 'package:login_page/views/login_screen/login_screen.dart';

class CreatePasswordComponents extends StatelessWidget {
  const CreatePasswordComponents({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spaceheigth = SizedBox(height: size.height * 0.025);
    return Stack(
      children: [
        size.width > 500
            ? Positioned(
              bottom: 0,
              left: -80,
              child: Container(
                  height: size.height * 0.6,
                  width: size.width,
                  child: Image.asset(AppImages.gradient4, fit: BoxFit.fill),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.2),
            Text(AppText.createnewpassword, style: Appstyle().bold()),
            spaceheigth,
       size.width>500?    Column(children: [ Text(AppText.typeyournewstrongpassword, style: Appstyle().light()),
            Text(AppText.onecapitalletter, style: Appstyle().light()),
            Text(AppText.characterminimum, style: Appstyle().light()),],):
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
Text(AppText.typeyournewstrongpassword,style: Appstyle().light(),),
Text(AppText.mustinclude,style: Appstyle().light(),),

Text(AppText.type1,style: Appstyle().light(),),
Text(AppText.type2,style: Appstyle().light(),),
Text(AppText.type3,style: Appstyle().light(),)
,
],),

             SizedBox(height: size.height*0.05,),
            size.width>500?
         Column(children: [ 
            CustomTextfields(label: AppText.password, eye: true),
            spaceheigth,
            CustomTextfields(label: AppText.confirmpassword, eye: true),],):

   
    CustomTextfields(label: AppText.emailaddress, eye: false),
  
            
           spaceheigth,
            SizedBox(height: size.height * 0.02),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
              },
              child: Button(text: AppText.confirmchanges)),
              
            SizedBox(height: size.height * 0.05),
            Row(children: [],)
          ],
        ),
      ],
    );
  }
}
