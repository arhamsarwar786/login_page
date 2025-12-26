import 'package:flutter/material.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';
class TabletText extends StatelessWidget {
  const TabletText({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spaceheigth = SizedBox(height: size.height * 0.025);

    return Column(
                    children: [
                      Text(AppText.register, style: Appstyle().bold(context)),
                      spaceheigth,
                      Text(AppText.readytobecome, style: Appstyle().light2(context)),
                      Text(
                        AppText.belowandletthejourneybegin,
                        style: Appstyle().light2(context),
                      ),
                    ],
                  );
  }
}