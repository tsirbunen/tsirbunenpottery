import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/features/collections_and_pieces/repository/pieces_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'test_pieces_data.dart';

@GenerateNiceMocks([MockSpec<PiecesRepository>()])
import 'pieces_repository_mock.mocks.dart';

PiecesRepository createTestPiecesRepository() {
  final PiecesRepository productsRepository = MockPiecesRepository();
  when(productsRepository.fetchPieces()).thenAnswer(
    (_) async => Future.value(testPieces),
  );

  return productsRepository;
}
