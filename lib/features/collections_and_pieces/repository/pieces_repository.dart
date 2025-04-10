import 'package:madmudmobile/features/collections_and_pieces/domain/models/piece/piece.dart';
import 'package:madmudmobile/features/collections_and_pieces/repository/dev_data.dart';

class PiecesRepository {
  PiecesRepository();

  Future<List<Piece>> fetchPieces() async {
    // Note: This is a temporary development implementation
    return pieces;
  }
}
