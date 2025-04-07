import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/app/blocs/blocs.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_bloc.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/collections_and_pieces_bloc.dart';

void prepareBlocsForTests() {
  if (!getIt.isRegistered<GeneralStateBloc>()) {
    getIt.registerSingleton<GeneralStateBloc>(GeneralStateBloc());
    getIt.registerSingleton<CollectionsAndPiecesBloc>(
        CollectionsAndPiecesBloc());
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
