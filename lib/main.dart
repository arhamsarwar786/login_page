import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/app_route_confrication.dart';
import 'package:login_page/viewmodel/login_view_model.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ur'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      saveLocale: true,
      useOnlyLangCode: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Builder(
        // 🔥 THIS IS THE KEY FIX
        builder: (context) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,

            // ✅ EasyLocalization bindings
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,

            // Router
            routeInformationProvider:
                MyAppRouter.router.routeInformationProvider,
            routeInformationParser:
                MyAppRouter.router.routeInformationParser,
            routerDelegate:
                MyAppRouter.router.routerDelegate,
          );
        },
      ),
    );
  }
}
