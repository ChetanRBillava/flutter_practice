import 'package:flutter/material.dart';
import 'package:flutter_practice/presentation/screens/my_form_screen.dart';
import 'package:flutter_practice/presentation/screens/random_jokes_screen.dart';
import 'package:flutter_practice/presentation/screens/calculator_screen.dart';
import 'package:flutter_practice/presentation/screens/home_screen.dart';
import 'package:flutter_practice/presentation/screens/splash_screen.dart';

import '../../core/exceptions/route_exception.dart';

class AppRouter {
  static const String splash = '/',
      home = 'home', calc = 'calc', randomJokes = 'randomJokes', myForm = 'myForm';

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
      case calc:
        return MaterialPageRoute(
          builder: (_) => const CalculatorScreen(),
        );
      case randomJokes:
        return MaterialPageRoute(
          builder: (_) => const RandomJokesScreen(),
        );
      case myForm:
        return MaterialPageRoute(
          builder: (_) => const MyFormScreen(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}