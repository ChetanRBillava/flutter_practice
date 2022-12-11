import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/core/themes/app_theme.dart';
import 'package:sizer/sizer.dart';

import '../../logic/cubit/app_theme_cubit.dart';
import '../../logic/cubit/my_form_cubit.dart';
import '../utils/app_texts.dart';
import '../utils/custom_button.dart';

formFieldDialog(BuildContext context) {
// show the dialog
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, appThemeState) {
          return BlocBuilder<MyFormCubit, MyFormState>(
            builder: (context, state) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return Dialog(
                      backgroundColor: (appThemeState as AppThemeSet).themeClass.buttonBackgroundColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.sp)),
                    child: Container(
                      width: 90.w,
                      height: 40.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: AppTexts(
                                    textString: (state as MyFormDetails).heading,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.bold,
                                    textFontSize: 18.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: AppTexts(
                                    textString: (state).subHeading,
                                    textAlign: TextAlign.center,
                                    textFontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          state.visible ? Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: AppTexts(
                                        textString: (state).password,
                                        textAlign: TextAlign.center,
                                        textFontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: AppTexts(
                                        textString: 'Hiding in ${state.timer} seconds',
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ) : Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppTexts(
                                  textString: 'Click on the button to display password',
                                  textAlign: TextAlign.start,
                                  textFontSize: 10.sp,
                                ),
                              ],
                            ),
                          ),
                          CustomButton(
                            iconData: state.visible ? Icons.visibility_off : Icons.visibility,
                            iconColor: (appThemeState).themeClass.textColor_1,
                            buttonColor: (appThemeState).themeClass.buttonBackgroundColor2,
                            buttonSize: 40.w,
                            borderRadius: 3.w,
                            fontWeight: FontWeight.bold,
                            onTapEvent: () {
                              BlocProvider.of<MyFormCubit>(context).updateTimer(!state.visible);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      );
    },
  );
}