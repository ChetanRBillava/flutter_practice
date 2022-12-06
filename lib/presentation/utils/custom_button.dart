// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/themes/app_theme.dart';
import 'app_texts.dart';

class CustomButton extends StatefulWidget {
  CustomButton({
    Key? key,
    required this.buttonColor,

    this.buttonText,
    this.buttonTextColor,
    this.onTapEvent,
    this.buttonSize,
    this.borderRadius,
    this.buttonTextSize,
    this.borderColor,
    this.fontWeight,
    this.textAlign,
    this.iconSize,
    this.iconColor,
    this.iconData,
  }) : super(key: key);

  ///required
  Color buttonColor;

  ///optional
  Function()? onTapEvent;
  String? buttonText;
  double? buttonSize, borderRadius, buttonTextSize, iconSize;
  Color? borderColor, buttonTextColor, iconColor;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  IconData? iconData;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTapEvent,
      child: Ink(
        decoration: BoxDecoration(
            color: widget.buttonColor,
            border: Border.all(color: widget.borderColor??widget.buttonColor),
            borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius??0.w)
            )
        ),
        child: Container(
          width: widget.buttonSize,
          child: Padding(
            padding: EdgeInsets.all(1.h),
            child: widget.iconData!=null?
                Icon(
                  widget.iconData,
                  size: widget.iconSize,
                  color: widget.iconColor,
                ) :
            AppTexts(
              textString: widget.buttonText as String,
              textFontSize: widget.buttonTextSize??12.sp,
              fontWeight: widget.fontWeight??FontWeight.normal,
              textColor: widget.buttonTextColor,
              textAlign: widget.textAlign??TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}