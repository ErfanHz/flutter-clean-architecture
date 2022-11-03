import 'package:clean_base/src/presentation/common/pages/introducing/intro_screen.dart';
import 'package:clean_base/src/presentation/common/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.route:
        return _generateRoute(settings, const SplashScreen());

      case IntroducingScreen.route:
        return _generateRoute(settings, const IntroducingScreen());

      default:
        return _generateRoute(settings, const SizedBox());
    }
  }

  static Route<dynamic> _generateRoute(RouteSettings settings, Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
