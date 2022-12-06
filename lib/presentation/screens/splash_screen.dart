import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice/core/constants/strings.dart';
import 'package:flutter_practice/core/themes/app_theme.dart';
import 'package:sizer/sizer.dart';

import '../router/app_router.dart';
import '../utils/app_texts.dart';
import '../utils/custom_print.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3),(){
      customPrint.myCustomPrint('Started');
      Navigator.of(context).pushNamed(AppRouter.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            AppTexts(
              textString: Strings.appVersion,
              textFontSize: 10.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
