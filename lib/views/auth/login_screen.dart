import 'package:flutter/material.dart';
import 'package:login_page/components/circle_icon.dart';
import 'package:login_page/components/confirm_button.dart';
import 'package:login_page/components/custom_textfield.dart';
import 'package:login_page/components/group1_icon_image.dart';
import 'package:login_page/components/group_icon_image.dart';
import 'package:login_page/components/simple_textfield.dart';
import 'package:login_page/components/triangle_icon.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';
import 'package:login_page/utils/bg_gradient.dart';
import 'package:login_page/views/auth/register_screen.dart';
import 'package:login_page/views/auth/widgets/costom_check_box.dart';
import 'package:login_page/views/auth/widgets/costom_spacer.dart';
import 'package:login_page/views/auth/widgets/auth_footers.dart';
import 'package:login_page/views/auth/widgets/social_links.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spaceheigth = SizedBox(height: size.height * 0.025);

    return Scaffold(
      backgroundColor: AppColor.black,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Stack(
            children: [
           BgGradient().background1gradient(context) ,
          
              CircleIcon(),
              TriangleIcon(),
              GroupIconImage(),
              Group1IconImage(),
          
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.2),
                  Text(AppText.welcomebacktrailblazer, style: Appstyle().bold()),
                  spaceheigth,
                  Text(AppText.weareexiting, style: Appstyle().light()),
                  Text(AppText.youraccount, style: Appstyle().light()),
                  spaceheigth,
                  SimpleTextfield(label: AppText.usernameoremail),
                  spaceheigth,
                  CustomTextfields(label: AppText.password, eye: true),
          
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     CostomCheckBox(),
                      Text(AppText.rememberme, style: Appstyle().light()),
                      size.width > 500
                          ? SizedBox(width: size.width * 0.11)
                          : size.width > 320
                          ? SizedBox(width: size.width * 0.36)
                          : SizedBox(width: size.width * 0.15),
                      Text(AppText.forgetpassword, style: Appstyle().light()),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  InkWell(
                    onTap: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (_)=>RegisterScreen()));

          
                    },
                    child: ConfirmButton(text: AppText.login),
                  ),
                  SizedBox(height: size.height * 0.03),
                  CostomSpacer(),
                  SizedBox(height: size.height * 0.03),
          
                  SocialLinks(),
                  SizedBox(height: size.height * 0.02),
                  AuthFooters(text: AppText.register,navigator: RegisterScreen(),),
                  SizedBox(height: size.height * 0.05),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
