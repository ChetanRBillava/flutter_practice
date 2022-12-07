import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../logic/cubit/app_theme_cubit.dart';

class AppTexts extends StatefulWidget {
  const AppTexts({
    Key? key,
    required this.textString,
    this.textFontSize,
    this.textColor,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);


  final String textString;
  final double? textFontSize;
  final Color? textColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  @override
  State<AppTexts> createState() => _AppTextsState();
}

class _AppTextsState extends State<AppTexts> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return Text(
          widget.textString,
          textAlign: widget.textAlign??TextAlign.start,
          style: TextStyle(
              color: widget.textColor??(appThemeState as AppThemeSet).themeClass.textColor_1,
              fontSize: widget.textFontSize??12.0.sp,
              fontWeight: widget.fontWeight??FontWeight.normal,
              fontFamily: 'Poppins'
          ),
        );
      },
    );
  }
}