import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/responsive.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:login_page/views/main_screen.dart';
import 'package:login_page/views/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    context.read<ThemeProvider>().loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideMenu(
        scaffoldKey: _scaffoldKey,
      ),
      backgroundColor: isDark ? AppColor.black : AppColor.white,
      body: SafeArea(
        right: false,left: false,top: false
        ,bottom: false,
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 2,
                child: SideMenu(
                  scaffoldKey: _scaffoldKey,
                ),
              ),
            Expanded(
              flex: 10,
              child: MainScreen(
                scaffoldKey: _scaffoldKey,
              ),
            )
          ],
        ),
      ),
    );
  }
}