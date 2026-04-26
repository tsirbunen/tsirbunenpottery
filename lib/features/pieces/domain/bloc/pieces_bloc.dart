import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/state/bloc_utils/fetch_bloc_mixin.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/pieces_event.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/pieces_state.dart';
import 'package:tsirbunenpottery/features/pieces/repository/pieces_repository.dart';

class PiecesBloc extends Bloc<PiecesEvent, PiecesState>
    with FetchBlocMixin<PiecesEvent, PiecesState> {
  final PiecesRepository _repository;

  @override
  final AppLogger logger;

  @override
  bool get isLoaded => state.piecesById.isNotEmpty;

  @override
  String get fetchErrorMessage => 'Failed to fetch pieces';

  @override
  PiecesState withStatus(BlocStatus status) => state.copyWith(blocStatus: status);

  PiecesBloc(this._repository, {required this.logger}) : super(const PiecesState()) {
    on<PiecesEvent>(_onEvent);
  }

  Future<void> _onEvent(PiecesEvent event, Emitter<PiecesState> emit) async {
    switch (event) {
      case FetchPieces():
        await runFetch(emit, () async {
          final data = await _repository.getData();
          return PiecesState(
            piecesById: data.piecesById,
            designsById: data.designsById,
            imageFileNamesByDesignId: data.imageFileNamesByDesignId,
            pieceIdsByDesignId: data.pieceIdsByDesignId,
            blocStatus: const BlocStatus(Status.ok),
          );
        });
    }
  }
}
