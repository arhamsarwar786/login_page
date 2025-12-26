import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';

class SocialLoginButton extends StatelessWidget {
 final String imge;
 final Color color;
 final imagecolor;
  const SocialLoginButton ({super.key, required this.imge, required this.color, this.imagecolor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    

    return 
    size.width<500?
     Container(padding:size.width>400? EdgeInsets.all(2):EdgeInsets.all(6),
      height: 45,
      width: size.width * 0.25,
      decoration: BoxDecoration(
        color:color ,
        border: Border.all(color: AppColor.grey, width: 1),
        borderRadius: BorderRadius.circular(2)
      ),
    
      child: Image.asset(imge,color: imagecolor,),
    ):size.width<1024?  Container(padding: EdgeInsets.all(3),
      height: 47,
      width: size.width * 0.18,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: AppColor.grey, width: 1),
        borderRadius: BorderRadius.circular(2)
      ),
    
      child: Image.asset(imge,color: imagecolor,),
    )    :
    Container(padding: EdgeInsets.symmetric(vertical: 5),
      height: 48,
      width: size.width * 0.12,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: AppColor.grey, width: 1),
        borderRadius: BorderRadius.circular(2)
      ),
    
      child: Image.asset(imge,color: imagecolor,),
    )     ;
  }
}
