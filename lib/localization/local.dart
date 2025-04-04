import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:madmudmobile/localization/fi.dart';
import 'package:madmudmobile/localization/translations.dart';
import 'en.dart';

class Local {
  final Locale locale;
  late Translations translations;

  Local(this.locale) {
    if (locale.languageCode == 'fi') {
      translations = Fi();
    } else {
      translations = En();
    }
  }

  static Local of(final BuildContext context) {
    return Localizations.of<Local>(context, Local)!;
  }

  static const LocalizationsDelegate<Local> delegate =
      CustomLocalizationsDelegate();

  String translate(final String key) {
    return translations.translate(key);
  }

  static Iterable<Locale> get supportedLocales => [
        const Locale('en'),
        const Locale('fi'),
      ];
}

class CustomLocalizationsDelegate extends LocalizationsDelegate<Local> {
  const CustomLocalizationsDelegate();

  @override
  bool isSupported(final Locale locale) {
    return Local.supportedLocales.contains(locale);
  }

  @override
  Future<Local> load(Locale locale) {
    return SynchronousFuture<Local>(Local(locale));
  }

  @override
  bool shouldReload(CustomLocalizationsDelegate old) {
    return true;
  }
}

// Note: This is to enable the use of translation with a very short syntax,
// for example context.local('tradeName'), instead the the general
// Local.of(context).translate('tradeName')
extension LocalizedBuildContext on BuildContext {
  String local(final String key) => Local.of(this).translate(key);
}
