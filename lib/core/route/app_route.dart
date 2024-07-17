import 'package:e_medicine/presentation/screen/home_screen/view/home_screen.dart';
import 'package:e_medicine/presentation/screen/login_screen/view/login_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';

  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      login: (context) => const LoginScreen(),
      home: (context) => const HomeScreen(),
    };
  }
}