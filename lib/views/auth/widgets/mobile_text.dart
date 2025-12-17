import 'package:flutter/material.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';
class MobileText extends StatelessWidget {
  const MobileText({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var spacewidth = SizedBox(width: size.width * 0.1);
    var spaceheigth = SizedBox(height: size.height * 0.025);
    return Column(
                    children: [
                      Row(
                        children: [
                          spacewidth,
                          Text(AppText.register, style: Appstyle().bold(context)),
                          spaceheigth,
                        ],
                      ),
                      SingleChildScrollView(
                        child: Row(
                          children: [
                            spacewidth,
                            Text(
                              AppText.readytobecome,
                              style: Appstyle().light(),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          spacewidth,
                          Text(
                            AppText.belowandletthejourneybegin,
                            style: Appstyle().light(),
                          ),
                        ],
                      ),
                    ],
                  )
;
  }
}