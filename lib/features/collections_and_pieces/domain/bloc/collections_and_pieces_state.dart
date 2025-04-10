import 'package:equatable/equatable.dart';
import 'package:madmudmobile/app/blocs/bloc_status.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/models/piece/piece.dart';

class CollectionsAndPiecesState extends Equatable {
  final BlocStatus blocStatus;
  final List<Piece> pieces;

  const CollectionsAndPiecesState({
    this.blocStatus = const BlocStatus(Status.ok),
    this.pieces = const [],
  });

  CollectionsAndPiecesState copyWith({
    BlocStatus? newStatus,
    List<Piece>? newPieces,
  }) {
    return CollectionsAndPiecesState(
      blocStatus: newStatus ?? blocStatus,
      pieces: newPieces ?? pieces,
    );
  }

  @override
  List<Object?> get props => [
        blocStatus,
        pieces,
      ];
}
