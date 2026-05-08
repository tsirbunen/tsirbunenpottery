import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tsirbunenpottery/core/state/bloc_utils/fetch_state.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/collections/domain/models/collection/collection.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';

part 'collections_state.freezed.dart';

@freezed
abstract class CollectionsState with _$CollectionsState implements FetchState {
  const factory CollectionsState({
    @Default(BlocStatus.ok()) BlocStatus blocStatus,
    @Default({}) Map<String, Design> designsById,
    @Default({}) Map<String, Map<String, List<String>>> collectionDesigns,
    @Default({}) Map<String, List<String>> imageFileNamesByDesignId,
    @Default({}) Map<String, Collection> collectionsById,
    @Default({}) Map<String, Piece> piecesById,
  }) = _CollectionsState;
}
