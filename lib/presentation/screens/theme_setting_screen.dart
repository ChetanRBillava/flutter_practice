import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/localisations/languages.dart';
import '../../logic/cubit/app_theme_cubit.dart';
import '../utils/app_texts.dart';
import '../utils/custom_print.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/sidebar.dart';

class ThemeSettingScreen extends StatefulWidget {
  const ThemeSettingScreen({Key? key}) : super(key: key);

  @override
  State<ThemeSettingScreen> createState() => _ThemeSettingScreenState();
}

class _ThemeSettingScreenState extends State<ThemeSettingScreen> {

  void _showPicker(context) {
    //debugPrint("clicking..............");
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return BlocBuilder<AppThemeCubit, AppThemeState>(
            builder: (context, appThemeState) {
              return SafeArea(
                child: Container(
                  child: Wrap(
                    children: <Widget>[
                      ///Dark
                      ListTile(
                        tileColor: (appThemeState as AppThemeSet).themeClass.buttonBackgroundColor,
                        title: Row(
                          children: [
                            AppTexts(
                              textString: 'Dark mode only',
                              textFontSize: 14.sp,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        onTap: (){
                          BlocProvider.of<AppThemeCubit>(context).setThemeType('dark');
                          BlocProvider.of<AppThemeCubit>(context).setDarkTheme('dark');
                          Navigator.pop(context);
                        },
                      ),
                      ///Light
                      ListTile(
                        tileColor: (appThemeState).themeClass.buttonBackgroundColor,
                        title: Row(
                          children: [
                            AppTexts(
                              textString: 'Light mode only',
                              textFontSize: 14.sp,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        onTap: (){
                          BlocProvider.of<AppThemeCubit>(context).setThemeType('light');
                          BlocProvider.of<AppThemeCubit>(context).setLightTheme('light');
                          Navigator.pop(context);
                        },
                      ),
                      ///Auto
                      ListTile(
                        tileColor: (appThemeState).themeClass.buttonBackgroundColor,
                        title: Row(
                          children: [
                            AppTexts(
                              textString: 'Auto switching',
                              textFontSize: 14.sp,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        onTap: (){
                          final Brightness currentBrightness = SchedulerBinding.instance.window.platformBrightness;
                          customPrint.myCustomPrint('Current brightness $currentBrightness');
                          if (currentBrightness == Brightness.light) {
                            BlocProvider.of<AppThemeCubit>(context).setLightTheme('auto');
                          }
                          else {
                            BlocProvider.of<AppThemeCubit>(context).setDarkTheme('auto');
                          }
                          BlocProvider.of<AppThemeCubit>(context).setThemeType('auto');
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: (appThemeState as AppThemeSet).themeClass.backgroundColor,
            appBar: AppBarWidget(title: Languages.of(context)?.theme as String, centerTitle: false, automaticallyImplyLeading:true,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 2.w),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                          Icons.arrow_back
                      ),
                    ),
                  )
                ]),
            drawer: const SideDrawer(),
            floatingActionButton: FloatingActionButton(
                backgroundColor: (appThemeState).themeClass.primaryColor,
                child: Icon(Icons.dark_mode, color:(appThemeState).themeClass.textColor_1,),
                onPressed: (){
                  _showPicker(context);
                }
            ),
            body: Center(
              child: Padding(
                padding: EdgeInsets.all(1.h),
                child: AppTexts(
                  textString: appThemeState.themeSetting,
                  textFontSize: 36.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
