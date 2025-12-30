import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_routers_name.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final themeProvider = context.read<ThemeProvider>();
    await themeProvider.loadLoginState();
    await themeProvider.loadRememberMe();
    await themeProvider.loadTheme();
    
    await Future.delayed(const Duration(seconds: 3));
    
    if (!mounted) return;
    
    if (themeProvider.shouldAutoLogin()) {
      context.goNamed(AppRoutersName.dashboard);
    } else {
      context.goNamed(AppRoutersName.loginroutename);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    
    return Scaffold(
      backgroundColor: isDark ? AppColor.black : AppColor.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.circle,
              size: 100,
              color: AppColor.blue,
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(),
            const SizedBox(height: 30),
            Text(
              AppText.trailblazer.tr(),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColor.white : AppColor.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              AppText.management.tr(),
              style: TextStyle(
                fontSize: 16,
                color: isDark ? AppColor.white : AppColor.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}