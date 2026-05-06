import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/bootstrap/environment/app_environment.dart';
import 'package:tsirbunenpottery/bootstrap/environment/environment_scope.dart';
import 'package:tsirbunenpottery/bootstrap/service_locator/service_locator.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/scroll_position_cache/scroll_position_cache.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_state.dart';
import 'package:tsirbunenpottery/features/contact/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/barrel.dart';
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
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: getIt.get<AppLogger>()),
          RepositoryProvider.value(value: getIt.get<ScrollPositionCache>()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: getIt.get<LanguageBloc>()),
            BlocProvider.value(value: getIt.get<HomeBloc>()),
            BlocProvider.value(value: getIt.get<ContactBloc>()),
            BlocProvider.value(value: getIt.get<PiecesBloc>()),
            BlocProvider.value(value: getIt.get<DesignsBloc>()),
            BlocProvider.value(value: getIt.get<CategoriesBloc>()),
            BlocProvider.value(value: getIt.get<CollectionsBloc>()),
          ],
          child: BlocBuilder<LanguageBloc, LanguageState>(
            builder: (BuildContext context, LanguageState state) {
              final locale = state.language.toLocale();

              return MaterialApp.router(
                routerConfig: getIt.get<GoRouter>(),
                theme: const AppTheme().themeData,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: localizationsDelegates,
                supportedLocales: AppLocale.supportedLocales,
                locale: locale,
                localeListResolutionCallback:
                    createLocaleListResolutionCallback(locale),
              );
            },
          ),
        ),
      ),
    );
  }
}
