import 'package:flutter/material.dart';

abstract class Languages {

  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  ///sidebar
  String get language;
  String get welcomeText;
  String get home;
  String get calculator;
  String get jokes;
  String get myForm;
  String get theme;

  ///home
  String get homeLabel;
  String get wifiConnected;
  String get mobileNetworkConnected;
  String get noInternet;

  ///jokes
  String get jokeMessage;

  ///form
  String get formNameLabel;
  String get formNameHint;
  String get formGenderLabel;
  String get formGenderMale;
  String get formGenderFemale;
  String get formPasswordLabel;
  String get formPasswordHint;
  String get formExperienceLabel;
  String get formExperienceFirstTime;
  String get formExperienceUsedBefore;
  String get formCheckboxLabel;
  String get formDone;
  String get formFieldError;
  String get formFieldPasswordLengthError;
  String get formFieldCheckboxError;
  String get formFieldGenderError;
}