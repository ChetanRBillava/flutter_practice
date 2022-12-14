import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_practice/presentation/utils/custom_print.dart';

import '../../core/constants/enums.dart';
import '../../core/localisations/locale_constant.dart';
import '../../core/themes/app_theme.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(const AppThemeInitial(
      brightness: Brightness.light, themeSetting: 'Auto Switching activated'));

  Future<Color> getColor(context, String color) async{
    if(color == 'text1'){
      return (state as AppThemeSet).themeClass.textColor_1;
    }
    else if(color == 'success'){
      return (state as AppThemeSet).themeClass.successColor;
    }
    else{
      return Colors.transparent;
    }
  }

  Future<String> getThemeType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeValue = prefs.getString('themeType') ?? 'auto';
    return themeValue;
  }

  Future<void> setThemeType(String themeValue) async {
    customPrint.myCustomPrint(themeValue);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeType', themeValue);
  }

  void setLightTheme(String themeSetting) {
    String temp = '';
    if (themeSetting == 'light') {
      temp = 'Light mode only activated';
    }
    else if (themeSetting == 'dark') {
      temp = 'Dark mode only activated';
    }
    else {
      temp = 'Auto Switching activated';
    }
    LightTheme lightTheme = LightTheme();
    customPrint.myCustomPrint(temp);
    customPrint.myCustomPrint('Light mode');

    emit(AppThemeSet(brightness: Brightness.light,
        themeClass: lightTheme,
        themeSetting: temp));
  }

  void setDarkTheme(String themeSetting) {
    String temp = '';
    if (themeSetting == 'light') {
      temp = 'Light mode only activated';
    }
    else if (themeSetting == 'dark') {
      temp = 'Dark mode only activated';
    }
    else {
      temp = 'Auto Switching activated';
    }
    DarkTheme darkTheme = DarkTheme();
    customPrint.myCustomPrint(temp);
    customPrint.myCustomPrint('Dark mode');

    emit(AppThemeSet(brightness: Brightness.dark,
        themeClass: darkTheme,
        themeSetting: temp));
  }

  Future<void> checkTheme() async {
    final Brightness currentBrightness = SchedulerBinding.instance.window
        .platformBrightness;
    String userTheme = await getThemeType();
    customPrint.myCustomPrint('User theme $userTheme');
    if (userTheme == 'light') {
      setLightTheme(userTheme);
    }
    else if (userTheme == 'dark') {
      setDarkTheme(userTheme);
    }
    else {
      customPrint.myCustomPrint('Initial brightness $currentBrightness');
      if (currentBrightness == Brightness.light) {
        setLightTheme(userTheme);
      }
      else {
        setDarkTheme(userTheme);
      }
    }
  }
}
