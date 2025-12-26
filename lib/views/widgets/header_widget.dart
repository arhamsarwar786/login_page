import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/responsive.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:login_page/views/widgets/circular_icon.dart';
import 'package:provider/provider.dart';

class HeaderWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HeaderWidget({super.key, required this.scaffoldKey});

  

 

  
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!Responsive.isDesktop(context))
            InkWell(
              onTap: () => scaffoldKey.currentState!.openDrawer(),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Icon(
                  Icons.menu,
                  color:
                      isDark ? AppColor.black : AppColor.clrSmallText,
                ),
              ),
            ),

          if (!Responsive.isMobile(context))
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isDark
                            ? AppColor.white
                            : AppColor.clrBoxBackground,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: AppText.searchanything,
                          prefixIcon: Icon(
                            Icons.search,
                            color: isDark
                                ? AppColor.black
                                : AppColor.clrWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircularIcon(
                          iconData: Icons.language,
                          onTap: () => _showLanguageDialog(context),
                        ),
                        const SizedBox(width: 10),
                        CircularIcon(
                            iconData:
                                Icons.notifications_active_sharp),
                        const SizedBox(width: 10),
                        CircularIcon(iconData: Icons.message),
                        const SizedBox(width: 10),
                        CircularIcon(
                          iconData: isDark
                              ? Icons.light_mode
                              : Icons.dark_mode,
                          onTap: themeProvider.switchTheme,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppText.faizan,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              AppText.flutterDeveloper,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          if (Responsive.isMobile(context))
            Row(
              children: [
                CircularIcon(iconData: Icons.search),
                const SizedBox(width: 10),
                CircularIcon(
                  iconData: Icons.language,
                  onTap: () => _showLanguageDialog(context),
                ),
                const SizedBox(width: 10),
                CircularIcon(
                    iconData: Icons.notifications_active_sharp),
                const SizedBox(width: 10),
                CircularIcon(iconData: Icons.message),
                const SizedBox(width: 10),
                CircularIcon(
                  iconData:
                      isDark ? Icons.light_mode : Icons.dark_mode,
                  onTap: themeProvider.switchTheme,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
 _buildLanguageOption(
    BuildContext context, {
    required String flag,
    required String language,
    required Locale locale,
    required bool isDark,
  }) {
    final isSelected = context.locale.languageCode == locale.languageCode;

    return InkWell(
      onTap: () {
        context.setLocale(locale);
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? AppColor.blue : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 12),
            Text(
              language,
              style: TextStyle(
                fontSize: 16,
                fontWeight:
                    isSelected ? FontWeight.bold : FontWeight.normal,
                color: isDark ? AppColor.black : AppColor.clrWhite,
              ),
            ),
            const Spacer(),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppColor.blue,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
 void _showLanguageDialog(BuildContext context) {
    final isDark =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor:
              isDark ? AppColor.white : AppColor.clrBoxBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            AppText.selectLanguage,
            style: TextStyle(
              color: isDark ? AppColor.black : AppColor.clrWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLanguageOption(
                context,
                flag: '🇬🇧',
                language: AppText.english,
                locale: const Locale('en'),
                isDark: isDark,
              ),
              const SizedBox(height: 10),
              _buildLanguageOption(
                context,
                flag: '🇵🇰',
                language: AppText.urdu,
                locale: const Locale('ur'),
                isDark: isDark,
              ),
            ],
          ),
        );
      },
    );
  }