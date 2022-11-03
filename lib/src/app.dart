import 'package:clean_base/main.dart';
import 'package:clean_base/src/config/routes/app_routes.dart';
import 'package:clean_base/src/config/themes/app_themes.dart';
import 'package:clean_base/src/core/constants/messages.dart';
import 'package:clean_base/src/presentation/common/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ApplicationMessages.applicationTitle,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      initialRoute: SplashScreen.route,
      theme: AppTheme().lightTheme,
      locale: const Locale.fromSubtags(languageCode: 'fa'),
    );
  }
}
