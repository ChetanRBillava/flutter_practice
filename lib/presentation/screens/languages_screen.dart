import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/localisations/languages.dart';
import '../../core/localisations/locale_constant.dart';
import '../../core/themes/app_theme.dart';
import '../../logic/cubit/app_theme_cubit.dart';
import '../utils/app_texts.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/sidebar.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {

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
                      ///En
                      ListTile(
                        tileColor: (appThemeState as AppThemeSet).themeClass.buttonBackgroundColor,
                        title: Row(
                          children: [
                            AppTexts(
                              textString: 'English',
                              textFontSize: 18.sp,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        onTap: (){
                          changeLanguage(context, 'en');
                          Navigator.pop(context);
                        },
                      ),
                      ///Hi
                      ListTile(
                        tileColor: (appThemeState).themeClass.buttonBackgroundColor,
                        title: Row(
                          children: [
                            AppTexts(
                              textString: 'हिंदी',
                              textFontSize: 18.sp,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        onTap: (){
                          changeLanguage(context, 'hi');
                          Navigator.pop(context);
                        },
                      ),
                      ///Kan
                      ListTile(
                        tileColor: (appThemeState).themeClass.buttonBackgroundColor,
                        title: Row(
                          children: [
                            AppTexts(
                              textString: 'ಕನ್ನಡ',
                              textFontSize: 18.sp,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        onTap: (){
                          changeLanguage(context, 'kn');
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
            appBar: AppBarWidget(title: Languages.of(context)?.language as String, centerTitle: false, automaticallyImplyLeading:true,
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
                child: Icon(Icons.translate, color:(appThemeState).themeClass.textColor_1,),
                onPressed: (){
                  _showPicker(context);
                }
            ),
            body: Center(
              child: Padding(
                padding: EdgeInsets.all(1.h),
                child: AppTexts(
                  textString: Languages.of(context)?.welcomeText as String,
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
