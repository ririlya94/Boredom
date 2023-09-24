import 'package:boredom/ui/screen/history/history.view.dart';
import 'package:boredom/ui/screen/home/home.view.dart';
import 'package:boredom/ui/screen/splash/splash.view.dart';
import 'package:flutter/material.dart';

class ConstantNav {
  ConstantNav();

  static const String homeRoute = '/home';
  static const String historyRoute = '/history';
  static const String splashRoute = '/splash';

  static MaterialPageRoute _pageRoute(Widget page, {bool isFullscreenDialog = false}) {
    return MaterialPageRoute(builder: (_) => page, fullscreenDialog: isFullscreenDialog);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return _pageRoute(const SplashView());
      case homeRoute:
        return _pageRoute(const HomeView());
      case historyRoute:
        return _pageRoute(const HistoryView());
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }


}