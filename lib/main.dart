import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'pages/home.dart';
import 'pages/game.dart';
import 'pages/exit.dart';
import 'pages/htp.dart';
import 'pages/completed.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimatedSplashScreen(
      splash: Image.asset('assets/images/icon-512.png'),
      nextScreen: Home(),
      splashTransition: SplashTransition.scaleTransition,
      splashIconSize: 150,
      duration: 3000,
    ),
    routes: {
      //'/': (context) => Loading(),
      '/home': (context) => Home(),
      '/game': (context) => Game(),
      '/exit': (context) => Exit(),
      '/htp': (context) => Htp(),


    },
  ));
}


