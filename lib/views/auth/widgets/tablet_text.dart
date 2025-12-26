import 'package:easy_localization/easy_localization.dart';
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
                      Text(AppText.register.tr(), style: Appstyle().bold(context)),
                      spaceheigth,
                      Text(AppText.readytobecome.tr(), style: Appstyle().light2(context)),
                      Text(
                        AppText.belowandletthejourneybegin.tr(),
                        style: Appstyle().light2(context),
                      ),
                    ],
                  );
  }
}