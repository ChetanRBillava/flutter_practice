import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/core/themes/app_theme.dart';
import 'package:sizer/sizer.dart';

import '../../core/localisations/languages.dart';
import '../../logic/cubit/app_theme_cubit.dart';
import '../router/app_router.dart';
import '../utils/app_texts.dart';
class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return Drawer(
          backgroundColor: (appThemeState as AppThemeSet).themeClass.appbarBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: <Widget>[
                    ///Home
                    ListTile(
                      leading: Icon(Icons.home, color: (appThemeState).themeClass.textColor_1),
                      title:
                      AppTexts(
                        textString: Languages.of(context)?.home as String,
                        textFontSize: 12.0.sp,
                        fontWeight: FontWeight.bold,
                        textColor: (appThemeState).themeClass.textColor_1,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed(AppRouter.home);
                      },
                    ),
                    ///Calculator
                    ListTile(
                      leading: Icon(Icons.calculate, color: (appThemeState).themeClass.textColor_1),
                      title:
                      AppTexts(
                        textString: Languages.of(context)?.calculator as String,
                        textFontSize: 12.0.sp,
                        fontWeight: FontWeight.bold,
                        textColor: (appThemeState).themeClass.textColor_1,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed(AppRouter.calc);
                      },
                    ),
                    ///Random Jokes
                    ListTile(
                      leading: Icon(Icons.mood_sharp, color: (appThemeState).themeClass.textColor_1),
                      title:
                      AppTexts(
                        textString: Languages.of(context)?.jokes as String,
                        textFontSize: 12.0.sp,
                        fontWeight: FontWeight.bold,
                        textColor: (appThemeState).themeClass.textColor_1,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed(AppRouter.randomJokes);
                      },
                    ),
                    ///My form
                    ListTile(
                      leading: Icon(Icons.list_alt, color: (appThemeState).themeClass.textColor_1),
                      title:
                      AppTexts(
                        textString: Languages.of(context)?.myForm as String,
                        textFontSize: 12.0.sp,
                        fontWeight: FontWeight.bold,
                        textColor: (appThemeState).themeClass.textColor_1,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed(AppRouter.myForm);
                      },
                    ),
                    ///Languages
                    ListTile(
                      leading: Icon(Icons.translate, color: (appThemeState).themeClass.textColor_1),
                      title:
                      AppTexts(
                        textString: Languages.of(context)?.language as String,
                        textFontSize: 12.0.sp,
                        fontWeight: FontWeight.bold,
                        //textColor: (appThemeState).themeClass.textColor_1,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed(AppRouter.lang);
                      },
                    ),
                    ///Theme
                    ListTile(
                      leading: Icon(Icons.dark_mode, color: (appThemeState).themeClass.textColor_1),
                      title:
                      AppTexts(
                        textString: Languages.of(context)?.theme as String,
                        textFontSize: 12.0.sp,
                        fontWeight: FontWeight.bold,
                        //textColor: (appThemeState).themeClass.textColor_1,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed(AppRouter.theme);
                      },
                    ),
                    ///Voice assistant
                    ListTile(
                      leading: Icon(Icons.mic, color: (appThemeState).themeClass.textColor_1),
                      title:
                      AppTexts(
                        textString: Languages.of(context)?.va as String,
                        textFontSize: 12.0.sp,
                        fontWeight: FontWeight.bold,
                        //textColor: (appThemeState).themeClass.textColor_1,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed(AppRouter.va);
                      },
                    ),
                    ///Animations
                    ListTile(
                      leading: Icon(Icons.animation, color: (appThemeState).themeClass.textColor_1),
                      title:
                      AppTexts(
                        textString: Languages.of(context)?.anim as String,
                        textFontSize: 12.0.sp,
                        fontWeight: FontWeight.bold,
                        //textColor: (appThemeState).themeClass.textColor_1,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed(AppRouter.animations);
                      },
                    ),

                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}