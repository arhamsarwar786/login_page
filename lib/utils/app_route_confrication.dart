
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page/utils/app_routers_name.dart';
import 'package:login_page/views/auth/create_new_password.dart';
import 'package:login_page/views/auth/login_screen.dart';
import 'package:login_page/views/auth/register_screen.dart';
import 'package:login_page/views/auth/reset_password.dart';
import 'package:login_page/views/auth/verify_password.dart';

class MyAppRouter {

GoRouter router=  GoRouter(
   routes: [
    GoRoute(
  name: AppRoutersName.loginroutename,
  path: "/",
  pageBuilder: (context, state) {
    return MaterialPage(child: LoginScreen());
  },
  
  )
  , GoRoute(
  name: AppRoutersName.registerroutename,
  path: "/register",
  pageBuilder: (context, state) {
    return MaterialPage(child:RegisterScreen() );
  },
  
  ), GoRoute(
  name: AppRoutersName.resetpasswordroutename,
  path: "/resetpassword",
  pageBuilder: (context, state) {
    return MaterialPage(child: ResetPassword());
  },
  
  ), GoRoute(
  name: AppRoutersName.createnewpasswordroutename,
  path: "/createpassword",
  pageBuilder: (context, state) {
    return MaterialPage(child: CreateNewPassword());
  },
  
  ), GoRoute(
  name:AppRoutersName.verifypasswordroutename,
  path: "/verify password",
  pageBuilder: (context, state) {
    return MaterialPage(child: VerifyPassword() );
  },
  
  )
   ],
  
  );

}