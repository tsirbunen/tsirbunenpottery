import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tsirbunenpottery/core/state/fetch_state.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';

part 'designs_state.freezed.dart';

@freezed
abstract class DesignsState with _$DesignsState implements FetchState {
  const DesignsState._();

  const factory DesignsState({
    @Default(BlocStatus(Status.ok)) BlocStatus blocStatus,
    @Default({}) Map<String, Design> designsById,
    @Default({}) Map<String, List<String>> imageFileNamesByDesignId,
    @Default({}) Map<String, List<Piece>> piecesByDesignId,
  }) = _DesignsState;

  List<Design> get designs => designsById.values.toList();

  List<Piece> get representativePieces => designs
      .map((d) => piecesByDesignId[d.id]?.firstOrNull)
      .whereType<Piece>()
      .toList();
}
