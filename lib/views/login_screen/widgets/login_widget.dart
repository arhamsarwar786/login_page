import 'package:flutter/material.dart';
import 'package:login_page/components/circle_icon.dart';
import 'package:login_page/components/confirm_button.dart';
import 'package:login_page/components/group1_icon_image.dart';
import 'package:login_page/components/group_icon_image.dart';
import 'package:login_page/components/mobile_gradient.dart';
import 'package:login_page/components/simple_textfield.dart';
import 'package:login_page/components/custom_textfield.dart';
import 'package:login_page/components/triangle_icon.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_images.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';
import 'package:login_page/components/tablet_gradient.dart';
import 'package:login_page/views/login_screen/widgets/login_footers.dart';
import 'package:login_page/views/login_screen/widgets/social_links.dart';
import 'package:login_page/views/register_screen/register_screen.dart';

class LoginWidget extends StatefulWidget {
   LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}
 bool ischecked=false;
class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spaceheigth = SizedBox(height: size.height * 0.025);
    return Stack(
      children: [
        size.width > 500
            ? TabletGradient(gradientimage: AppImages.gradient1)
            : MobileGradient(),

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
SimpleTextfield(label: AppText.usernameoremail,),
            spaceheigth,
            CustomTextfields(label: AppText.password, eye: true),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: ischecked, focusColor: AppColor.darkblue,
                  onChanged: (value) {
                 setState(() {
                   ischecked=value!;
                 });
                  },
                ),
                Text(AppText.rememberme, style: Appstyle().light()),
                size.width > 500
                    ? SizedBox(width: size.width * 0.12)
                    : SizedBox(width: size.width * 0.35),
                Text(AppText.forgetpassword, style: Appstyle().light()),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: ConfirmButton(text: AppText.login),
            ),
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

           SocialLinks(),
            SizedBox(height: size.height * 0.02),
            LoginFooters(),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ],
    );
  }
}
