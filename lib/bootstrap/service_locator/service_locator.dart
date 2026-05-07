import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/bootstrap/environment/app_environment.dart';
import 'package:tsirbunenpottery/bootstrap/router/route_controller.dart';
import 'package:tsirbunenpottery/core/crash_reporting/crash_reporter.dart';
import 'package:tsirbunenpottery/core/crash_reporting/no_op_crash_reporter.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/logging/dev_app_logger.dart';
import 'package:tsirbunenpottery/core/logging/release_app_logger.dart';
import 'package:tsirbunenpottery/core/retry/retry_backoff.dart';
import 'package:tsirbunenpottery/core/scroll_position_cache/scroll_position_cache.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/data/cloud_service.dart';
import 'package:tsirbunenpottery/data/firestore_cloud_service.dart';
import 'package:tsirbunenpottery/data/firestore_data_parser.dart';
import 'package:tsirbunenpottery/data/products_repository.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/categories/repository/categories_repository.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/collections/repository/collections_repository.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/designs/repository/designs_repository.dart';
import 'package:tsirbunenpottery/features/contact/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/contact/repository/contact_repository.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/home/repository/home_repository.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/pieces/repository/pieces_repository.dart';

// We use the service locator pattern to provide instances of the blocs so that
// for example bloc-to-bloc communication is easier. We also prepare all the blocs
// here (like pass the necessary repositories and add initializing events where needed).
final getIt = GetIt.instance;

void prepareBlocs({CloudService? cloudService, AppLogger? logger}) {
  const crashReporter = NoOpCrashReporter();
  final resolvedLogger =
      logger ?? (kReleaseMode ? ReleaseAppLogger(crashReporter) : const DevAppLogger());
  getIt.registerSingleton<AppLogger>(resolvedLogger);
  getIt.registerSingleton<CrashReporter>(crashReporter);

  final service = cloudService ?? FirestoreCloudService(logger: resolvedLogger);
  getIt.registerSingleton<CloudService>(service);

  getIt.registerSingleton<Environment>(const Environment());
  final languageBloc = LanguageBloc();

  final sharedBackoff = RetryBackoff();

  // Standalone fetches — each uses CloudService directly.
  final homeBloc = HomeBloc(HomeRepository(service), logger: resolvedLogger, backoff: sharedBackoff);
  homeBloc.add(FetchHomePageImageFileName());

  final contactBloc = ContactBloc(ContactRepository(service), logger: resolvedLogger, backoff: sharedBackoff);
  contactBloc.add(FetchOwnerPhoto());

  // Product blocs — all share a single ProductsRepository cache.
  final parser = FirestoreDataParser(logger: resolvedLogger);
  final productsRepository = ProductsRepository(service, parser, logger: resolvedLogger);
  getIt.registerSingleton<ProductsRepository>(productsRepository);

  final piecesBloc = PiecesBloc(PiecesRepository(productsRepository), logger: resolvedLogger, backoff: sharedBackoff);
  piecesBloc.add(FetchPieces());

  final designsBloc = DesignsBloc(DesignsRepository(productsRepository), logger: resolvedLogger, backoff: sharedBackoff);
  designsBloc.add(FetchDesigns());

  final categoriesBloc = CategoriesBloc(CategoriesRepository(productsRepository), logger: resolvedLogger, backoff: sharedBackoff);
  categoriesBloc.add(FetchCategories());

  final collectionsBloc = CollectionsBloc(CollectionsRepository(productsRepository), logger: resolvedLogger, backoff: sharedBackoff);
  collectionsBloc.add(FetchCollections());

  final router = buildRouter();

  getIt.registerSingleton<ScrollPositionCache>(ScrollPositionCache());
  getIt.registerSingleton<LanguageBloc>(languageBloc);
  getIt.registerSingleton<HomeBloc>(homeBloc);
  getIt.registerSingleton<ContactBloc>(contactBloc);
  getIt.registerSingleton<PiecesBloc>(piecesBloc);
  getIt.registerSingleton<DesignsBloc>(designsBloc);
  getIt.registerSingleton<CategoriesBloc>(categoriesBloc);
  getIt.registerSingleton<CollectionsBloc>(collectionsBloc);
  getIt.registerSingleton<GoRouter>(router);
}
