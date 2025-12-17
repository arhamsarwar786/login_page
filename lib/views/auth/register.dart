import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page/components/custom_textfield.dart';
import 'package:login_page/components/group_icon_image.dart';
import 'package:login_page/components/simple_textfield.dart';
import 'package:login_page/views/auth/widgets/circle_triangle.dart';
import 'package:provider/provider.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/components/confirm_button.dart';
import 'package:login_page/components/group1_icon_image.dart';
import 'package:login_page/components/social_login_button.dart';
import 'package:login_page/utils/app_images.dart';
import 'package:login_page/utils/app_routers_name.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/bg_gradient.dart';
import 'package:login_page/views/auth/widgets/costom_spacer.dart';
import 'package:login_page/views/auth/widgets/auth_footers.dart';
import 'package:login_page/views/auth/widgets/mobile_text.dart';
import 'package:login_page/views/auth/widgets/tablet_text.dart';
import 'package:login_page/viewmodel/login_view_model.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spacewidth = SizedBox(width: size.width * 0.04);
    var spaceheigth = SizedBox(height: size.height * 0.025);

    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.black,
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  BgGradient().background2gradient(context),
              Circletriangle(),
              GroupIconImage(),
                  Group1IconImage(),
                      
                  Center(
                    child: Consumer<LoginViewModel>(
                      builder: (context, provider, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: size.height * 0.15),
                            size.width < 500 ? MobileText() : TabletText(),
                            spaceheigth,
                            Column(
                              children: [
                                SimpleTextfield(
                                  label: AppText.fullname,
                                  controller: null,
                                  fieldName: 'fullname',
                                ),
                                spaceheigth,
                                SimpleTextfield(
                                  label: AppText.emailaddress,
                                  controller: null,
                                  fieldName: 'emailaddress',
                                ),
                                spaceheigth,
                                CustomTextfields(
                                  label: AppText.password,
                                  eye: true,
                                  fieldName: 'password',
                                ),
                                spaceheigth,
                                CustomTextfields(
                                  label: AppText.confirmpassword,
                                  eye: true,
                                  fieldName: 'confirmpassword',
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.03),
                            InkWell(
                              onTap: () {
                                _validation(context);
                              },
                              child: ConfirmButton(text: AppText.register),
                            ),
                            SizedBox(height: size.height * 0.03),
                            CostomSpacer(),
                            SizedBox(height: size.height * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SocialLoginButton(imge: AppImages.google),
                                spacewidth,
                                SocialLoginButton(imge: AppImages.facebook),
                                spacewidth,
                                SocialLoginButton(imge: AppImages.apple),
                              ],
                            ),
                            SizedBox(height: size.height * 0.12),
                            AuthFooters(
                              text: AppText.login,
                              navigator: AppRoutersName.loginroutename,
                            ),
                            SizedBox(height: size.height*0.2,)
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _validation(BuildContext context) {
  var provider = context.read<LoginViewModel>();
  bool isfullnameValid = provider.validateField('fullname');
  bool isEmailValid = provider.validateField('emailaddress');
  bool isPasswordValid = provider.validateField('password');
  bool isConfirmPasswordValid = provider.validateField('confirmpassword');
  if (!isfullnameValid ||
      !isEmailValid ||
      !isPasswordValid ||
      !isConfirmPasswordValid) {
    return;
  }
  String password = provider.getController('password').text;
  String confirmPassword = provider.getController('confirmpassword').text;
  if (password != confirmPassword) {
    provider.getController('confirmpassword');
    provider.validateField('confirmpassword');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Passwords do not match'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
    return;
  }
  context.pushNamed(AppRoutersName.resetpasswordroutename);
}
