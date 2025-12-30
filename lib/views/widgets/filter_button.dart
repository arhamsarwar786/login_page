import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:  size.width>430? 25:15, vertical:size.width>430? 10:7),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.white : AppColor.lightwhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColor.black,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: size.width>430?14:10,
            color: isSelected ? AppColor.deepblue: AppColor.white,
            fontWeight: FontWeight.w600,fontFamily: "hel"
          ),
        ),
      ),
    );
  }
}
