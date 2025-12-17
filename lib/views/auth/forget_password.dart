import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spaceheigth = SizedBox(height: size.height * 0.04);

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
                                AppText.forgepassword,
                                style: Appstyle().bold(context),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Text(
                                AppText
                                    .typeyourauthorisedemailaddresstoreceiveresetpasswordlink,
                                style: Appstyle().light(),
                              ),
                              Text(AppText.passwordlink, style: Appstyle().light()),
                              spaceheigth,
                              SimpleTextfield(
                                label: AppText.emailaddress,
                                fieldName: 'emailaddress',
                                controller: null,
                              ),
                              spaceheigth,
                              InkWell(
                                onTap: () {
                                  _validation(context);
                                },
                                child: ConfirmButton(
                                  text: AppText.forgepassword,
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