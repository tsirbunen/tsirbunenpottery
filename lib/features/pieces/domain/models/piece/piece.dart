import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tsirbunenpottery/data/identifiable.dart';

part 'piece.freezed.dart';
part 'piece.g.dart';

@freezed
abstract class Piece with _$Piece implements Identifiable {
  const factory Piece({
    required String id,
    required String designId,
    required List<String> imageFileNames,
    required bool sold,
    String? collectionId,
  }) = _Piece;

  factory Piece.fromJson(Map<String, Object?> json) => _$PieceFromJson(json);
}
