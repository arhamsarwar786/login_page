import 'package:flutter/material.dart';
import 'package:login_page/components/confirm_button.dart';
import 'package:login_page/components/circle_icon.dart';
import 'package:login_page/components/group1_icon_image.dart';
import 'package:login_page/components/group_icon_image.dart';
import 'package:login_page/components/custom_textfield.dart';
import 'package:login_page/components/triangle_icon.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';
import 'package:login_page/components/mobile_gradient.dart';
import 'package:login_page/views/create_new_password/widgets/mobile_password_text.dart';
import 'package:login_page/views/create_new_password/widgets/tablet_create_gradient.dart';
import 'package:login_page/views/create_new_password/widgets/tablet_password_text.dart';
import 'package:login_page/views/login_screen/login_screen.dart';

class CreatePasswordWidget extends StatelessWidget {
  const CreatePasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spaceheigth = SizedBox(height: size.height * 0.025);
    return Stack(
      children: [
        size.width > 500 ? TabletCreateGradient() : MobileGradient(),
        CircleIcon(),
        TriangleIcon(),
        GroupIconImage(),
        Group1IconImage(),
        Positioned(
          top: size.height * 0.08,
          left: size.width > 600 ? size.width * 0.32 : size.width * 0.04,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.2),
              Text(AppText.createnewpassword, style: Appstyle().bold()),
              spaceheigth,
              size.width > 500
                  ?MobilePasswordText()
                  : TabletPasswordText(),
          
              SizedBox(height: size.height * 0.05),
              size.width > 500
                  ? Column(
                      children: [
                        CustomTextfields(label: AppText.password, eye: true),
                        spaceheigth,
                        CustomTextfields(
                          label: AppText.confirmpassword,
                          eye: true,
                        ),
                      ],
                    )
                  : CustomTextfields(label: AppText.emailaddress, eye: false),
          
              spaceheigth,
              SizedBox(height: size.height * 0.02),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                },
                child: ConfirmButton(text: AppText.confirmchanges),
              ),
          
              SizedBox(height: size.height * 0.05),
              
            ],
          ),
        ),
      ],
    );
  }
}
