import 'package:biys/data/model/restaurant.dart';
import 'package:biys/data/source/api/rest_client.dart';
import 'package:biys/screen/detail/detail_screen.dart';
import 'package:biys/screen/home/home_screen.dart';
import 'package:biys/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic>? arguments =
        settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case "/home":
        return PageTransition(
          type: PageTransitionType.fade,
          duration: Duration(
            milliseconds: 600,
          ),
          child: HomeScreen(
            client: arguments!["rest"] as RestClient,
          ),
        );
      case "/detail":
        return MaterialPageRoute(
          builder: (_) => DetailScreen(
            restaurant: settings.arguments as Restaurant,
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
