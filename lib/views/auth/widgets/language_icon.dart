import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:provider/provider.dart';

class LanguageIcon extends StatelessWidget {
  const LanguageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 20,
      child: InkWell(
        onTap: () {
          _showLanguageDialog(context);
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColor.pink, AppColor.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColor.pink,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(Icons.language, color: AppColor.white, size: 24),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context, {
    required String flag,
    required String language,
    required Locale locale,
    required bool isDark,
  }) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final isSelected = context.locale.languageCode == locale.languageCode;
        final isChanging = themeProvider.isLanguageChanging;

        return InkWell(
          onTap: isChanging
              ? null
              : () async {
                  themeProvider.setLanguageChanging(true);

                  await context.setLocale(locale);
                  await Future.delayed(const Duration(milliseconds: 150));
                  
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                  if (context.mounted) {
                    themeProvider.notifyLanguageChange();
                  }
                  
                  themeProvider.setLanguageChanging(false);
                },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColor.blue
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected ? AppColor.blue : AppColor.grey,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                Text(flag, style: const TextStyle(fontSize: 28)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    language,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected
                          ? AppColor.white
                          : (isDark ? AppColor.black : AppColor.clrWhite),
                          fontFamily: "hel"
                    ),
                  ),
                ),
                if (isChanging && isSelected)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(AppColor.blue),
                    ),
                  )
                else if (isSelected)
                  Icon(Icons.check_circle, color: AppColor.blue, size: 24),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLanguageDialog(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(
      context,
      listen: false,
    ).isDarkMode;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            // ignore: deprecated_member_use
            return WillPopScope(
              onWillPop: () async => !themeProvider.isLanguageChanging,
              child: AlertDialog(
                backgroundColor: isDark
                    ? AppColor.white
                    : AppColor.clrBoxBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppText.selectLanguage.tr(),
                      style: TextStyle(fontFamily: "hel",
                        color: isDark ? AppColor.black : AppColor.clrWhite,
                        fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,
                        fontSize: 20,
                      ),
                    ),
                    InkWell(
                      onTap: themeProvider.isLanguageChanging
                          ? null
                          : () {
                              Navigator.pop(context);
                            },
                      child: Icon(
                        Icons.close,
                        color: isDark ? AppColor.black : AppColor.clrWhite,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              
                content: SizedBox(
                  width: MediaQuery.of(context).size.width*0.2,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      // English
                      _buildLanguageOption(
                        context,
                        flag: '🇬🇧',
                        language: AppText.english.tr(),
                        locale: const Locale('en'),
                        isDark: isDark,
                      ),
                      const SizedBox(height: 10),

                      // Urdu
                      _buildLanguageOption(
                        context,
                        flag: '🇵🇰',
                        language: AppText.urdu.tr(),
                        locale: const Locale('ur'),
                        isDark: isDark,
                      ),
                      const SizedBox(height: 10),

                      // Arabic
                      _buildLanguageOption(
                        context,
                        flag: '🇸🇦',
                        language: AppText.arabic.tr(),
                        locale: const Locale('ar'),
                        isDark: isDark,
                      ),
                      const SizedBox(height: 10),

                      // French
                      _buildLanguageOption(
                        context,
                        flag: '🇫🇷',
                        language: AppText.french.tr(),
                        locale: const Locale("fr"),
                        isDark: isDark,
                      ),
                      const SizedBox(height: 10),

                      // Chinese
                      _buildLanguageOption(
                        context,
                        flag: '🇨🇳',
                        language: AppText.chinese.tr(),
                        locale: const Locale('zh'),
                        isDark: isDark,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}