import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/core/themes/app_theme.dart';
import 'package:flutter_practice/logic/bloc/calculator_bloc.dart';
import 'package:flutter_practice/presentation/utils/app_texts.dart';
import 'package:flutter_practice/presentation/widgets/button_widget.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:sizer/sizer.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/sidebar.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBarWidget(title: 'Calculator', centerTitle: false, automaticallyImplyLeading:true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back
                  ),
                ),
              )
            ]
        ),
        drawer: const SideDrawer(),
        body: Container(
          width: 100.w,
          height: 100.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Container(
                  height: 40.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                      color: AppTheme.successColor,
                      border: Border.all(color: AppTheme.focusedFormFieldBorderColor),
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.w)
                      )
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.w),
                    child: BlocBuilder<CalculatorBloc, CalculatorState>(
                      builder: (context, state) {
                        if(state is CalculatorTyping){
                          return AppTexts(
                            textString: state.valueString,
                            textFontSize: 20.sp,
                            textColor: AppTheme.textColor_2,
                            textAlign: TextAlign.end,
                          );
                        }
                        else{
                          return AppTexts(
                            textString: state.value,
                            textFontSize: 20.sp,
                            textColor: AppTheme.textColor_2,
                            textAlign: TextAlign.end,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///clear
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.dangerColor,
                          buttonText: 'C',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(ClearScreenEvent());
                          },
                        ),
                      ),
                      ///percentage
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.warningColor,
                          buttonText: '%',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(AppendNumberEvent(value: '%'));
                          },
                        ),
                      ),
                      ///backspace
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.warningColor,
                          hasIcon: true,
                          iconData: Icons.backspace,
                          iconSize: 25.sp,
                          iconColor: AppTheme.textColor_2,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(BackspaceEvent());
                          },
                        ),
                      ),
                      ///divide
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.warningColor,
                          buttonText: '/',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(AppendNumberEvent(value: '/'));
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///7
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.infoColor,
                          buttonText: '7',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(AppendNumberEvent(value: '7'));
                          },
                        ),
                      ),
                      ///8
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.infoColor,
                          buttonText: '8',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(AppendNumberEvent(value: '8'));
                          },
                        ),
                      ),
                      ///9
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.infoColor,
                          buttonText: '9',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(AppendNumberEvent(value: '9'));
                          },
                        ),
                      ),
                      ///multiply
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.warningColor,
                          buttonText: 'X',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(AppendNumberEvent(value: '*'));
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///4
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.infoColor,
                          buttonText: '4',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(AppendNumberEvent(value: '4'));
                          },
                        ),
                      ),
                      ///5
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.infoColor,
                          buttonText: '5',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(AppendNumberEvent(value: '5'));
                          },
                        ),
                      ),
                      ///6
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.infoColor,
                          buttonText: '6',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(AppendNumberEvent(value: '6'));
                          },
                        ),
                      ),
                      ///subtract
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.warningColor,
                          buttonText: '-',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(AppendNumberEvent(value: '-'));
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///1
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.infoColor,
                          buttonText: '1',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(AppendNumberEvent(value: '1'));
                          },
                        ),
                      ),
                      ///2
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.infoColor,
                          buttonText: '2',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(AppendNumberEvent(value: '2'));
                          },
                        ),
                      ),
                      ///3
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.infoColor,
                          buttonText: '3',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(AppendNumberEvent(value: '3'));
                          },
                        ),
                      ),
                      ///add
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.warningColor,
                          buttonText: '+',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(AppendNumberEvent(value: '+'));
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///00
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.infoColor,
                          buttonText: '00',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(AppendNumberEvent(value: '00'));
                          },
                        ),
                      ),
                      ///0
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.infoColor,
                          buttonText: '0',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(AppendNumberEvent(value: '0'));
                          },
                        ),
                      ),
                      ///decimal
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.infoColor,
                          buttonText: '.',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(AppendNumberEvent(value: '.'));
                          },
                        ),
                      ),
                      ///equals
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: ButtonWidget(
                          buttonColor: AppTheme.warningColor,
                          buttonText: '=',
                          buttonTextSize: 20.sp,
                          buttonTextColor: AppTheme.textColor_2,
                          fontWeight: FontWeight.bold,
                          buttonSize: 15.w,
                          borderRadius: 5.w,
                          onTapEvent: (){
                            BlocProvider.of<CalculatorBloc>(context).add(GetResultEvent(context: context));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
