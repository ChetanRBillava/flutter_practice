import 'package:flutter/material.dart';

import 'language_collection/languageEn.dart';
import 'language_collection/languageHi.dart';
import 'language_collection/languagesKn.dart';
import 'languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {

  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'hi', 'kn'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'hi':
        return LanguageHi();
      case 'kn':
        return LanguageKn();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;

}