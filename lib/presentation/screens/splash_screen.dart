import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/core/constants/strings.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:sizer/sizer.dart';

import '../../logic/cubit/app_theme_cubit.dart';
import '../router/app_router.dart';
import '../utils/app_texts.dart';
import '../utils/custom_print.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with WidgetsBindingObserver {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;

  @override
  void initState(){
    // TODO: implement initState
    initSpeech();
    Timer(const Duration(seconds: 1), () {
      checkTheme();
    });
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  void initSpeech() async {
    customPrint.myCustomPrint('Initialising speech');
    _speechEnabled = await _speechToText.initialize();
    customPrint.myCustomPrint('Speech enabled $_speechEnabled');
  }

  @override
  Future<void> didChangePlatformBrightness() async {
    // TODO: implement didChangePlatformBrightness
    customPrint.myCustomPrint('Updating brightness');
    final Brightness currentBrightness = SchedulerBinding.instance.window.platformBrightness;

    String userTheme = await BlocProvider.of<AppThemeCubit>(context).getThemeType();
    customPrint.myCustomPrint('User theme $userTheme');
    if(userTheme=='auto'){
      customPrint.myCustomPrint('Brightness changed $currentBrightness');
      if (currentBrightness == Brightness.light) {
        BlocProvider.of<AppThemeCubit>(context).setLightTheme(userTheme);
      }
      else {
        BlocProvider.of<AppThemeCubit>(context).setDarkTheme(userTheme);
      }
    }
    super.didChangePlatformBrightness();
  }

  Future<void> checkTheme() async {

    final Brightness currentBrightness = SchedulerBinding.instance.window.platformBrightness;
    String userTheme = await BlocProvider.of<AppThemeCubit>(context).getThemeType();
    customPrint.myCustomPrint('User theme $userTheme');
    if(userTheme == 'light'){
      BlocProvider.of<AppThemeCubit>(context).setLightTheme(userTheme);
    }
    else if(userTheme == 'dark'){
      BlocProvider.of<AppThemeCubit>(context).setDarkTheme(userTheme);
    }
    else{
      customPrint.myCustomPrint('Initial brightness $currentBrightness');
      if (currentBrightness == Brightness.light) {
        BlocProvider.of<AppThemeCubit>(context).setLightTheme(userTheme);
      }
      else {
        BlocProvider.of<AppThemeCubit>(context).setDarkTheme(userTheme);
      }
    }

    Timer(const Duration(seconds: 3), () {
      customPrint.myCustomPrint('Started');
      Navigator.of(context).pushNamed(AppRouter.home);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    _speechToText.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: (appThemeState as AppThemeSet).themeClass.backgroundColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(appThemeState.brightness==Brightness.light?'assets/images/logo.png':'assets/images/logo2.png'),
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
      },
    );
  }
}
