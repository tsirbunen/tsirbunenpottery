import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/bootstrap/app/app_providers.dart';
import 'package:tsirbunenpottery/bootstrap/environment/app_environment.dart';
import 'package:tsirbunenpottery/bootstrap/environment/environment_scope.dart';
import 'package:tsirbunenpottery/bootstrap/service_locator/service_locator.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_state.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/localization/languages.dart';
import 'package:tsirbunenpottery/localization/utils.dart';
import 'package:tsirbunenpottery/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return EnvironmentScope(
      environment: getIt<Environment>(),
      child: AppProviders(
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            final locale = state.language.toLocale();
            return MaterialApp.router(
              routerConfig: getIt<GoRouter>(),
              theme: const AppTheme().themeData,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: localizationsDelegates,
              supportedLocales: AppLocale.supportedLocales,
              locale: locale,
              localeListResolutionCallback: createLocaleListResolutionCallback(locale),
            );
          },
        ),
      ),
    );
  }
}
