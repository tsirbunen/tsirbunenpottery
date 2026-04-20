import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/bootstrap/router/route_controller.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/logging/dev_app_logger.dart';
import 'package:tsirbunenpottery/core/logging/noop_app_logger.dart';
import 'package:tsirbunenpottery/core/scroll_position_cache/scroll_position_cache.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/data/firestore_cloud_service.dart';
import 'package:tsirbunenpottery/data/products_repository.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/categories/repository/categories_repository.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/collections/repository/collections_repository.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/designs/repository/designs_repository.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/home/repository/home_repository.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/pieces/repository/pieces_repository.dart';

// We use the service locator pattern to provide instances of the blocs so that
// for example bloc-to-bloc communication is easier. We also prepare all the blocs
// here (like pass the necessary repositories and add initializing events where needed).
final getIt = GetIt.instance;

void prepareBlocs() {
  final logger =
      kReleaseMode ? const NoOpAppLogger() : const DevAppLogger();
  getIt.registerSingleton<AppLogger>(logger);

  final cloudService = FirestoreCloudService(logger: logger);

  final languageBloc = LanguageBloc();

  final homeRepository = HomeRepository(cloudService);
  final homeBloc = HomeBloc(homeRepository);
  homeBloc.add(FetchHomePageImageFileName());

  final productsRepository = ProductsRepository(cloudService, logger: logger);

  final piecesBloc = PiecesBloc(PiecesRepository(productsRepository));
  piecesBloc.add(FetchPieces());

  final designsBloc = DesignsBloc(DesignsRepository(productsRepository));
  designsBloc.add(FetchDesigns());

  final categoriesBloc =
      CategoriesBloc(CategoriesRepository(productsRepository));
  categoriesBloc.add(FetchCategories());

  final collectionsBloc =
      CollectionsBloc(CollectionsRepository(productsRepository));
  collectionsBloc.add(FetchCollections());
  final router = RouteController().buildRouter();

  getIt.registerSingleton<LanguageBloc>(languageBloc);
  getIt.registerSingleton<HomeBloc>(homeBloc);
  getIt.registerSingleton<PiecesBloc>(piecesBloc);
  getIt.registerSingleton<DesignsBloc>(designsBloc);
  getIt.registerSingleton<CategoriesBloc>(categoriesBloc);
  getIt.registerSingleton<CollectionsBloc>(collectionsBloc);
  getIt.registerSingleton<ScrollPositionCache>(ScrollPositionCache());
  getIt.registerSingleton<GoRouter>(router);
}
