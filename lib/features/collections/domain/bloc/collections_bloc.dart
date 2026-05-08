import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/retry/retry_backoff.dart';
import 'package:tsirbunenpottery/core/state/bloc_utils/fetch_bloc_mixin.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/collections_event.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/collections_state.dart';
import 'package:tsirbunenpottery/features/collections/repository/collections_repository.dart';

class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState>
    with FetchBlocMixin<CollectionsEvent, CollectionsState> {
  final ICollectionsRepository _repository;

  @override
  final AppLogger logger;

  @override
  final RetryBackoff backoff;

  @override
  String get fetchErrorMessage => 'Failed to fetch collections';

  @override
  CollectionsState withStatus(BlocStatus status) => state.copyWith(blocStatus: status);

  CollectionsBloc(this._repository, {required this.logger, required this.backoff}) : super(const CollectionsState()) {
    on<CollectionsEvent>(_onFetchCollections);
  }

  Future<void> _onFetchCollections(CollectionsEvent event, Emitter<CollectionsState> emit) async {
    switch (event) {
      case FetchCollections():
        await runFetch(emit, () async {
          final data = await _repository.getData();
          return CollectionsState(
            designsById: data.designsById,
            collectionDesigns: data.collectionDesigns,
            imageFileNamesByDesignId: data.imageFileNamesByDesignId,
            collectionsById: {for (final c in data.collections) c.id: c},
            piecesById: data.piecesById,
            blocStatus: const BlocStatus.ok(),
          );
        });
    }
  }
}
