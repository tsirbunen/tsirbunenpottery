import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tsirbunenpottery/core/state/bloc_utils/fetch_state.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';

part 'designs_state.freezed.dart';

@freezed
abstract class DesignsState with _$DesignsState implements FetchState {
  const factory DesignsState({
    @Default(BlocStatus.ok()) BlocStatus blocStatus,
    @Default({}) Map<String, List<String>> imageFileNamesByDesignId,
    @Default([]) List<Design> designs,
    @Default([]) List<Piece> representativePieces,
  }) = _DesignsState;
}
