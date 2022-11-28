import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/core/themes/app_theme.dart';
import 'package:flutter_practice/presentation/utils/app_texts.dart';
import 'package:sizer/sizer.dart';

import '../../logic/cubit/home_screen_cubit.dart';
import '../utils/custom_print.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    customPrint.myCustomPrint(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBarWidget(title: 'Home', centerTitle: false, automaticallyImplyLeading:false),
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
                    const AppTexts(
                      textString: 'You have pushed the button this many times:',),
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
                  child: ButtonWidget(
                    //buttonTextColor: AppTheme.textColor_2,
                    hasIcon: true,
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
    );
  }
}