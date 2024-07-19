import 'package:e_medicine/presentation/screen/home_screen/view/home_screen.dart';
import 'package:e_medicine/presentation/screen/login_screen/view/login_screen.dart';
import 'package:e_medicine/presentation/screen/splash_screen/view/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';

  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      splash: (context) => const SplashScreen(),
      login: (context) => const LoginScreen(),
      home: (context) => const HomeScreen(),
    };
  }
}