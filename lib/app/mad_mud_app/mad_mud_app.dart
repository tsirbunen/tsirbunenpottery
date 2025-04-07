import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/blocs/blocs.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_bloc.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_state.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/collections_and_pieces_bloc.dart';
import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/app/router/route_controller.dart';
import 'package:madmudmobile/localization/utils.dart';
import 'package:madmudmobile/theme/app_theme.dart';

class MadMudApp extends StatelessWidget {
  const MadMudApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerConfig = RouteController().buildRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt.get<GeneralStateBloc>()),
        BlocProvider.value(value: getIt.get<CollectionsAndPiecesBloc>()),
      ],
      child: BlocBuilder<GeneralStateBloc, GeneralState>(
        builder: (BuildContext context, GeneralState state) {
          final locale = state.language.toLocale();

          return MaterialApp.router(
            routerConfig: routerConfig,
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
    );
  }
}
