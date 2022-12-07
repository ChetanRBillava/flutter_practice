
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/themes/app_theme.dart';
import '../../logic/cubit/app_theme_cubit.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.obscureText,
    this.labelText,
    this.labelTextFontSize,
    this.hintText,
    this.hintTextFontSize,
    this.prefixIcon,
    this.suffixIcon,
    this.textCapitalization,
    this.textInputType,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.focusedBorderWidth,
    this.focusedBorderColor,
    this.enabledBorderWidth,
    this.enabledBorderColor,
    this.validator,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool? obscureText;
  final String? labelText, hintText;
  final double? labelTextFontSize, hintTextFontSize;
  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  final int? maxLength, minLines, maxLines;
  final double? focusedBorderWidth, enabledBorderWidth;
  final Color? focusedBorderColor, enabledBorderColor;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return TextFormField(

          controller: widget.controller,
          validator: widget.validator,
          maxLength: widget.maxLength,
          minLines: widget.minLines,
          maxLines: widget.maxLines??1,
          keyboardType: widget.textInputType??TextInputType.text,
          textCapitalization: widget.textCapitalization??TextCapitalization.sentences,
          obscureText: widget.obscureText??false,
          style: TextStyle(
            color: (appThemeState as AppThemeSet).themeClass.textColor_1,
          ),
          decoration: (widget.prefixIcon!=null && widget.suffixIcon!=null)?InputDecoration(
            prefixIcon: Icon(widget.prefixIcon),
            suffixIcon: widget.suffixIcon,
            labelText: widget.labelText,
            labelStyle: TextStyle(
                color: (appThemeState).themeClass.textColor_1,
                fontSize: widget.labelTextFontSize??14.sp,
                fontFamily: 'Poppins'
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: (appThemeState).themeClass.textCaptionColor,
                fontSize: widget.hintTextFontSize??10.sp,
                fontFamily: 'Poppins'
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.w),
              borderSide: BorderSide(width: widget.focusedBorderWidth??1,
                  color: widget.focusedBorderColor??(appThemeState).themeClass.dangerColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.w),
              borderSide: BorderSide(width: widget.focusedBorderWidth??1,
                  color: widget.focusedBorderColor??(appThemeState).themeClass.focusedFormFieldBorderColor),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.w),
                borderSide: BorderSide(width:  widget.enabledBorderWidth??1,
                    color: widget.enabledBorderColor??(appThemeState).themeClass.enabledFormFieldBorderColor)
            ),
          ):
          (widget.prefixIcon!=null)?InputDecoration(
            prefixIcon: Icon(widget.prefixIcon),
            labelText: widget.labelText,
            labelStyle: TextStyle(
                color: (appThemeState as AppThemeSet).themeClass.textColor_1,
                fontSize: widget.labelTextFontSize??14.sp,
                fontFamily: 'Poppins'
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: (appThemeState).themeClass.textCaptionColor,
                fontSize: widget.hintTextFontSize??10.sp,
                fontFamily: 'Poppins'
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.w),
              borderSide: BorderSide(width: widget.focusedBorderWidth??1,
                  color: widget.focusedBorderColor??(appThemeState).themeClass.dangerColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.w),
              borderSide: BorderSide(width: widget.focusedBorderWidth??1,
                  color: widget.focusedBorderColor??(appThemeState).themeClass.focusedFormFieldBorderColor),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.w),
                borderSide: BorderSide(width:  widget.enabledBorderWidth??1,
                    color: widget.enabledBorderColor??(appThemeState).themeClass.enabledFormFieldBorderColor)
            ),
          ):
          (widget.suffixIcon!=null)?InputDecoration(
            suffixIcon: widget.suffixIcon,
            labelText: widget.labelText,
            labelStyle: TextStyle(
                color: (appThemeState as AppThemeSet).themeClass.textColor_1,
                fontSize: widget.labelTextFontSize??14.sp,
                fontFamily: 'Poppins'
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: (appThemeState).themeClass.textCaptionColor,
                fontSize: widget.hintTextFontSize??10.sp,
                fontFamily: 'Poppins'
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.w),
              borderSide: BorderSide(width: widget.focusedBorderWidth??1,
                  color: widget.focusedBorderColor??(appThemeState).themeClass.dangerColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.w),
              borderSide: BorderSide(width: widget.focusedBorderWidth??1,
                  color: widget.focusedBorderColor??(appThemeState).themeClass.focusedFormFieldBorderColor),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.w),
                borderSide: BorderSide(width:  widget.enabledBorderWidth??1,
                    color: widget.enabledBorderColor??(appThemeState).themeClass.enabledFormFieldBorderColor)
            ),
          ):
          InputDecoration(
            labelText: widget.labelText,
            labelStyle: TextStyle(
                color: (appThemeState as AppThemeSet).themeClass.textColor_1,
                fontSize: widget.labelTextFontSize??14.sp,
                fontFamily: 'Poppins'
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: (appThemeState).themeClass.textCaptionColor,
                fontSize: widget.hintTextFontSize??10.sp,
                fontFamily: 'Poppins'
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.w),
              borderSide: BorderSide(width: widget.focusedBorderWidth??1,
                  color: widget.focusedBorderColor??(appThemeState).themeClass.dangerColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.w),
              borderSide: BorderSide(width: widget.focusedBorderWidth??1,
                  color: widget.focusedBorderColor??(appThemeState).themeClass.focusedFormFieldBorderColor),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.w),
                borderSide: BorderSide(width:  widget.enabledBorderWidth??1,
                    color: widget.enabledBorderColor??(appThemeState).themeClass.enabledFormFieldBorderColor)
            ),
          ),
        );
      },
    );
  }
}