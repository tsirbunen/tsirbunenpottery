import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/localization/fi.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/localization/translations.dart';
import 'en.dart';

class AppLocale {
  final Locale locale;
  final Translations translations;

  AppLocale(this.locale) : translations = locale.languageCode == 'fi' ? Fi() : En();

  static AppLocale of(final BuildContext context) {
    final locale = Localizations.of<AppLocale>(context, AppLocale);
    if (locale == null) {
      throw FlutterError(
        'AppLocale.of() was called with a context that does not contain an AppLocale.\n'
        'Ensure AppLocale.delegate is listed in MaterialApp.localizationsDelegates.',
      );
    }
    return locale;
  }

  static const LocalizationsDelegate<AppLocale> delegate =
      CustomLocalizationsDelegate();

  String translate(final Translation key) {
    return translations.translate(key);
  }

  static Iterable<Locale> get supportedLocales => [
        const Locale('en'),
        const Locale('fi'),
      ];
}

class CustomLocalizationsDelegate extends LocalizationsDelegate<AppLocale> {
  const CustomLocalizationsDelegate();

  @override
  bool isSupported(final Locale locale) {
    return AppLocale.supportedLocales.contains(locale);
  }

  @override
  Future<AppLocale> load(Locale locale) {
    return SynchronousFuture<AppLocale>(AppLocale(locale));
  }

  @override
  bool shouldReload(CustomLocalizationsDelegate old) => false;
}

// Enables short-form translation: context.local(Translation.tradeName)
extension LocalizedTranslationBuildContext on BuildContext {
  String local(final Translation key) => AppLocale.of(this).translate(key);
}
