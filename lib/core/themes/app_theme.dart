import 'package:flutter/material.dart';

class AppTheme {
  ///main
  late Color backgroundColor;
  late Color formFieldBackgroundColor;
  late Color enabledFormFieldBorderColor;
  late Color focusedFormFieldBorderColor;
  late Color appbarBackgroundColor;
  late Color primaryColor;
  late Color secondaryColor;

  ///selections
  late Color successColor;
  late Color dangerColor;
  late Color infoColor;
  late Color warningColor;

  ///texts
  late Color textColor_1;
  late Color textColor_2;
  late Color textCaptionColor;

  ///button
  late Color buttonBackgroundColor;
  late Color buttonBackgroundColor2;
}

class LightTheme extends AppTheme{
  LightTheme();

  ///main
  @override
  // TODO: implement primary
  Color get backgroundColor => const Color(0xffffffff);

  @override
  // TODO: implement primary
  Color get formFieldBackgroundColor => const Color(0xffffffff);

  @override
  // TODO: implement primary
  Color get enabledFormFieldBorderColor => const Color(0xff000000);

  @override
  // TODO: implement primary
  Color get focusedFormFieldBorderColor => const Color(0xffffffff);

  @override
  // TODO: implement primary
  Color get appbarBackgroundColor => const Color(0xff719bf1);

  @override
  // TODO: implement primary
  Color get primaryColor => const Color(0xff719bf1);

  @override
  // TODO: implement primary
  Color get secondaryColor => const Color(0xffffffff);

  ///selections
  @override
  // TODO: implement primary
  Color get successColor => const Color(0xff2ee719);

  @override
  // TODO: implement primary
  Color get dangerColor => const Color(0xfff60f0f);

  @override
  // TODO: implement primary
  Color get infoColor => const Color(0xff719bf1);

  @override
  // TODO: implement primary
  Color get warningColor => const Color(0xffffd719);

  ///texts
  @override
  // TODO: implement primary
  Color get textColor_1 => const Color(0xff000000);

  @override
  // TODO: implement primary
  Color get textColor_2 => const Color(0xffffffff);

  @override
  // TODO: implement primary
  Color get textCaptionColor => const Color(0xff616060);

  ///button
  @override
  // TODO: implement primary
  Color get buttonBackgroundColor => const Color(0xff5789ee);

  @override
  // TODO: implement primary
  Color get buttonBackgroundColor2 => const Color(0xffffffff);
}

class DarkTheme extends AppTheme{
  DarkTheme();

  ///main
  @override
  // TODO: implement primary
  Color get backgroundColor => const Color(0xff000000);

  @override
  // TODO: implement primary
  Color get formFieldBackgroundColor => const Color(0xff000000);

  @override
  // TODO: implement primary
  Color get enabledFormFieldBorderColor => const Color(0xffffffff);

  @override
  // TODO: implement primary
  Color get focusedFormFieldBorderColor => const Color(0xff000000);

  @override
  // TODO: implement primary
  Color get appbarBackgroundColor => const Color(0xff07274d);

  @override
  // TODO: implement primary
  Color get primaryColor => const Color(0xff07274d);

  @override
  // TODO: implement primary
  Color get secondaryColor => const Color(0xff000000);

  ///selections
  @override
  // TODO: implement primary
  Color get successColor => const Color(0xff1a6513);

  @override
  // TODO: implement primary
  Color get dangerColor => const Color(0xff8f1818);

  @override
  // TODO: implement primary
  Color get infoColor => const Color(0xff07274d);

  @override
  // TODO: implement primary
  Color get warningColor => const Color(0xffa95801);

  ///texts
  @override
  // TODO: implement primary
  Color get textColor_1 => const Color(0xffffffff);

  @override
  // TODO: implement primary
  Color get textColor_2 => const Color(0xff000000);

  @override
  // TODO: implement primary
  Color get textCaptionColor => const Color(0xffb49f9f);

  ///button
  @override
  // TODO: implement primary
  Color get buttonBackgroundColor => const Color(0xff07274d);

  @override
  // TODO: implement primary
  Color get buttonBackgroundColor2 => const Color(0xff000000);
}