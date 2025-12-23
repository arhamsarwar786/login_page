import 'package:flutter/material.dart';
import 'package:login_page/model/detail_card_model.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/responsive.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.clrBoxBackground,
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
                
        
                color: AppColor.clrBoxBackground,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              headingRowColor: WidgetStateProperty.all(AppColor.clrBoxBackground),
              dataRowColor: WidgetStateProperty.all(AppColor.lightgrey),
              columnSpacing: Responsive.isMobile(context) ? 50 : 100,
              horizontalMargin: !Responsive.isMobile(context) ? 20 : 10,
              headingRowHeight: !Responsive.isMobile(context) ? 56 : 48,
              
              dividerThickness: 1,
        
              columns: [
                _buildDataColumn(Icons.numbers, "Numbers"),
                _buildDataColumn(Icons.numbers, "Id's"),
                _buildDataColumn(Icons.people, "Persons"),
                _buildDataColumn(Icons.email, "Email"),
                _buildDataColumn(Icons.map_rounded, "Country"),
                _buildDataColumn(Icons.info_outline, "Status"),
                _buildDataColumn(Icons.book, "Job Title"),
              ],
              rows: detailsList.map((detail) => _buildDataRow(detail)).toList(),
            ),
          ),
        ),
      ),
    );
  }

  DataColumn _buildDataColumn(IconData icon, String label) {
    return DataColumn(
      label: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColor.clrSmallText, size: 15),
          SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: AppColor.clrBigText,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildDataRow(DetailCardModel detail) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            detail.number,
            style: TextStyle(color: AppColor.clrBigText, fontSize: 13),
          ),
        ),
        DataCell(Text(
          detail.id,
          style: TextStyle(color: AppColor.clrBigText, fontSize: 13),
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
                style: TextStyle(color: AppColor.clrBigText, fontSize: 13),
              ),
            ],
          ),
        ),
        DataCell(
          Text(
            detail.email,
            style: TextStyle(color: AppColor.clrBigText, fontSize: 13),
          ),
        ),
        DataCell(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.flag, color: AppColor.clrSmallText, size: 15),
              SizedBox(width: 5),
              Text(
                detail.countryName,
                style: TextStyle(color: AppColor.clrBigText, fontSize: 13),
              ),
            ],
          ),
        ),
        DataCell(
          Text(
            detail.status,
            style: TextStyle(color: AppColor.clrBigText, fontSize: 13),
          ),
        ),
        DataCell(
          Text(
            detail.jobTitle,
            style: TextStyle(color: AppColor.clrBigText, fontSize: 13),
          ),
        ),
      ],
    );
  }
}