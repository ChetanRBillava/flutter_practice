import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_practice/presentation/utils/custom_print.dart';

import '../../core/constants/enums.dart';
import '../../core/localisations/locale_constant.dart';
import '../../core/themes/app_theme.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(const AppThemeInitial(brightness: Brightness.light, themeSetting: 'Auto Switching activated'));

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

  void setLightTheme(String themeSetting){
    String temp = '';
    if(themeSetting == 'light'){
      temp = 'Light mode only activated';
    }
    else if(themeSetting == 'dark'){
      temp = 'Dark mode only activated';
    }
    else{
      temp = 'Auto Switching activated';
    }
    LightTheme lightTheme = LightTheme();
    customPrint.myCustomPrint(temp);
    customPrint.myCustomPrint('Light mode');

    emit(AppThemeSet(brightness: Brightness.light, themeClass: lightTheme, themeSetting: temp));
  }

  void setDarkTheme(String themeSetting){
    String temp = '';
    if(themeSetting == 'light'){
      temp = 'Light mode only activated';
    }
    else if(themeSetting == 'dark'){
      temp = 'Dark mode only activated';
    }
    else{
      temp = 'Auto Switching activated';
    }
    DarkTheme darkTheme = DarkTheme();
    customPrint.myCustomPrint(temp);
    customPrint.myCustomPrint('Dark mode');

    emit(AppThemeSet(brightness: Brightness.dark, themeClass: darkTheme,  themeSetting: temp));
  }
}
