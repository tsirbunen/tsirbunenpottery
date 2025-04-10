import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/app/blocs/bloc_status.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/bloc/collections_and_pieces_state.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/models/piece/piece.dart';

class BlocStatusIs extends Matcher {
  final BlocStatus expectedBlocStatus;
  const BlocStatusIs(this.expectedBlocStatus);

  @override
  bool matches(Object? actualValue, Map matchState) {
    final state = actualValue as CollectionsAndPiecesState;
    final blocStatus = state.blocStatus;
    return blocStatus.status == expectedBlocStatus.status &&
        blocStatus.message == expectedBlocStatus.message;
  }

  @override
  Description describe(Description description) {
    return description
        .add('Matches the bloc status state and possible message');
  }
}

class BlocPiecesAndStatusMatch extends Matcher {
  final List<Piece> expectedPieces;
  final BlocStatus expectedBlocStatus;

  const BlocPiecesAndStatusMatch(this.expectedPieces, this.expectedBlocStatus);

  @override
  bool matches(Object? actualValue, Map matchState) {
    final state = actualValue as CollectionsAndPiecesState;
    final actualPieces = state.pieces;
    if (actualPieces.length != expectedPieces.length) return false;

    for (int i = 0; i < expectedPieces.length; i++) {
      final expected = expectedPieces[i];
      final actual = actualPieces[i];
      if (expected != actual) return false;
    }

    return BlocStatusIs(expectedBlocStatus).matches(state, matchState);
  }

  @override
  Description describe(Description description) {
    return description
        .add('Matches the bloc status state and possible message');
  }
}
