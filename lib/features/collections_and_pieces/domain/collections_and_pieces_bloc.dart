import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/collections_and_pieces_event.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/collections_and_pieces_state.dart';

class CollectionsAndPiecesBloc
    extends Bloc<CollectionsAndPiecesEvent, CollectionsAndPiecesState> {
  CollectionsAndPiecesBloc() : super(const CollectionsAndPiecesState()) {
    on<CollectionsAndPiecesEvent>(_onEvent);
  }

  Future<void> _onEvent(
    CollectionsAndPiecesEvent event,
    Emitter<CollectionsAndPiecesState> emit,
  ) async {
    return switch (event) {
      final CollectionsAndPiecesEvent _ => emit(state),
    };
  }
}
