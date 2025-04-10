import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/app/blocs/blocs.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_bloc.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/bloc/collections_and_pieces_bloc.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/bloc/collections_and_pieces_event.dart';
import 'package:madmudmobile/features/collections_and_pieces/repository/pieces_repository.dart';

void prepareBlocsForTests() {
  if (!getIt.isRegistered<GeneralStateBloc>()) {
    final piecesRepository = PiecesRepository();
    final collectionsAndPiecesBloc = CollectionsAndPiecesBloc(piecesRepository);
    collectionsAndPiecesBloc.add(FetchPieces());

    getIt.registerSingleton<GeneralStateBloc>(GeneralStateBloc());
    getIt.registerSingleton<CollectionsAndPiecesBloc>(collectionsAndPiecesBloc);
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
