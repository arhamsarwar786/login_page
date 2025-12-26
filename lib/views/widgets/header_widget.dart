import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/responsive.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:login_page/views/widgets/circular_icon.dart';
import 'package:provider/provider.dart';

class HeaderWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HeaderWidget({super.key, required this.scaffoldKey});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  bool _isChanging = false;

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
              onTap: () => widget.scaffoldKey.currentState!.openDrawer(),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Icon(
                  Icons.menu,
                  color: isDark ? AppColor.black : AppColor.clrSmallText,
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
                          hintText: AppText.searchanything.tr(),
                          prefixIcon: Icon(
                            Icons.search,
                            color: isDark ? AppColor.black : AppColor.clrWhite,
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
                            iconData: Icons.notifications_active_sharp),
                        const SizedBox(width: 10),
                        CircularIcon(iconData: Icons.message),
                        const SizedBox(width: 10),
                        CircularIcon(
                          iconData:
                              isDark ? Icons.light_mode : Icons.dark_mode,
                          onTap: themeProvider.switchTheme,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppText.faizan.tr(),
                              style: TextStyle(fontSize: 16,
                          color:     isDark? AppColor.white: AppColor.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              AppText.flutterDeveloper.tr(),
                              style: TextStyle(fontSize: 14,
                          color:     isDark? AppColor.white: AppColor.white,),
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
                CircularIcon(iconData: Icons.notifications_active_sharp),
                const SizedBox(width: 10),
                CircularIcon(iconData: Icons.message),
                const SizedBox(width: 10),
                CircularIcon(
                  iconData: isDark ? Icons.light_mode : Icons.dark_mode,
                  onTap: themeProvider.switchTheme,
                ),
              ],
            ),
        ],
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