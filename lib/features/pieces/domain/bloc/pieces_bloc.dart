import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/pieces_event.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/pieces_state/pieces_state.dart';
import 'package:tsirbunenpottery/features/pieces/repository/pieces_repository.dart';

class PiecesBloc extends Bloc<PiecesEvent, PiecesState> {
  final PiecesRepository _repository;
  final AppLogger _logger;

  PiecesBloc(this._repository, {required AppLogger logger})
      : _logger = logger,
        super(const PiecesState()) {
    on<PiecesEvent>(_onEvent);
  }

  Future<void> _onEvent(PiecesEvent event, Emitter<PiecesState> emit) async {
    switch (event) {
      case FetchPieces():
        await _onFetch(emit);
    }
  }

  Future<void> _onFetch(Emitter<PiecesState> emit) async {
    if (state.blocStatus.isLoading || state.piecesById.isNotEmpty) return;
    emit(state.copyWith(blocStatus:const BlocStatus(Status.loading)));
    try {
      final data = await _repository.getData();
      emit(PiecesState(
        piecesById: data.piecesById,
        designsById: data.designsById,
        imageFileNamesByDesignId: data.imageFileNamesByDesignId,
        pieceIdsByDesignId: data.pieceIdsByDesignId,
        blocStatus: const BlocStatus(Status.ok),
      ));
    } catch (e, s) {
      _logger.logError('Failed to fetch pieces', error: e, stackTrace: s, tag: 'PiecesBloc');
      emit(state.copyWith(blocStatus: BlocStatus(Status.error, message: e.toString())));
    }
  }
}
