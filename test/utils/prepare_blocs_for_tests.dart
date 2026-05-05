import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/bootstrap/environment/app_environment.dart';
import 'package:tsirbunenpottery/bootstrap/router/route_controller.dart';
import 'package:tsirbunenpottery/bootstrap/service_locator/service_locator.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/logging/noop_app_logger.dart';
import 'package:tsirbunenpottery/core/retry/retry_backoff.dart';
import 'package:tsirbunenpottery/core/scroll_position_cache/scroll_position_cache.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_event.dart';
import 'package:tsirbunenpottery/localization/languages.dart';
import 'package:tsirbunenpottery/data/firestore_data_parser.dart';
import 'package:tsirbunenpottery/data/products_repository.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/categories_bloc.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/categories_event.dart';
import 'package:tsirbunenpottery/features/categories/repository/categories_repository.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/collections_bloc.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/collections_event.dart';
import 'package:tsirbunenpottery/features/collections/repository/collections_repository.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/designs_bloc.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/designs_event.dart';
import 'package:tsirbunenpottery/features/designs/repository/designs_repository.dart';
import 'package:tsirbunenpottery/features/contact/domain/bloc/contact_bloc.dart';
import 'package:tsirbunenpottery/features/contact/domain/bloc/contact_event.dart';
import 'package:tsirbunenpottery/features/contact/repository/contact_repository.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/home_bloc.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/home_event.dart';
import 'package:tsirbunenpottery/features/home/repository/home_repository.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/pieces_bloc.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/pieces_event.dart';
import 'package:tsirbunenpottery/features/pieces/repository/pieces_repository.dart';

import 'mock_cloud_service_helpers.dart';

void prepareBlocsForTests() {
  getIt.reset();
  const logger = NoOpAppLogger();
  getIt.registerSingleton<AppLogger>(logger);
  getIt.registerSingleton<ScrollPositionCache>(ScrollPositionCache());
  getIt.registerSingleton<Environment>(const Environment(noNetworkImages: true));

  final cloudService = mockCloudServiceWithHomeImageData();
  final sharedBackoff = RetryBackoff();

  final homeBloc = HomeBloc(HomeRepository(cloudService), logger: logger, backoff: sharedBackoff);
  homeBloc.add(FetchHomePageImageFileName());

  final contactBloc = ContactBloc(ContactRepository(cloudService), logger: logger, backoff: sharedBackoff);
  contactBloc.add(FetchOwnerPhoto());

  final productsRepository = ProductsRepository(
    cloudService,
    FirestoreDataParser(logger: logger),
    logger: logger,
  );

  final piecesBloc = PiecesBloc(PiecesRepository(productsRepository), logger: logger, backoff: sharedBackoff);
  piecesBloc.add(FetchPieces());

  final designsBloc = DesignsBloc(DesignsRepository(productsRepository), logger: logger, backoff: sharedBackoff);
  designsBloc.add(FetchDesigns());

  final categoriesBloc = CategoriesBloc(CategoriesRepository(productsRepository), logger: logger, backoff: sharedBackoff);
  categoriesBloc.add(FetchCategories());

  final collectionsBloc = CollectionsBloc(CollectionsRepository(productsRepository), logger: logger, backoff: sharedBackoff);
  collectionsBloc.add(FetchCollections());

  final languageBloc = LanguageBloc()..add(ChangeLanguage(Language.en));
  getIt.registerSingleton<LanguageBloc>(languageBloc);
  getIt.registerSingleton<HomeBloc>(homeBloc);
  getIt.registerSingleton<ContactBloc>(contactBloc);
  getIt.registerSingleton<PiecesBloc>(piecesBloc);
  getIt.registerSingleton<DesignsBloc>(designsBloc);
  getIt.registerSingleton<CategoriesBloc>(categoriesBloc);
  getIt.registerSingleton<CollectionsBloc>(collectionsBloc);
  getIt.registerSingleton<GoRouter>(buildRouter());
}

void setUpAndTearDownAllBlocsAndPreventNetworkImages() {
  setUp(() {
    prepareBlocsForTests();
  });

  tearDown(() {
    getIt.reset();
  });
}
