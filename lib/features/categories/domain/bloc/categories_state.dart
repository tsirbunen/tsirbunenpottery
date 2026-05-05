import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tsirbunenpottery/core/state/bloc_utils/fetch_state.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/categories/domain/models/category/category.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';

part 'categories_state.freezed.dart';

@freezed
abstract class CategoriesState with _$CategoriesState implements FetchState {
  const factory CategoriesState({
    @Default(BlocStatus.ok()) BlocStatus blocStatus,
    @Default({}) Map<String, Design> designsById,
    @Default({}) Map<String, Map<String, List<String>>> categoryDesigns,
    @Default({}) Map<String, List<String>> imageFileNamesByDesignId,
    @Default({}) Map<String, Category> categoriesById,
    @Default([]) List<Piece> allPieces,
  }) = _CategoriesState;
}
