import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/localisations/languages.dart';
import '../../core/localisations/locale_constant.dart';
import '../../core/themes/app_theme.dart';
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
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ///En
                  ListTile(
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
                      changeLanguage(context, 'ka');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
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
            child: const Icon(Icons.translate),
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
  }
}
