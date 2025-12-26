import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page/model/menu_model.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:login_page/views/widgets/gradient_icon.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int selected = 0;

  Future<void> _handleLogout() async {
    final themeProvider = context.read<ThemeProvider>();

    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title:  Text(AppText.logout),
        content:  Text(AppText.confirmLogout),
        actions: [
          Row(
            children: [
              Spacer(),
              InkWell(
                onTap: () => Navigator.pop(context, false),
                child: Container(
                height: 40,width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 119, 94, 209)),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: Text(AppText.cancel)))),
              SizedBox(width: 30),
 InkWell(
              onTap: () => Navigator.pop(context, true),
             child: Container(
              height: 40,width: 100,
              decoration: BoxDecoration(

                gradient: LinearGradient(
                  colors: [AppColor.pink, AppColor.blue],
                ),
                borderRadius: BorderRadius.circular(20),),
               child: Center(
                 child: Text(
                 AppText.logout,
                  style: TextStyle(color: Colors.white),
                           ),
               ),
             ),
           ),
Spacer(),

            ],
          ),
          
          
        ],
      ),
    );

    if (shouldLogout == true && mounted) {
    
      widget.scaffoldKey.currentState?.closeDrawer();
      
     
      await Future.delayed(const Duration(milliseconds: 300));
      await themeProvider.logout();

      if (mounted) {
        context.go('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 220,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: Color(0xFF202529), width: 1),
        ),
        color: isDark ? AppColor.white : AppColor.clrBoxBackground,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Row(
                    children: [
                      GradientIcon(icon: Icons.circle, size: 50),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppText.trailblazer,
                            style: TextStyle(
                              color: isDark ? AppColor.black : AppColor.clrBigText,
                              fontSize: 20,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            AppText.management,
                            style: TextStyle(
                              color: isDark ? AppColor.black : AppColor.clrBigText,
                              fontSize: 10,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 40),
                  for (var i = 0; i < menu.length; i++)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selected = i;
                          });
                          widget.scaffoldKey.currentState!.closeDrawer();
                        },
                        child: Row(
                          children: [
                            selected == i
                                ? GradientIcon(icon: menu[i].icon, size: 20)
                                : Icon(
                                    menu[i].icon,
                                    size: 20,
                                    color: AppColor.clrSmallText,
                                  ),
                            SizedBox(width: 10),
                            Text(
                              menu[i].title,
                              style: selected == i
                                  ? TextStyle(
                                      fontSize: 14,
                                      foreground: Paint()
                                        ..shader = LinearGradient(colors: [
                                          AppColor.pink,
                                          AppColor.blue,
                                        ]).createShader(Rect.fromLTWH(0, 0, 200, 70)),
                                    )
                                  : TextStyle(
                                      fontSize: 14,
                                      color: isDark ? AppColor.black : AppColor.clrSmallText,
                                      fontWeight: FontWeight.normal,
                                    ),
                            )
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
            for (var i = 0; i < bottomMenu.length; i++)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                child: InkWell(
                  onTap: () {
                    if (i == 1) {
                      _handleLogout();
                    } else {
                      widget.scaffoldKey.currentState?.closeDrawer();
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        bottomMenu[i].icon,
                        size: 20,
                        color: i == 1 ? Colors.red : AppColor.clrSmallText,
                      ),
                      SizedBox(width: 10),
                      Text(
                        bottomMenu[i].title,
                        style: TextStyle(
                          fontSize: 14,
                          color: i == 1 
                              ? Colors.red 
                              : (isDark ? AppColor.black : AppColor.clrSmallText),
                          fontWeight: i == 1 ? FontWeight.w500 : FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}