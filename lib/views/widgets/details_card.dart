import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_page/model/detail_card_model.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/responsive.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:provider/provider.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark= Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color:isDark ? AppColor.white : AppColor.clrBoxBackground,
        boxShadow: [BoxShadow(color: AppColor.greydark, spreadRadius: 1)],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
            
              decoration: BoxDecoration(
                
        
                color:isDark?AppColor.white: AppColor.clrBoxBackground,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              headingRowColor: WidgetStateProperty.all(isDark?AppColor.white:    AppColor.clrBoxBackground),
              dataRowColor: WidgetStateProperty.all(isDark?AppColor.white: AppColor.lightgrey),
              columnSpacing: Responsive.isMobile(context) ? 50 : 100,
        horizontalMargin: !Responsive.isMobile(context) ? 20 : 10,
        headingRowHeight: !Responsive.isMobile(context) ? 56 : 48,
        
        dividerThickness: 1,
        columns: [
                _buildDataColumn(Icons.numbers, AppText.numbers.tr(),context),
                _buildDataColumn(Icons.numbers, AppText.id.tr(),context),
                _buildDataColumn(Icons.people, AppText.persons.tr(),context),
                _buildDataColumn(Icons.email, AppText.email.tr(),context),
                _buildDataColumn(Icons.map_rounded, AppText.country.tr(),context),
                _buildDataColumn(Icons.info_outline, AppText.status.tr(),context),
                _buildDataColumn(Icons.book, AppText.jobTitle.tr(),context),
              ],
              rows: getDetailsList().map((detail) => _buildDataRow(detail,context)).toList(),
            ),
          ),
        ),
      ),
    );
  }

  DataColumn _buildDataColumn(IconData icon, String label,BuildContext  context) {
      final isDark= Provider.of<ThemeProvider>(context).isDarkMode;
    return DataColumn(
      label: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColor.clrSmallText, size: 15),
          SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color:isDark ? AppColor.black : AppColor.clrBigText,
              fontSize: 13,
              fontWeight: FontWeight.bold,fontFamily: "hel",
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildDataRow(DetailCardModel detail,BuildContext context) {
      final isDark= Provider.of<ThemeProvider>(context).isDarkMode;
    return DataRow(
      cells: [
        DataCell(
          Text(
            detail.number,
            style: TextStyle(color:isDark ? AppColor.black : AppColor.clrBigText,fontFamily: "hel", fontSize: 13),
          ),
        ),
        DataCell(Text(
          detail.id,
          style: TextStyle(color:isDark ? AppColor.black : AppColor.clrBigText, fontFamily: "hel",fontSize: 13),
        ),),
        
        DataCell(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                detail.personImage,
                width: 12,
                height: 12,
                color: AppColor.clrSmallText,
              ),
              SizedBox(width: 5),
              Text(
                detail.personName,
                style: TextStyle(color:isDark ? AppColor.black : AppColor.clrBigText,fontFamily: "hel", fontSize: 13),
              ),
            ],
          ),
        ),
        DataCell(
          Text(
            detail.email,
            style: TextStyle(color:isDark ? AppColor.black : AppColor.clrBigText,fontFamily: "hel", fontSize: 13),
          ),
        ),
        DataCell(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.flag, color:isDark ? AppColor.black : AppColor.clrSmallText, size: 15),
              SizedBox(width: 5),
              Text(
                detail.countryName,
                style: TextStyle(color:isDark ? AppColor.black : AppColor.clrBigText, fontFamily: "hel", fontSize: 13),
              ),
            ],
          ),
        ),
        DataCell(
          Text(
            detail.status,
            style: TextStyle(color:isDark ? AppColor.black : AppColor.clrBigText,fontFamily: "hel", fontSize: 13),
          ),
        ),
        DataCell(
          Text(
            detail.jobTitle,
            style: TextStyle(color:isDark ? AppColor.black : AppColor.clrBigText, fontFamily: "hel",fontSize: 13),
          ),
        ),
      ],
    );
  }
}