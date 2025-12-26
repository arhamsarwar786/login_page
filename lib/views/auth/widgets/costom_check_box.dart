import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:provider/provider.dart';

class CostomCheckBox extends StatelessWidget {
  const CostomCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return Checkbox(
          value: provider.rememberMe,
          focusColor: AppColor.darkblue,
          activeColor: AppColor.darkblue,
          onChanged: (value) {
            provider.setRememberMe(value ?? false);
          },
        );
      },
    );
  }
}