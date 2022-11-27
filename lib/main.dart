import 'package:flutter/material.dart';
import 'package:flutter_practice/presentation/router/app_router.dart';
import 'package:flutter_practice/presentation/screens/home_screen.dart';
import 'package:sizer/sizer.dart';

import 'core/constants/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, constraints, orientation) {
      return const MaterialApp(
        title: Strings.appTitle,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.home,
        onGenerateRoute: AppRouter.onGenerateRoute,
      );
    });
  }
}

