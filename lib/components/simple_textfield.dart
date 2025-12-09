import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/appstyle.dart';

class SimpleTextfield extends StatefulWidget {
  final String label;
  const SimpleTextfield({super.key,required this.label,});

  @override
  State<SimpleTextfield> createState() => _CustomTextfieldsState();
}

class _CustomTextfieldsState extends State<SimpleTextfield> {
  bool obsessedtext=false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: sized_box_for_whitespace
    return size.width>600? Container(
      width: size.width * 0.35,
      height: size.height * 0.055,

      
      child: TextField(
        style: TextStyle(color: AppColor.white),
        cursorColor: AppColor.white,
      
        decoration: InputDecoration(  
          
          
          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          label: Text(widget.label,style: Appstyle().light(),),
          border: InputBorder.none,

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.grey),
          ),
        ),
      ),
    ):

     // ignore: sized_box_for_whitespace
     Container(
      width: size.width * 0.9,
      height: size.height * 0.06,

      
      child: TextField(
        style: TextStyle(color: AppColor.white),
        cursorColor: AppColor.white,
      
        decoration: InputDecoration(  
          
                    
          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          label: Text(widget.label,style: Appstyle().light(),),
          border: InputBorder.none,

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.grey),
          ),
        ),
      ),
    );
  }
}
