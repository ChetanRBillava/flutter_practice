
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../main.dart';

const String prefSelectedLanguageCode = "SelectedLanguageCode";

Future<Locale> setLocale(String languageCode) async {
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  return languageCode.isNotEmpty
      ? Locale(languageCode, '')
      : const Locale('en', '');
}

void changeLanguage(BuildContext context, String selectedLanguageCode) async {
  var locale = await setLocale(selectedLanguageCode);
  // ignore: use_build_context_synchronously
  MyApp.setLocale(context, locale);
}