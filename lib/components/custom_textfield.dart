import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/appstyle.dart';

class CustomTextfields extends StatefulWidget {
  final String label;
  final bool eye;
  const CustomTextfields({super.key,required this.label,required this.eye});

  @override
  State<CustomTextfields> createState() => _CustomTextfieldsState();
}

class _CustomTextfieldsState extends State<CustomTextfields> {
  bool obsessedtext=false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: sized_box_for_whitespace
    return size.width>600? Container(
      width: size.width * 0.35,
      height: size.height * 0.055,

      
      child: TextField(
        obscureText: obsessedtext,
        style: TextStyle(color: AppColor.white),
        cursorColor: AppColor.white,
      
        decoration: InputDecoration(  
          
           suffixIcon: InkWell(
            onTap: () {
              setState(() {
                obsessedtext=!obsessedtext;
              });
            },
            child:widget.eye==true? Icon( obsessedtext? Icons.visibility:Icons.visibility_off,size: 18,):null),
            // widget.eye==true ? Icon(Iconsax.eye_slash,color: AppColor.white,size: size.height*0.020,): null,
          
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
        obscureText: obsessedtext,
        style: TextStyle(color: AppColor.white),
        cursorColor: AppColor.white,
      
        decoration: InputDecoration(  
          
           suffixIcon:  InkWell(
            onTap: () {
             
              setState(() {
                obsessedtext=!obsessedtext;
              });
          
            },
            child:Icon( obsessedtext?  Icons.visibility: Icons.visibility_off,size: 15,),),
          
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
