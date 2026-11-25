import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  static final LocaleProvider instance = LocaleProvider._internal();
  LocaleProvider._internal();
  factory LocaleProvider() => instance;
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void toggleLocale() {
    _locale = _locale.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');

    notifyListeners();
  }
}
