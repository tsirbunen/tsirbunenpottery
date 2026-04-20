import 'package:equatable/equatable.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';

class DesignsState extends Equatable {
  final BlocStatus blocStatus;
  final Map<String, Design> designsById;

  // designId → list of image file names (across all pieces of that design)
  final Map<String, List<String>> imageFileNamesByDesignId;
  final Map<String, List<Piece>> piecesByDesignId;

  const DesignsState({
    this.blocStatus = const BlocStatus(Status.ok),
    this.designsById = const {},
    this.imageFileNamesByDesignId = const {},
    this.piecesByDesignId = const {},
  });

  List<Design> get designs => designsById.values.toList();

  List<Piece> get representativePieces => designs
      .map((d) => piecesByDesignId[d.id]?.firstOrNull)
      .whereType<Piece>()
      .toList();

  DesignsState copyWith({BlocStatus? blocStatus}) => DesignsState(
        blocStatus: blocStatus ?? this.blocStatus,
        designsById: designsById,
        imageFileNamesByDesignId: imageFileNamesByDesignId,
        piecesByDesignId: piecesByDesignId,
      );

  @override
  List<Object?> get props => [blocStatus, designsById, imageFileNamesByDesignId, piecesByDesignId];
}
