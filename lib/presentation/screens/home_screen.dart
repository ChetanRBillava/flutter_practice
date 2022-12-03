import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/core/themes/app_theme.dart';
import 'package:flutter_practice/presentation/utils/app_texts.dart';
import 'package:flutter_practice/presentation/widgets/sidebar.dart';
import 'package:sizer/sizer.dart';

import '../../core/localisations/languages.dart';
import '../../logic/cubit/home_screen_cubit.dart';
import '../utils/custom_print.dart';
import '../widgets/app_bar_widget.dart';
import '../utils/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget willPopScope() {
    return WillPopScope(
        onWillPop: onWillPopS,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppTheme.backgroundColor,
            appBar: AppBarWidget(title: Languages.of(context)?.home as String, centerTitle: false, automaticallyImplyLeading:true),
            drawer: const SideDrawer(),
            body: SizedBox(
              width: 100.w,
              height: 100.h,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AppTexts(
                          textString: Languages.of(context)?.homeLabel as String,),
                        BlocBuilder<HomeScreenCubit, HomeScreenState>(
                          builder: (context, state) {
                            if(state is HomeScreenIncremented){
                              return AppTexts(
                                textString: state.value.toString(), textFontSize: 25.sp,
                              );
                            }
                            else{
                              return AppTexts(
                                textString: '0', textFontSize: 25.sp,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: CustomButton(
                        //buttonTextColor: AppTheme.textColor_2,
                        iconData: Icons.add,
                        iconColor: AppTheme.textColor_2,
                        buttonColor: AppTheme.buttonBackgroundColor,
                        buttonSize: 60.w,
                        borderRadius: 3.w,
                        fontWeight: FontWeight.bold,
                        onTapEvent: (){
                          BlocProvider.of<HomeScreenCubit>(context).incrementer();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }


  DateTime? currentBackPressTime;
  Future<bool> onWillPopS() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 2),
            content: Text('Press again to exit'),
          )
      );
      return Future.value(false);
    }
    else{
      SystemNavigator.pop();
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return willPopScope();
  }
}