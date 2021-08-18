import 'package:biys/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());

      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
