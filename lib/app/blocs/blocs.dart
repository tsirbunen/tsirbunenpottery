import 'package:get_it/get_it.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_bloc.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_bloc.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_event.dart';
import 'package:madmudmobile/features/products/repository/products_repository.dart';

// We use the service locator pattern to provide instances of the blocs so that
// for example bloc-to-bloc communication is easier. We also prepare all the blocs
// here (like pass the necessary repositories and add initializing events where needed).
final getIt = GetIt.instance;

void prepareBlocs() {
  final piecesRepository = ProductsRepository();
  final collectionsAndPiecesBloc = ProductsBloc(piecesRepository);
  collectionsAndPiecesBloc.add(FetchProducts());

  getIt.registerSingleton<GeneralStateBloc>(GeneralStateBloc());
  getIt.registerSingleton<ProductsBloc>(collectionsAndPiecesBloc);
}
