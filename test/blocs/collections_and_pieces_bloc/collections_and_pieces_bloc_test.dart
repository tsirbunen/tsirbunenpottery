import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:madmudmobile/app/blocs/bloc_status.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/bloc/collections_and_pieces_bloc.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/bloc/collections_and_pieces_event.dart';
import 'package:madmudmobile/features/collections_and_pieces/repository/pieces_repository.dart';
import 'collections_and_pieces_bloc_matchers.dart';
import 'pieces_repository_mock.dart';
import 'test_pieces_data.dart';

const okStatus = BlocStatus(Status.ok);
const errorStatus = BlocStatus(Status.error, message: 'Some error');

void main() {
  group('COLLECTIONS AND PIECES BLOC -', () {
    test('Initial status is ok', () {
      final piecesRepository = PiecesRepository();
      final bloc = CollectionsAndPiecesBloc(piecesRepository);
      expect(bloc.state, const BlocStatusIs(okStatus));
    });

    blocTest(
      'Bloc status can be changed',
      build: () {
        final piecesRepository = PiecesRepository();
        final bloc = CollectionsAndPiecesBloc(piecesRepository);
        return bloc;
      },
      act: (bloc) => bloc..add(BlocStatusChanged(errorStatus)),
      expect: () => [
        const BlocStatusIs(errorStatus),
      ],
    );

    blocTest(
      'Fetched pieces are stored in bloc state',
      build: () {
        final piecesRepository = createTestPiecesRepository();
        final bloc = CollectionsAndPiecesBloc(piecesRepository);
        return bloc;
      },
      act: (bloc) => bloc..add(FetchPieces()),
      expect: () => [
        const BlocStatusIs(BlocStatus(Status.loading)),
        BlocPiecesAndStatusMatch(testPieces, okStatus),
      ],
    );
  });
}
