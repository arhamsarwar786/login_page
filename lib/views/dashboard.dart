import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/responsive.dart';
import 'package:login_page/views/main_screen.dart';
import 'package:login_page/views/widgets/side_menu.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideMenu(scaffoldKey: _scaffoldKey,),
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Row(
          children: [
            if(Responsive.isDesktop(context))
            Expanded(
                flex: 2,
                child: SideMenu(scaffoldKey: _scaffoldKey,)),
            Expanded(
                flex: 10,
                child: MainScreen(scaffoldKey: _scaffoldKey,))
          ],
        ),
      ),
    );
  }
}