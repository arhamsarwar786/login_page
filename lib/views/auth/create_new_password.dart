import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:login_page/views/auth/widgets/circle_triangle.dart';
import 'package:provider/provider.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/components/confirm_button.dart';
import 'package:login_page/components/group1_icon_image.dart';
import 'package:login_page/components/group_icon_image.dart';
import 'package:login_page/components/custom_textfield.dart';
import 'package:login_page/utils/app_routers_name.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';
import 'package:login_page/utils/bg_gradient.dart';
import 'package:login_page/views/auth/widgets/mobile_password_text.dart';
import 'package:login_page/views/auth/widgets/tablet_password_text.dart';
import 'package:login_page/viewmodel/login_view_model.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  @override
  void initState() {
    super.initState();
    context.read<ThemeProvider>().loadTheme();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spaceheigth = SizedBox(height: size.height * 0.025);
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: SafeArea( left: false,
      right: false,
      bottom: false,
      top: true,
        child: Scaffold(
          backgroundColor: isDark? AppColor.white: AppColor.black,
          body: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(
                children: [
                  BgGradient().backgroundgradient(context),
                 Circletriangle(),
                  GroupIconImage(),
                  Group1IconImage(),
                    
                  Positioned(
                    child: Center(
                      child: Consumer<LoginViewModel>(
                        builder: (context, provider, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: size.height * 0.2),
                              Text(
                                AppText.createnewpassword.tr(),
                                style: Appstyle().bold(context),
                              ),
                              spaceheigth,
                              size.width > 500
                                  ? MobilePasswordText()
                                  : TabletPasswordText(),
                    
                              SizedBox(height: size.height * 0.05),
                    
                              size.width > 500
                                  ? Column(
                                      children: [
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
                                    )
                                  : CustomTextfields(
                                      label: AppText.emailaddress.tr(),
                                      eye: false,
                                      fieldName: 'emailaddress',
                                    ),
                    
                              spaceheigth,
                              SizedBox(height: size.height * 0.02),
                    
                              InkWell(
                                onTap: () {
                                  _validation(context);
                                },
                                child: ConfirmButton(text: AppText.confirmchanges.tr()),
                              ),
                    
                              SizedBox(height: size.height * 0.05),
                            ],
                          );
                        },
                      ),
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
  Size size = MediaQuery.of(context).size;
  if (size.width > 500) {
    bool isPasswordValid = provider.validateField('password');
    bool isConfirmPasswordValid = provider.validateField('confirmpassword');

    if (!isPasswordValid || !isConfirmPasswordValid) {
      return;
    }
    String password = provider.getController('password').text.trim();
    String confirmPassword = provider
        .getController('confirmpassword')
        .text
        .trim();
    if (password != confirmPassword) {
      provider.getController('confirmpassword');
      provider.validateField('confirmpassword');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: AppColor.red,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    context.pushNamed(AppRoutersName.loginroutename);
  } else {
    bool isEmailValid = provider.validateField('emailaddress');
    if (!isEmailValid) {
      return;
    }
    context.pushNamed(AppRoutersName.loginroutename);
  }
}
