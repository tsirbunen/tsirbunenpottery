import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tsirbunenpottery/core/state/bloc_utils/fetch_state.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';

part 'pieces_state.freezed.dart';

@freezed
abstract class PiecesState with _$PiecesState implements FetchState {
  const PiecesState._();

  const factory PiecesState({
    @Default(BlocStatus(Status.ok)) BlocStatus blocStatus,
    @Default({}) Map<String, Piece> piecesById,
    @Default({}) Map<String, Design> designsById,
    @Default({}) Map<String, List<String>> imageFileNamesByDesignId,
    @Default({}) Map<String, List<String>> pieceIdsByDesignId,
  }) = _PiecesState;

  List<Design> get allDesigns => designsById.values.toList();

  List<Piece> get allPieces => piecesById.values.toList();
}
