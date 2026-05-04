import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';

const List<LocalizationsDelegate<Object>> localizationsDelegates = [
  AppLocale.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
];

Locale resolveLocale(
  List<Locale>? locales,
  Iterable<Locale> supportedLocales,
  final Locale? selectedLocale,
) {
  String? code;
  if (selectedLocale == null) {
    code = locales != null && locales.isNotEmpty
        ? locales[0].languageCode
        : supportedLocales.first.languageCode;
  } else {
    code = selectedLocale.languageCode;
  }

  switch (code) {
    case 'fi':
      return const Locale('fi');
    default:
      return const Locale('en');
  }
}

LocaleListResolutionCallback createLocaleListResolutionCallback(Locale locale) {
  return (List<Locale>? locales, Iterable<Locale> supportedLocales) {
    return resolveLocale(locales, supportedLocales, locale);
  };
}
