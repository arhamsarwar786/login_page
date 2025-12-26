import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:provider/provider.dart';

class LanguageIcon extends StatefulWidget {
  const LanguageIcon({super.key});

  @override
  State<LanguageIcon> createState() => _LanguageIconState();
}

class _LanguageIconState extends State<LanguageIcon> {
  @override
  Widget build(BuildContext context) {
    return 
                  Positioned(
                    top: 20,
                    right: 20,
                    child: InkWell(
                      onTap: () {
                        _showLanguageDialog(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppColor.pink, AppColor.blue],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.pink.withOpacity(0.4),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.language,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
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
            AppText.selectLanguage.tr(),
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
                language: AppText.english.tr(),
                locale: const Locale('en'),
                isDark: isDark,
              ),
              const SizedBox(height: 10),
              _buildLanguageOption(
                context,
                flag: '🇵🇰',
                language: AppText.urdu.tr(),
                locale: const Locale('ur'),
                isDark: isDark,
              ),
            ],
          ),
        );
      },
    );
  }