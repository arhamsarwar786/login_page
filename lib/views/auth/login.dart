// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page/components/custom_textfield.dart';
import 'package:login_page/viewmodel/auth_view.model.dart';
import 'package:login_page/viewmodel/login_view_model.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:login_page/views/auth/widgets/circle_triangle.dart';
import 'package:login_page/views/auth/widgets/language_icon.dart';
import 'package:provider/provider.dart';
import 'package:login_page/components/confirm_button.dart';
import 'package:login_page/components/group1_icon_image.dart';
import 'package:login_page/components/group_icon_image.dart';
import 'package:login_page/components/simple_textfield.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_routers_name.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';
import 'package:login_page/utils/bg_gradient.dart';
import 'package:login_page/utils/costom_spacing.dart';
import 'package:login_page/views/auth/widgets/costom_check_box.dart';
import 'package:login_page/views/auth/widgets/costom_spacer.dart';
import 'package:login_page/views/auth/widgets/auth_footers.dart';
import 'package:login_page/views/auth/widgets/social_links.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ThemeProvider>().loadTheme();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spaceheigth = SizedBox(height: size.height * 0.025);
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        top: true,
        child: Scaffold(
          backgroundColor: isDark ? AppColor.white : AppColor.black,
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  BgGradient().background1gradient(context),
                  Circletriangle(),
                  GroupIconImage(),
                  Group1IconImage(),
                  LanguageIcon(),
                  
                  Center(
                    child: Consumer2<AuthViewModel, LoginViewModel>(
                      builder: (context, authProvider, loginProvider, child) {
                        return Column(
                          children: [
                            SizedBox(height: size.height * 0.2),
                            Text(
                              AppText.welcomebacktrailblazer.tr(),
                              style: Appstyle().bold(context),
                            ),
                            spaceheigth,
                            Text(AppText.weareexiting.tr(), style: Appstyle().light2(context)),
                            Text(AppText.youraccount.tr(), style: Appstyle().light2(context)),
                            spaceheigth,
                            SimpleTextfield(
                              label: AppText.emailaddress.tr(),
                              fieldName: 'emailaddress',
                              controller: _emailController,
                            ),
                            spaceheigth,
                            CustomTextfields(
                              label: AppText.password.tr(),
                              eye: true,
                              fieldName: "password",
                              controller: _passwordController,
                            ),
                            SizedBox(height: size.height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CostomCheckBox(),
                                Text(
                                  AppText.rememberme.tr(),
                                  style: Appstyle().light(context),
                                ),
                                CostomSpacing.space(context),
                                InkWell(
                                  onTap: () {
                                    context.pushNamed(
                                      AppRoutersName.forgetpassword,
                                    );
                                  },
                                  child: Text(
                                    AppText.forgetpassword.tr(),
                                    style: Appstyle().light(context),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.03),
                            
                            InkWell(
                              onTap: authProvider.isLoading 
                                  ? null 
                                  : () {
                                      _validation(
                                        context,
                                        _emailController,
                                        _passwordController,
                                      );
                                    },
                              child: Container(
                                width: _getButtonWidth(size),
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient: authProvider.isLoading 
                                      ? LinearGradient(
                                          colors: [
                                            AppColor.grey.withOpacity(0.5),
                                            AppColor.grey.withOpacity(0.5),
                                          ],
                                        )
                                      : null,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: authProvider.isLoading
                                    ? Center(
                                        child: SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2.5,
                                            valueColor: AlwaysStoppedAnimation<Color>(
                                              AppColor.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    : ConfirmButton(text: AppText.login.tr()),
                              ),
                            ),
                            
                            if (authProvider.errorMessage != null)
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * 0.02,
                                  left: 20,
                                  right: 20,
                                ),
                                child: Text(
                                  authProvider.errorMessage!,
                                  style: TextStyle(
                                    color: AppColor.red,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            
                            SizedBox(height: size.height * 0.045),
                            CostomSpacer(),
                            SizedBox(height: size.height * 0.045),
                            SocialLinks(),
                            SizedBox(height: size.height * 0.02),
                            AuthFooters(
                              text: AppText.register.tr(),
                              navigator: AppRoutersName.registerroutename,
                            ),
                            SizedBox(height: size.height * 0.20),
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

  double _getButtonWidth(Size size) {
    if (size.width < 600) {
      return size.width * 0.85;
    } else if (size.width < 768) {
      return size.width * 0.7;
    } else if (size.width < 1024) {
      return size.width * 0.6;
    } else if (size.width < 1440) {
      return size.width * 0.45;
    } else {
      return size.width * 0.4;
    }
  }
}

void _validation(
  BuildContext context,
  TextEditingController emailController,
  TextEditingController passwordController,
) async {
  var authProvider = context.read<AuthViewModel>();
  var loginProvider = context.read<LoginViewModel>();
  var themeProvider = context.read<ThemeProvider>();
  

  bool isEmailValid = loginProvider.validateExternalField(
    'emailaddress', 
    emailController.text
  );
  
  bool isPasswordValid = loginProvider.validateExternalField(
    'password', 
    passwordController.text
  );
  
  if (!isEmailValid || !isPasswordValid) {
    return;
  }


  final success = await authProvider.login(
    emailController.text.trim(),
    passwordController.text,
  );

  if (success) {
    

    await themeProvider.login(rememberMe: themeProvider.rememberMe);
    
    if (context.mounted) {
      context.goNamed(AppRoutersName.dashboard);
    }
  } else {
    
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authProvider.errorMessage ?? 'Login failed'),
          backgroundColor: AppColor.red,
        ),
      );
    }
  }
}