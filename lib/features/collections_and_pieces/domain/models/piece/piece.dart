import 'package:freezed_annotation/freezed_annotation.dart';

part 'piece.freezed.dart';
part 'piece.g.dart';

@freezed
class Piece with _$Piece {
  const factory Piece({
    required String id,
    required int serialNumber,
    required String designId,
    String? collectionId,
  }) = _Piece;

  factory Piece.fromJson(Map<String, Object?> json) => _$PieceFromJson(json);
}
