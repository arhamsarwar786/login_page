import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page/components/custom_textfield.dart';
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
      child: SafeArea(
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
                    child: Consumer<LoginViewModel>(
                      builder: (context, provider, child) {
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
                              controller: null,
                            ),
                            spaceheigth,
                            CustomTextfields(
                              label: AppText.password.tr(),
                              eye: true,
                              fieldName: "password",
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
                              onTap: () {
                                _validation(context);
                              },
                              child: ConfirmButton(text: AppText.login.tr()),
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
}

void _validation(BuildContext context) async {
  var loginProvider = context.read<LoginViewModel>();
  var themeProvider = context.read<ThemeProvider>();
  
  bool isemailaddressValid = loginProvider.validateField('emailaddress');
  bool isPasswordValid = loginProvider.validateField('password');
  
  if (!isemailaddressValid || !isPasswordValid) {
    return;
  }

  await themeProvider.login(rememberMe: themeProvider.rememberMe);
  
  if (context.mounted) {
    context.goNamed(AppRoutersName.dashboard);
  }
}