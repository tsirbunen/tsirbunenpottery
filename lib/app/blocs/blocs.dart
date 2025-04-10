import 'package:get_it/get_it.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_bloc.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/bloc/collections_and_pieces_bloc.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/bloc/collections_and_pieces_event.dart';
import 'package:madmudmobile/features/collections_and_pieces/repository/pieces_repository.dart';

// We use the service locator pattern to provide instances of the blocs so that
// for example bloc-to-bloc communication is easier. We also prepare all the blocs
// here (like pass the necessary repositories and add initializing events where needed).
final getIt = GetIt.instance;

void prepareBlocs() {
  final piecesRepository = PiecesRepository();
  final collectionsAndPiecesBloc = CollectionsAndPiecesBloc(piecesRepository);
  collectionsAndPiecesBloc.add(FetchPieces());

  getIt.registerSingleton<GeneralStateBloc>(GeneralStateBloc());
  getIt.registerSingleton<CollectionsAndPiecesBloc>(collectionsAndPiecesBloc);
}
