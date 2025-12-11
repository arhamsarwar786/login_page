import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page/utils/app_routers_name.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';

// ignore: must_be_immutable
class AuthFooters extends StatelessWidget {
  var text;
  var navigator;
   AuthFooters({super.key,required this.text,required this.navigator});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spacewidth = SizedBox(width: size.width * 0.02);
    return size.width < 500
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppText.donthave, style: Appstyle().light1()),
              InkWell(
                onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_)=>navigator));

                },
                child: Text(text, style: Appstyle().light()),
              ),
            ],
          )
        : Row(
            children: [
              spacewidth,
              Text(AppText.donthave, style: Appstyle().light1()),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => navigator),
                  );
                },
                child: Text(text, style: Appstyle().light()),
              ),
              Spacer(),
              Text(AppText.contactsupport, style: Appstyle().light()),
              spacewidth,
            ],
          );
  }
}
