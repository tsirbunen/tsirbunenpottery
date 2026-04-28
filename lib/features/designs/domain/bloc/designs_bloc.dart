import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/state/bloc_utils/fetch_bloc_mixin.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/designs_event.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/designs_state.dart';
import 'package:tsirbunenpottery/features/designs/repository/designs_repository.dart';

class DesignsBloc extends Bloc<DesignsEvent, DesignsState>
    with FetchBlocMixin<DesignsEvent, DesignsState> {
  final IDesignsRepository _repository;

  @override
  final AppLogger logger;

  @override
  bool get isLoaded => state.designsById.isNotEmpty;

  @override
  String get fetchErrorMessage => 'Failed to fetch designs';

  @override
  DesignsState withStatus(BlocStatus status) => state.copyWith(blocStatus: status);

  DesignsBloc(this._repository, {required this.logger}) : super(const DesignsState()) {
    on<DesignsEvent>(_onFetchDesigns);
  }

  Future<void> _onFetchDesigns(DesignsEvent event, Emitter<DesignsState> emit) async {
    switch (event) {
      case FetchDesigns():
        await runFetch(emit, () async {
          final data = await _repository.getData();
          return DesignsState(
            designsById: data.designsById,
            imageFileNamesByDesignId: data.imageFileNamesByDesignId,
            piecesByDesignId: data.piecesByDesignId,
            blocStatus: const BlocStatus.ok(),
          );
        });
    }
  }
}
