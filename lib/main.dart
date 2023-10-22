import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/pages/homepage.dart';

void main () {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp ({super.key});

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      color: Colors.blueGrey.shade100,
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        backgroundColor: Colors.blueGrey.shade100,
        splash: Lottie.asset(
          'assets/thunderstrome.json',
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width * 0.50
        ),
        nextScreen: const HomePage(),
        splashIconSize: 150,
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}