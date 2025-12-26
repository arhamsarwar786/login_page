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
  bool _isChanging = false;

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
                color: AppColor.pink.withOpacity(0.4),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(
            Icons.language,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    StateSetter setDialogState, {
    required String flag,
    required String language,
    required Locale locale,
    required bool isDark,
  }) {
    final isSelected = context.locale.languageCode == locale.languageCode;

    return InkWell(
      onTap: _isChanging
          ? null
          : () async {
              setDialogState(() {
                _isChanging = true;
              });

              // Language change karein
              await context.setLocale(locale);
              
              // Small delay for smooth transition
              await Future.delayed(const Duration(milliseconds: 150));

              // Dialog close karein
              if (context.mounted) {
                Navigator.pop(context);
              }

              // Provider ke through notify karein
              if (context.mounted) {
                context.read<ThemeProvider>().notifyLanguageChange();
              }

              // Reset changing state
              if (mounted) {
                setState(() {
                  _isChanging = false;
                });
              }
            },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected 
              ? AppColor.blue.withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? AppColor.blue : Colors.grey.withOpacity(0.3),
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
                      ? AppColor.blue
                      : (isDark ? AppColor.black : AppColor.clrWhite),
                ),
              ),
            ),
            if (_isChanging && !isSelected)
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              )
            else if (isSelected)
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
      barrierDismissible: !_isChanging,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
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
                  fontSize: 20,
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // English
                    _buildLanguageOption(
                      context,
                      setDialogState,
                      flag: '🇬🇧',
                      language: AppText.english.tr(),
                      locale: const Locale('en'),
                      isDark: isDark,
                    ),
                    const SizedBox(height: 10),
                    
                    // Urdu
                    _buildLanguageOption(
                      context,
                      setDialogState,
                      flag: '🇵🇰',
                      language: AppText.urdu.tr(),
                      locale: const Locale('ur'),
                      isDark: isDark,
                    ),
                    const SizedBox(height: 10),
                    
                    // Arabic
                    _buildLanguageOption(
                      context,
                      setDialogState,
                      flag: '🇸🇦',
                      language: AppText.arabic.tr(),
                      locale: const Locale('ar'),
                      isDark: isDark,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}