import 'package:flutter/material.dart';
import 'package:galaxy_planets_app/screens/bounce_page.dart';
import 'package:galaxy_planets_app/screens/details_page.dart';
import 'package:galaxy_planets_app/screens/home_page.dart';
import 'package:galaxy_planets_app/screens/splash_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        'HomePage': (context) => const HomePage(),
        'DetailsPage': (context) => const DetailsPage(),
        'GalaxyBounce': (context) => const GalaxyBounce(),
      },
    ),
  );
}
