import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';

class TabletPasswordText extends StatelessWidget {
  const TabletPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppText.typeyournewstrongpassword.tr(),
          style: Appstyle().light2(context),
        ),
        Text(AppText.mustinclude.tr(), style: Appstyle().light2(context)),

        Text(AppText.type1.tr(), style: Appstyle().light2(context)),
        Text(AppText.type2.tr(), style: Appstyle().light2(context)),
        Text(AppText.type3.tr(), style: Appstyle().light2(context)),
      ],
    );
  }
}
