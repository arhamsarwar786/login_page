import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/responsive.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:login_page/views/notification.dart';
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
                            iconData: Icons.notifications_active_sharp,
                            onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsScreen()));
                            
                            },
                            ),
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
                          children: [
                            Text(
                              AppText.faizan.tr(),
                              style: TextStyle(
                                fontSize:MediaQuery.of(context).size.width >1000?15:16,
                                color: isDark ? AppColor.white : AppColor.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              AppText.flutterDeveloper.tr(),
                              style: TextStyle(
                                fontSize:MediaQuery.of(context).size.width >1000?12:14,
                                color: isDark ? AppColor.white : AppColor.white,
                              ),
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
                CircularIcon(iconData: Icons.notifications_active_sharp,onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsScreen()));
                },),
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
                color: isSelected ? AppColor.blue : Colors.grey,
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
                      fontFamily: "hel",
                      fontSize: 16,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected
                          ? AppColor.white
                          : (isDark ? AppColor.black : AppColor.clrWhite),
                    ),
                  ),
                ),
                if (isChanging && isSelected)
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
                      style: TextStyle(
                        fontFamily: "hel",
                        color: isDark ? AppColor.black : AppColor.clrWhite,
                        fontWeight: FontWeight.bold,
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
                content: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.5,
                    maxHeight: MediaQuery.of(context).size.height * 0.6,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
              ),
            );
          },
        );
      },
    );
  }
}