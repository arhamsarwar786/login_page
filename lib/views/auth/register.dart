import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page/components/custom_textfield.dart';
import 'package:login_page/components/group_icon_image.dart';
import 'package:login_page/components/simple_textfield.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
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

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    
    super.initState();
    context.read<ThemeProvider>().loadTheme();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spacewidth = SizedBox(width: size.width * 0.04);
    var spaceheigth = SizedBox(height: size.height * 0.025);
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;

    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: isDark?AppColor.white: AppColor.black,
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
                                  label: AppText.fullname.tr(),
                                  controller: null,
                                  fieldName: 'fullname',
                                ),
                                spaceheigth,
                                SimpleTextfield(
                                  label: AppText.emailaddress.tr(),
                                  controller: null,
                                  fieldName: 'emailaddress',
                                ),
                                spaceheigth,
                                CustomTextfields(
                                  label: AppText.password.tr(),
                                  eye: true,
                                  fieldName: 'password',
                                ),
                                spaceheigth,
                                CustomTextfields(
                                  label: AppText.confirmpassword.tr(),
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
                              child: ConfirmButton(text: AppText.register.tr()),
                            ),
                            SizedBox(height: size.height * 0.03),
                            CostomSpacer(),
                            SizedBox(height: size.height * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SocialLoginButton(imge: AppImages.google, color: isDark ? AppColor.white : AppColor.black),
                                spacewidth,
                                SocialLoginButton(imge: AppImages.facebook, color: isDark ? AppColor.white : AppColor.black),
                                spacewidth,
                                SocialLoginButton(imge: AppImages.apple, color: isDark ? AppColor.white : AppColor.black,imagecolor: isDark ? AppColor.black : AppColor.white,),
                              ],
                            ),
                            SizedBox(height: size.height * 0.12),
                            AuthFooters(
                              text: AppText.login.tr(),
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
