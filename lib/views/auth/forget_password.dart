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
import 'package:login_page/components/simple_textfield.dart';
import 'package:login_page/utils/app_routers_name.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';
import 'package:login_page/utils/bg_gradient.dart';
import 'package:login_page/viewmodel/login_view_model.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  void initState() {
    super.initState();
    context.read<ThemeProvider>().loadTheme();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spaceheigth = SizedBox(height: size.height * 0.04);
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
               BgGradient().background3gradient(context),
                 Circletriangle(),
                  GroupIconImage(),
                  Group1IconImage(),
                    
                  Positioned(
                    child: Center(
                      child: Consumer<LoginViewModel>(
                        builder: (context, provider, child) {
                          return Column(
                            children: [
                              SizedBox(height: size.height * 0.3),
                              Text(
                                AppText.forgepassword.tr(),
                                style: Appstyle().bold(context),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Text(
                                AppText
                                    .typeyourauthorisedemailaddresstoreceiveresetpasswordlink.tr(),
                                style: Appstyle().light2(context),
                              ),
                              Text(AppText.passwordlink.tr(), style: Appstyle().light(context)),
                              spaceheigth,
                              SimpleTextfield(
                                label: AppText.emailaddress.tr(),
                                fieldName: 'emailaddress',
                                controller: null,
                              ),
                              spaceheigth,
                              InkWell(
                                onTap: () {
                                  _validation(context);
                                },
                                child: ConfirmButton(
                                  text: AppText.forgepassword.tr(),
                                ),
                              ),
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
  bool isEmailValid = provider.validateField('emailaddress');
 
  if (isEmailValid) {
    // Email ki value get karo
    String email = provider.getFieldValue('emailaddress') ?? '';
    
    // Email ko next screen pe pass karo
    context.pushNamed(
      AppRoutersName.verifypasswordroutename,
      extra: email,  // Yeh email next screen ko jayegi
    );
  }
}