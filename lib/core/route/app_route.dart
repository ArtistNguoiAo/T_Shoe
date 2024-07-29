import 'package:e_medicine/presentation/screen/home_screen/view/home_screen.dart';
import 'package:e_medicine/presentation/screen/login_screen/view/login_screen.dart';
import 'package:e_medicine/presentation/screen/shoe_create_screen/view/shoe_create_screen.dart';
import 'package:e_medicine/presentation/screen/shoe_detail_screen/view/shoe_detail_screen.dart';
import 'package:e_medicine/presentation/screen/splash_screen/view/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String shoeDetail = '/shoe-detail';
  static const String shoeCreate = '/shoe-create';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case shoeDetail:
        return MaterialPageRoute(builder: (_) => ShoeDetailScreen(id: settings.arguments as String));
      case shoeCreate:
        return MaterialPageRoute(builder: (_) => ShoeCreateScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Error!'))));
    }
  }
}