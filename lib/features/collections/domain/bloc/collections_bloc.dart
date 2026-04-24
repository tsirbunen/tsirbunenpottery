import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/retry/retry_backoff.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/collections_event.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/collections_state.dart';
import 'package:tsirbunenpottery/features/collections/repository/collections_repository.dart';

class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState> {
  final CollectionsRepository _repository;
  final AppLogger _logger;
  final _backoff = RetryBackoff();

  CollectionsBloc(this._repository, {required AppLogger logger})
      : _logger = logger,
        super(const CollectionsState()) {
    on<CollectionsEvent>(_onEvent);
  }

  Future<void> _onEvent(
      CollectionsEvent event, Emitter<CollectionsState> emit) async {
    switch (event) {
      case FetchCollections():
        await _onFetch(emit);
    }
  }

  Future<void> _onFetch(Emitter<CollectionsState> emit) async {
    if (state.blocStatus.isLoading || state.collections.isNotEmpty) return;
    emit(state.copyWith(blocStatus: const BlocStatus(Status.loading)));
    await _backoff.wait();
    try {
      final data = await _repository.getData();
      _backoff.recordSuccess();
      emit(CollectionsState(
        collections: data.collections,
        designsById: data.designsById,
        piecesById: data.piecesById,
        collectionDesigns: data.collectionDesigns,
        imageFileNamesByDesignId: data.imageFileNamesByDesignId,
        blocStatus: const BlocStatus(Status.ok),
      ));
    } catch (e, s) {
      _backoff.recordFailure();
      _logger.logError('Failed to fetch collections', error: e, stackTrace: s, tag: 'CollectionsBloc');
      emit(state.copyWith(blocStatus: BlocStatus(Status.error, message: e.toString())));
    }
  }
}
