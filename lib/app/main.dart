import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:time_tracking_app/app/theme/app_theme.dart';
import 'package:time_tracking_app/app/theme/app_theme_provider.dart';
import 'package:time_tracking_app/presentation/dashboard_screen/view_model/DashBaordViewModel.dart';

import '../common/Routes.dart';
import '../common/constants.dart';
import '../presentation/dashboard_screen/view/screen/DashBoardScreen.dart';
import 'di/injector.dart';
import 'language/language_manager.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  FlutterNativeSplash.remove();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      EasyLocalization(
          supportedLocales: LanguageManager.instance!.supportedLocales,
          path: LANGUAGE_ASSETS_PATH,
          startLocale: LanguageManager.instance!.enLocale,
          child: RootApp()),
    );
  });
}

class RootApp extends StatefulWidget {
  RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  static final _router = GoRouter(
    initialLocation: DashBoardScreen.route,
    routes: routes,
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppThemeViewModel()),
          ChangeNotifierProvider(create: (_) => DashBoardViewModel()),
        ],
        child: Consumer<AppThemeViewModel>(
            builder: (context, AppThemeViewModel themeNotifier, child) {
          return MaterialApp.router(
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
            title: "Time Tracking App",
            debugShowCheckedModeBanner: false,
            theme:
                themeNotifier.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
          );
        }));
  }

  Future initialization(BuildContext? context) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}