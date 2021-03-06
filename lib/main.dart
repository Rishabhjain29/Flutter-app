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
      splash: Container(
        width: 185,
        height: 225,
          child: Image.asset('assets/images/icon-512.png'),
      decoration: new BoxDecoration(
        boxShadow: [new BoxShadow(color: Colors.black, blurRadius: 20)],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),),
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


