import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/responsive.dart';
import 'package:login_page/views/widgets/circular_icon.dart';

class HeaderWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HeaderWidget({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!Responsive.isDesktop(context))
            InkWell(
                onTap: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                child: Padding(
                  padding:  EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.menu,
                    color: AppColor.clrSmallText,
                    size: 25,
                  ),
                )),
          if (!Responsive.isMobile(context))
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: AppColor.clrBoxBackground,
                          boxShadow: [
                            BoxShadow(color: Color(0xFF333333), spreadRadius: 1)
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                            filled: false,
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: AppColor.clrBoxBackground)),
                            contentPadding: EdgeInsets.symmetric(vertical: 5),
                            hintText: "Search Anything",
                            hintStyle: TextStyle(
                                color: AppColor.clrSmallText, fontSize: 14),
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColor.clrSmallText,
                              size: 20,
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircularIcon(
                              iconData: Icons.notifications_active_sharp),
                          SizedBox(
                            width: 10,
                          ),
                          CircularIcon(iconData: Icons.message),
                          SizedBox(
                            width: 10,
                          ),
                         CircularIcon(iconData: Icons.settings),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Faizan",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.clrWhite,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Flutter Developer",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColor.clrSmallText,
                                ),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),

          if(Responsive.isMobile(context))
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularIcon(iconData: Icons.search, ),
                SizedBox(width: 10,),
                CircularIcon(iconData: Icons.notifications_active_sharp, ),
                SizedBox(width: 10,),
                CircularIcon(iconData: Icons.message, ),
                SizedBox(width: 10,),
                CircleAvatar(
                  backgroundColor: AppColor.clrBoxBackground,
                  child:Icon(Icons.group, color: AppColor.clrSmallText,),
                )
              ],
            )
        ],
      ),
    );
  }
}