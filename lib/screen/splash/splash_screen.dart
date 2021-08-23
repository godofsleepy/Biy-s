import 'dart:async';

import 'package:biys/data/source/api/rest_client.dart';
import 'package:biys/utils/resource/rescolor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController imageAnimationController;
  late Animation<double> imageAnimation;

  @override
  void initState() {
    super.initState();
    setUpAnimation();

    Timer(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context, "/home",
          arguments: {"rest": RestClient(Dio())});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ResColor.green,
      body: Center(
        child: ScaleTransition(
          scale: imageAnimation,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              "assets/splash.gif",
              width: 200,
            ),
          ),
        ),
      ),
    );
  }

  void setUpAnimation() {
    imageAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      value: 0.1,
    );

    imageAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: imageAnimationController,
    );

    imageAnimationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    imageAnimationController.dispose();
  }
}
