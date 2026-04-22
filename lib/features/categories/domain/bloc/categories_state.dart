import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/categories/domain/models/category/category.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';

part 'categories_state.freezed.dart';

@freezed
abstract class CategoriesState with _$CategoriesState {
  const CategoriesState._();

  const factory CategoriesState({
    @Default(BlocStatus(Status.ok)) BlocStatus blocStatus,
    @Default([]) List<Category> categories,
    @Default({}) Map<String, Design> designsById,
    @Default({}) Map<String, Piece> piecesById,
    @Default({}) Map<String, Map<String, List<String>>> categoryDesigns,
    @Default({}) Map<String, List<String>> imageFileNamesByDesignId,
  }) = _CategoriesState;

  Map<String, Category> get categoriesById =>
      {for (final c in categories) c.id: c};

  List<Piece> get allPieces => piecesById.values.toList();
}
