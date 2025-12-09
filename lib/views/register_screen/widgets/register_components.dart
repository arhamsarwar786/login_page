import 'package:flutter/material.dart';
import 'package:login_page/components/button.dart';
import 'package:login_page/components/contain.dart';
import 'package:login_page/components/textfield.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_images.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';
import 'package:login_page/views/reset_password/reset_password.dart';

class RegisterComponents extends StatelessWidget {
  const RegisterComponents({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spacewidth = SizedBox(width: size.width * 0.04);
    var spaceheigth = SizedBox(height: size.height * 0.025);
    return Stack(
      children: [
        size.width > 500
            ? Positioned(
                bottom: 20,
                left: 0,
                child: Container(
                  height: size.height,
                  child: Image.asset(AppImages.gradient2, fit: BoxFit.fill),
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
          bottom: size.height * 0.09,
          left: 5,
          child: Container(
            height: size.height * 0.15,
            child: Image.asset(AppImages.group1),
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.15),
            size.width < 500
                ? Column(
                    children: [
                      Row(
                        children: [
                          spacewidth,
                          Text(AppText.register, style: Appstyle().bold()),
                          spaceheigth,
                        ],
                      ),
                      Row(
                        children: [
                          spacewidth,
                          Text(
                            AppText.readytobecome,
                            style: Appstyle().light(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          spacewidth,
                          Text(
                            AppText.belowandletthejourneybegin,
                            style: Appstyle().light(),
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Text(AppText.register, style: Appstyle().bold()),
                      spaceheigth,
                      Text(AppText.readytobecome, style: Appstyle().light()),
                      Text(
                        AppText.belowandletthejourneybegin,
                        style: Appstyle().light(),
                      ),
                    ],
                  ),
            spaceheigth,

            CustomTextfields(label: AppText.usernameoremail, eye: false),
            spaceheigth,

            CustomTextfields(label: AppText.emailaddress, eye: false),
            spaceheigth,

            CustomTextfields(label: AppText.password, eye: true),
            spaceheigth,
            CustomTextfields(label: AppText.confirmpassword, eye: true),

            SizedBox(height: size.height * 0.03),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword()));
              },
              child: Button(text: AppText.register)),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: size.width > 500
                      ? size.width * 0.17
                      : size.width * 0.35,
                  color: AppColor.grey,
                ),
                SizedBox(width: 2),
                Text(AppText.or, style: Appstyle().light()),
                SizedBox(width: 2),
                Container(
                  height: 1,
                  width: size.width > 500
                      ? size.width * 0.17
                      : size.width * 0.35,

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
            SizedBox(height: size.height * 0.12),
            size.width < 500
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppText.alreadyhaveanaccount, style: Appstyle().light1()),
                      Text(AppText.login, style: Appstyle().light()),
                    ],
                  )
                : Row(
                    children: [
                      spacewidth,
                      Text(
                        AppText.alreadyhaveanaccount,
                        style: Appstyle().light1(),
                      ),
                      Text(AppText.login, style: Appstyle().light()),
                      Spacer(),
                      Text(AppText.contactsupport, style: Appstyle().light()),
                      spacewidth,
                    ],
                  ),
            // SizedBox(height: size.height * 0.05),
          ],
        ),
      ],
    );
  }
}
