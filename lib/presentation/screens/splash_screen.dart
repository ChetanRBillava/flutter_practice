import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/core/constants/strings.dart';
import 'package:flutter_practice/logic/bloc/voice_assistant_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/images.dart';
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

  @override
  void initState(){
    customPrint.myCustomPrint('Started');
    // TODO: implement initState
    Timer(const Duration(seconds: 1), () {
      BlocProvider.of<AppThemeCubit>(context).checkTheme();
      BlocProvider.of<VoiceAssistantBloc>(context).add(SpeechInitialise());
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushNamed(AppRouter.home);
      });
    });
    WidgetsBinding.instance.addObserver(this);
    super.initState();
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

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
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
                Image.asset(appThemeState.brightness==Brightness.light?AppImages.logo:AppImages.logoDark),
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
