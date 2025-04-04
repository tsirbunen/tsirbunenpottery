import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:madmudmobile/localization/local.dart';
import 'package:madmudmobile/services/router/route_controller.dart';
import 'package:madmudmobile/theme/app_theme.dart';

class MadMudApp extends StatefulWidget {
  const MadMudApp({super.key});

  @override
  State<MadMudApp> createState() => _MadMudAppState();
}

class _MadMudAppState extends State<MadMudApp> {
  // FIXME: Implement storing and changing the locale in a proper way
  // This is just a temporary preliminary solution
  final Locale _selectedLocale = const Locale('en');

  @override
  Widget build(BuildContext context) {
    final routerConfig = RouteController().buildRouter();

    return MaterialApp.router(
      routerConfig: routerConfig,
      theme: const AppTheme().themeData,
      localizationsDelegates: const [
        Local.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: Local.supportedLocales,
      locale: _selectedLocale,
      localeListResolutionCallback:
          (List<Locale>? locales, Iterable<Locale> supportedLocales) {
        return _resolveLocale(locales, supportedLocales, _selectedLocale);
      },
    );
  }

  Locale _resolveLocale(
    List<Locale>? locales,
    Iterable<Locale> supportedLocales,
    final Locale? selectedLocale,
  ) {
    String? code;
    if (selectedLocale == null) {
      code = locales != null && locales.isNotEmpty
          ? locales[0].toString().substring(0, 2)
          : supportedLocales.toList()[0].toString().substring(0, 2);
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
}
