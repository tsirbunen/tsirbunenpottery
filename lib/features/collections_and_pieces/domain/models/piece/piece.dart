import 'package:freezed_annotation/freezed_annotation.dart';
import '../design/design.dart';
import '../collection/collection.dart';

part 'piece.freezed.dart';
part 'piece.g.dart';

@freezed
class Piece with _$Piece {
  const factory Piece({
    required String uuid,
    required int serialNumber,
    required Design design,
    Collection? collection,
  }) = _Piece;

  factory Piece.fromJson(Map<String, Object?> json) => _$PieceFromJson(json);
}
