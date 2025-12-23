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

class MyAppRouter {

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: AppRoutersName.loginroutename,
        path: "/",
        pageBuilder: (context, state) {
          return MaterialPage(child: Login());
        },
      ),
      GoRoute(
        name: AppRoutersName.registerroutename,
        path: "/register",
        pageBuilder: (context, state) {
          return MaterialPage(child: Register());
        },
      ),
      GoRoute(
        name: AppRoutersName.resetpasswordroutename,
        path: "/resetpassword",
        pageBuilder: (context, state) {
          return MaterialPage(child: ResetPassword());
        },
      ),
      GoRoute(
        name: AppRoutersName.createnewpasswordroutename,
        path: "/createpassword",
        pageBuilder: (context, state) {
          return MaterialPage(child: CreateNewPassword());
        },
      ),
      GoRoute(
        name: AppRoutersName.verifypasswordroutename,
        path: "/verifypassword",
        pageBuilder: (context, state) {
          final email = state.extra as String?;
          return MaterialPage(child: VerifyPassword(email: email));
        },
      ),
      GoRoute(
        name: AppRoutersName.forgetpassword,
        path: "/forgetpassword",
        pageBuilder: (context, state) {
          return MaterialPage(child: ForgetPassword());
        },
      ),
      GoRoute(
        name: AppRoutersName.dashboard,
        path: "/dashboard",
        pageBuilder: (context, state) {
          return MaterialPage(child: DashboardScreen());
        },
      )
    ],
  );
}