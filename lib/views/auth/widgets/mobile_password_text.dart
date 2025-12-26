import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';

class MobilePasswordText extends StatelessWidget {
  const MobilePasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppText.typeyournewstrongpassword.tr(),
                        style: Appstyle().light2(context),
                      ),
                      Text(AppText.onecapitalletter.tr(), style: Appstyle().light2(context)),
                      Text(AppText.characterminimum.tr(), style: Appstyle().light2(context)),
                    ],
                  );
  }
}