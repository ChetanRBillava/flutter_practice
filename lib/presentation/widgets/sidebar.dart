import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/core/themes/app_theme.dart';
import 'package:sizer/sizer.dart';

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

    return Drawer(
      backgroundColor: AppTheme.appbarBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: <Widget>[
                ///Home
                ListTile(
                  leading: Icon(Icons.home, color: AppTheme.textColor_2),
                  title:
                  AppTexts(
                    textString: 'Home',
                    textFontSize: 12.0.sp,
                    fontWeight: FontWeight.bold,
                    textColor: AppTheme.textColor_2,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed(AppRouter.home);
                  },
                ),
                ///Calculator
                ListTile(
                  leading: Icon(Icons.calculate, color: AppTheme.textColor_2),
                  title:
                  AppTexts(
                    textString: 'Calculator',
                    textFontSize: 12.0.sp,
                    fontWeight: FontWeight.bold,
                    textColor: AppTheme.textColor_2,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed(AppRouter.calc);
                  },
                ),
                ///Random Jokes
                ListTile(
                  leading: Icon(Icons.mood_sharp, color: AppTheme.textColor_2),
                  title:
                  AppTexts(
                    textString: 'Random Jokes',
                    textFontSize: 12.0.sp,
                    fontWeight: FontWeight.bold,
                    textColor: AppTheme.textColor_2,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed(AppRouter.randomJokes);
                  },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

}