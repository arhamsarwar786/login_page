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
import 'package:login_page/views/auth/widgets/circle_triangle.dart';
import 'package:login_page/views/auth/widgets/otp_password.dart';
import 'package:provider/provider.dart';

class VerifyPassword extends StatelessWidget {
  final String? email;  // Email parameter add kiya
  
  const VerifyPassword({super.key, this.email});  // Constructor update kiya

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spaceheigth = SizedBox(height: size.height * 0.04);

    // Email ko mask kar ke display karne ke liye
    String displayEmail = _getMaskedEmail(email);

    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.black,
          body: SingleChildScrollView(
            child: Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(),
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
                                AppText.verifyyourcode,
                                style: Appstyle().bold(context),
                              ),
                              SizedBox(height: size.height * 0.01),
                              size.width > 400
                                  ? Text(
                                      AppText.enterthepasscodeyoujust,
                                      style: Appstyle().light(),
                                    )
                                  : Column(
                                      children: [
                                        Text(
                                          AppText.enterthepass,
                                          style: Appstyle().light(),
                                        ),
                                        Text(
                                          AppText.youremailaddress,
                                          style: Appstyle().light(),
                                        ),
                                      ],
                                    ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppText.endingwith,
                                    style: Appstyle().light(),
                                  ),
                                  SizedBox(width: size.width * 0.02),
                                  Text(
                                    displayEmail,  // "data" ki jagah email show hoga
                                    style: Appstyle().light().copyWith(
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
                                child: ConfirmButton(text: AppText.verify),
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
        // ignore: prefer_interpolation_to_compose_strings
        return username + '@' + parts[1];
      }
      String lastFour = username.substring(username.length - 4);
      // ignore: prefer_interpolation_to_compose_strings
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