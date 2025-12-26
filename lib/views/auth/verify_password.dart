import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/components/confirm_button.dart';
import 'package:login_page/components/group1_icon_image.dart';
import 'package:login_page/components/group_icon_image.dart';
import 'package:login_page/utils/app_routers_name.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';
import 'package:login_page/utils/bg_gradient.dart';
import 'package:login_page/viewmodel/login_view_model.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:login_page/views/auth/widgets/circle_triangle.dart';
import 'package:login_page/views/auth/widgets/otp_password.dart';
import 'package:provider/provider.dart';

class VerifyPassword extends StatefulWidget {
  final String? email;  
  
  const VerifyPassword({super.key, this.email}); 

  @override
  State<VerifyPassword> createState() => _VerifyPasswordState();
}

class _VerifyPasswordState extends State<VerifyPassword> {
  @override
  void initState() {
    super.initState();
    context.read<ThemeProvider>().isDarkMode;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spaceheigth = SizedBox(height: size.height * 0.04);
    final isDark=Provider.of<ThemeProvider>(context).isDarkMode;

    String displayEmail = _getMaskedEmail(widget.email);

    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: isDark? AppColor.white: AppColor.black,
          body: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              width: size.width,
             child: Stack(
                children: [
                BgGradient().background4gradient(context),
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
                                AppText.verifyyourcode.tr(),
                                style: Appstyle().bold(context),
                              ),
                              SizedBox(height: size.height * 0.01),
                              size.width > 400
                                  ? Text(
                                      AppText.enterthepasscodeyoujust.tr(),
                                      style: Appstyle().light2(context),
                                    )
                                  : Column(
                                      children: [
                                        Text(
                                          AppText.enterthepass.tr(),
                                          style: Appstyle().light2(context),
                                        ),
                                        Text(
                                          AppText.youremailaddress.tr(),
                                          style: Appstyle().light2(context),
                                        ),
                                      ],
                                    ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppText.endingwith.tr(),
                                    style: Appstyle().light2(context),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    displayEmail,  
                                    style: Appstyle().light2(context).copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              spaceheigth,
                              OtpPassword(),
                              spaceheigth,
                              InkWell(
                                onTap: () {
                                  _validation(context);
                                },
                                child: ConfirmButton(text: AppText.verify.tr()),
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

  String _getMaskedEmail(String? email) {
    if (email == null || email.isEmpty) return '..';
    
    if (email.contains('@')) {
      List<String> parts = email.split('@');
      String username = parts[0];
      
      if (username.length <= 4) {
        return username + '@' + parts[1];
      }
      String lastFour = username.substring(username.length - 4);
      return  lastFour + '@' + parts[1];
    }
    
    if (email.length <= 4) return email;
    return email.substring(email.length - 4);
  }
}

void _validation(BuildContext context) {
  var provider = context.read<LoginViewModel>();
  bool isOtpValid = provider.validateOtp();

  if (isOtpValid) {
    context.pushNamed(AppRoutersName.createnewpasswordroutename);
  }
}