import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/app/blocs/blocs.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_bloc.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_bloc.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_event.dart';
import 'package:madmudmobile/features/products/repository/products_repository.dart';

void prepareBlocsForTests() {
  if (!getIt.isRegistered<GeneralStateBloc>()) {
    final piecesRepository = ProductsRepository();
    final collectionsAndPiecesBloc = ProductsBloc(piecesRepository);
    collectionsAndPiecesBloc.add(FetchProducts());

    getIt.registerSingleton<GeneralStateBloc>(GeneralStateBloc());
    getIt.registerSingleton<ProductsBloc>(collectionsAndPiecesBloc);
  }
}

void setUpAndTearDownAllBlocs() {
  setUpAll(() {
    prepareBlocsForTests();
  });

  tearDownAll(() {
    getIt.reset();
  });
}
