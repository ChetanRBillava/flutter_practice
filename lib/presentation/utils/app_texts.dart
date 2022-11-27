import 'package:flutter/material.dart';

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
    return Text(
      widget.textString,
      textAlign: widget.textAlign??TextAlign.start,
      style: TextStyle(
          color: widget.textColor??Theme.of(context).textTheme.bodyText1?.color,
          fontSize: widget.textFontSize??12.0,
          fontWeight: widget.fontWeight??FontWeight.normal,
          fontFamily: 'Poppins'
      ),
    );
  }
}