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
import '../utils/custom_print.dart';
class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> with SingleTickerProviderStateMixin, WidgetsBindingObserver{
  List sidebarOptions = [];
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  Tween<Offset> offset = Tween(begin: const Offset(-1,-1), end: const Offset(0,0));

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      List temp = [
        [Icons.home, Languages.of(context)?.home as String, AppRouter.home],
        [Icons.calculate, Languages.of(context)?.calculator as String, AppRouter.calc],
        [Icons.mood_sharp, Languages.of(context)?.jokes as String, AppRouter.randomJokes],
        [Icons.list_alt, Languages.of(context)?.myForm as String, AppRouter.myForm],
        [Icons.translate, Languages.of(context)?.language as String, AppRouter.lang],
        [Icons.dark_mode, Languages.of(context)?.theme as String, AppRouter.theme],
        [Icons.mic, Languages.of(context)?.va as String, AppRouter.va],
        [Icons.animation, Languages.of(context)?.anim as String, AppRouter.animations],
      ];
      Future future = Future(() {});
      for (var element in temp) {
        future = future.then((value) {
          return Future.delayed(const Duration(milliseconds: 100), (){
            customPrint.myCustomPrint(element);
            sidebarOptions.add(element);
            listKey.currentState?.insertItem(sidebarOptions.length-1);
          });
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return Drawer(
          backgroundColor: (appThemeState as AppThemeSet).themeClass.appbarBackgroundColor,
          child: AnimatedList(
              key: listKey,
              initialItemCount: sidebarOptions.length,
              itemBuilder: (context, index, animation){
                return SlideTransition(
                  position: animation.drive(offset),
                  child: ListTile(
                    leading: Icon(sidebarOptions[index][0], color: (appThemeState).themeClass.textColor_1),
                    title:
                    AppTexts(
                      textString: sidebarOptions[index][1],
                      textFontSize: 12.0.sp,
                      fontWeight: FontWeight.bold,
                      textColor: (appThemeState).themeClass.textColor_1,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed(sidebarOptions[index][2]);
                    },
                  ),
                );
              }
          )
        );
      },
    );
  }

}