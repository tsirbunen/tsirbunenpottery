import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/bootstrap/service_locator/service_locator.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/scroll_position_cache/scroll_position_cache.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/contact/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/barrel.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: getIt<AppLogger>()),
        RepositoryProvider.value(value: getIt<ScrollPositionCache>()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: getIt<LanguageBloc>()),
          BlocProvider.value(value: getIt<HomeBloc>()),
          BlocProvider.value(value: getIt<ContactBloc>()),
          BlocProvider.value(value: getIt<PiecesBloc>()),
          BlocProvider.value(value: getIt<DesignsBloc>()),
          BlocProvider.value(value: getIt<CategoriesBloc>()),
          BlocProvider.value(value: getIt<CollectionsBloc>()),
        ],
        child: child,
      ),
    );
  }
}
