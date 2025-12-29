import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:login_page/model/main_card_model.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/responsive.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatefulWidget {
  final MainCardModel mainCardModel;

  const CustomCard({super.key, required this.mainCardModel});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    Size size = MediaQuery.of(context).size;
 


    return HoverContainer(
      hoverDecoration: BoxDecoration(
        color: isDark ? AppColor.white : AppColor.clrBoxBackground,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 63, 63, 63),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(2, 5),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isDark ? AppColor.white : AppColor.clrBoxBackground,
        boxShadow: [BoxShadow(color: Color(0xff333333), spreadRadius: 1)],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: _buildCardContent(size, isDark, context),
    );
  }

  Widget _buildCardContent(Size size, bool isDark, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: size.width < 350 ? 30 : 30,
          width: size.width < 350 ? 30: 30,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColor.clrGradient1,
                AppColor.clrGradient2,
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Icon(
            widget.mainCardModel.iconData,
            color: AppColor.clrWhite,
          ),
        ),
        SizedBox(width: 10),
        Text(
          widget.mainCardModel.title!,
          maxLines: 1,
          style: TextStyle(
            color: isDark ? AppColor.black : AppColor.clrBigText,
            fontWeight: FontWeight.w700,
            fontFamily: "hel",
            fontSize: size.width < 365 ? 10 : (Responsive.isMobile(context) ? 16 : 16),
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.mainCardModel.count.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isDark ? AppColor.black : AppColor.white,
                fontFamily: "hel",
                fontSize: size.width < 365 ? 10 : (Responsive.isMobile(context) ? 15 : 27),
              ),
            ),
            SizedBox(width: 10),
            Text(
              widget.mainCardModel.subTitle!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isDark ? AppColor.grey : AppColor.clrSmallText,
                fontFamily: "hel",
                fontSize: size.width < 365 ? 10 : (Responsive.isMobile(context) ? 13 : 16),
              ),
            )
          ],
        ),
        Text(
          widget.mainCardModel.percentage!,
          style: TextStyle(
            color: widget.mainCardModel.color,
            fontFamily: "hel",fontSize:  size.width < 365 ? 10 : (Responsive.isMobile(context) ? 13 : 16),
          ),
        ),
      ],
    );
  }
}