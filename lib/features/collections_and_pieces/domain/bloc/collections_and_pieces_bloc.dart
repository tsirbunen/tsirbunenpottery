import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/blocs/bloc_status.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/bloc/collections_and_pieces_event.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/bloc/collections_and_pieces_state.dart';
import 'package:madmudmobile/features/collections_and_pieces/repository/pieces_repository.dart';

class CollectionsAndPiecesBloc
    extends Bloc<CollectionsAndPiecesEvent, CollectionsAndPiecesState> {
  final PiecesRepository _piecesRepository;
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
    emit(state.copyWith(newStatus: event.status));
  }

  Future<void> _onFetchProducts(
      FetchPieces event, Emitter<CollectionsAndPiecesState> emit) async {
    emit(state.copyWith(newStatus: const BlocStatus(Status.loading)));
    try {
      final products = await _piecesRepository.fetchPieces();
      emit(state.copyWith(
        newStatus: const BlocStatus(Status.ok),
        newPieces: products,
      ));
    } catch (e) {
      emit(state.copyWith(
          newStatus: BlocStatus(Status.error, message: e.toString())));
    }
  }
}
