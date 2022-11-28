import 'package:flutter/material.dart';
import 'package:flutter_practice/presentation/screens/home_screen.dart';
import 'package:flutter_practice/presentation/screens/splash_screen.dart';

import '../../core/exceptions/route_exception.dart';

class AppRouter {
  static const String splash = '/', home = 'home';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(title: 'Flutter Demo Home Page'),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}