import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/blocs/bloc_status.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/bloc/collections_and_pieces_event.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/bloc/collections_and_pieces_state.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/bloc/utils.dart';
import 'package:madmudmobile/features/collections_and_pieces/repository/products_repository.dart';

class CollectionsAndPiecesBloc
    extends Bloc<CollectionsAndPiecesEvent, CollectionsAndPiecesState> {
  final ProductsRepository _piecesRepository;

  CollectionsAndPiecesBloc(this._piecesRepository)
      : super(const CollectionsAndPiecesState()) {
    on<CollectionsAndPiecesEvent>(_onEvent);
  }

  Future<void> _onEvent(
    CollectionsAndPiecesEvent event,
    Emitter<CollectionsAndPiecesState> emit,
  ) async {
    return switch (event) {
      final BlocStatusChanged e => _onBlocStatusChanged(e, emit),
      final FetchPieces e => _onFetchProducts(e, emit),
      final CollectionsAndPiecesEvent _ => emit(state),
    };
  }

  Future<void> _onBlocStatusChanged(
      BlocStatusChanged event, Emitter<CollectionsAndPiecesState> emit) async {
    emit(state.copyWithStateChange(newStatus: event.status));
  }

  Future<void> _onFetchProducts(
      FetchPieces event, Emitter<CollectionsAndPiecesState> emit) async {
    emit(
        state.copyWithStateChange(newStatus: const BlocStatus(Status.loading)));

    try {
      final products = await _piecesRepository.fetchProductData();
      final data = organizeProductsData(products);
      final newState = CollectionsAndPiecesState(
        piecesById: data["piecesById"],
        designsById: data["designsById"],
        collections: data["collections"],
        categories: data["categories"],
        collectionDesigns: data["collectionDesigns"],
        categoryDesigns: data["categoryDesigns"],
        blocStatus: const BlocStatus(Status.ok),
      );

      emit(newState);
    } catch (e) {
      emit(state.copyWithStateChange(
          newStatus: BlocStatus(Status.error, message: e.toString())));
    }
  }
}
