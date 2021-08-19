import 'package:biys/screen/home/home_screen.dart';
import 'package:biys/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case "/home":
        return PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
          return HomeScreen();
        }, transitionsBuilder:
            (_, Animation<double> animation, __, Widget child) {
          return FadeTransition(opacity: animation, child: child);
        });

      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
