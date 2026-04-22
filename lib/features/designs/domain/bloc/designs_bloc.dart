import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/designs_event.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/designs_state.dart';
import 'package:tsirbunenpottery/features/designs/repository/designs_repository.dart';

class DesignsBloc extends Bloc<DesignsEvent, DesignsState> {
  final DesignsRepository _repository;
  final AppLogger _logger;

  DesignsBloc(this._repository, {required AppLogger logger})
      : _logger = logger,
        super(const DesignsState()) {
    on<DesignsEvent>(_onEvent);
  }

  Future<void> _onEvent(DesignsEvent event, Emitter<DesignsState> emit) async {
    switch (event) {
      case FetchDesigns():
        await _onFetch(emit);
    }
  }

  Future<void> _onFetch(Emitter<DesignsState> emit) async {
    if (state.blocStatus.isLoading || state.designsById.isNotEmpty) return;
    emit(state.copyWith(blocStatus:const BlocStatus(Status.loading)));
    try {
      final data = await _repository.getData();
      emit(DesignsState(
        designsById: data.designsById,
        imageFileNamesByDesignId: data.imageFileNamesByDesignId,
        piecesByDesignId: data.piecesByDesignId,
        blocStatus: const BlocStatus(Status.ok),
      ));
    } catch (e, s) {
      _logger.logError('Failed to fetch designs', error: e, stackTrace: s, tag: 'DesignsBloc');
      emit(state.copyWith(blocStatus: BlocStatus(Status.error, message: e.toString())));
    }
  }
}
