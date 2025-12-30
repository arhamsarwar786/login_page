import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page/utils/app_routers_name.dart';
import 'package:login_page/views/auth/create_new_password.dart';
import 'package:login_page/views/auth/forget_password.dart';
import 'package:login_page/views/auth/login.dart';
import 'package:login_page/views/auth/register.dart';
import 'package:login_page/views/auth/reset_password.dart';
import 'package:login_page/views/auth/verify_password.dart';
import 'package:login_page/views/dashboard.dart';
import 'package:login_page/views/notification.dart';
import 'package:login_page/views/splash.dart';

class MyAppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      // Splash Screen Route
      GoRoute(
        name: 'splash',
        path: '/splash',
        pageBuilder: (context, state) {
          return MaterialPage(child: SplashScreen());
        },
      ),
      // notification
      GoRoute(
        name: AppRoutersName.notificationroutename,
        path: "/notification",
        pageBuilder: (context, state) {
          return MaterialPage(child: Notifications());
        },
      ),
      // Login Route
      GoRoute(
        name: AppRoutersName.loginroutename,
        path: "/login",
        pageBuilder: (context, state) {
          return MaterialPage(child: Login());
        },
      ),
      
      // Register Route
      GoRoute(
        name: AppRoutersName.registerroutename,
        path: "/register",
        pageBuilder: (context, state) {
          return MaterialPage(child: Register());
        },
      ),
      
      // Reset Password Route
      GoRoute(
        name: AppRoutersName.resetpasswordroutename,
        path: "/resetpassword",
        pageBuilder: (context, state) {
          return MaterialPage(child: ResetPassword());
        },
      ),
      
      // Create New Password Route
      GoRoute(
        name: AppRoutersName.createnewpasswordroutename,
        path: "/createpassword",
        pageBuilder: (context, state) {
          return MaterialPage(child: CreateNewPassword());
        },
      ),
      
      // Verify Password Route
      GoRoute(
        name: AppRoutersName.verifypasswordroutename,
        path: "/verifypassword",
        pageBuilder: (context, state) {
          final email = state.extra as String?;
          return MaterialPage(child: VerifyPassword(email: email));
        },
      ),
      
      // Forget Password Route
      GoRoute(
        name: AppRoutersName.forgetpassword,
        path: "/forgetpassword",
        pageBuilder: (context, state) {
          return MaterialPage(child: ForgetPassword());
        },
      ),
      
      // Dashboard Route
      GoRoute(
        name: AppRoutersName.dashboard,
        path: "/dashboard",
        pageBuilder: (context, state) {
          return MaterialPage(child: DashboardScreen());
        },
      ),
    ],
  );
}