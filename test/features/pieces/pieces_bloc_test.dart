import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tsirbunenpottery/core/logging/noop_app_logger.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/data/products_repository.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/pieces_bloc.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/pieces_event.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/pieces_state.dart';
import 'package:tsirbunenpottery/features/pieces/repository/pieces_repository.dart';

import '../../utils/mock_cloud_service_helpers.dart';

PiecesBloc _makeBlocWithData() => PiecesBloc(
    PiecesRepository(ProductsRepository(mockCloudServiceWithData(), logger: const NoOpAppLogger())));

PiecesBloc _makeBlocFailing() => PiecesBloc(
    PiecesRepository(ProductsRepository(mockCloudServiceFailing(), logger: const NoOpAppLogger())));

void main() {
  group('Feature Pieces >', () {
    group('PiecesBloc -', () {
      test('initial state is ok status with empty data', () {
        final bloc = _makeBlocWithData();
        expect(bloc.state.blocStatus.status, Status.ok);
        expect(bloc.state.piecesById, isEmpty);
        expect(bloc.state.designsById, isEmpty);
        bloc.close();
      });

      blocTest<PiecesBloc, PiecesState>(
        'FetchPieces transitions: loading → ok with 6 pieces and 3 designs',
        build: _makeBlocWithData,
        act: (bloc) => bloc.add(FetchPieces()),
        expect: () => [
          predicate<PiecesState>(
            (s) => s.blocStatus.status == Status.loading,
            'loading state',
          ),
          predicate<PiecesState>(
            (s) =>
                s.blocStatus.status == Status.ok &&
                s.piecesById.length == 6 &&
                s.designsById.length == 3 &&
                s.pieceIdsByDesignId['design-3']?.length == 3,
            'ok state with data',
          ),
        ],
      );

      blocTest<PiecesBloc, PiecesState>(
        'FetchPieces emits error status on cloud failure',
        build: _makeBlocFailing,
        act: (bloc) => bloc.add(FetchPieces()),
        expect: () => [
          predicate<PiecesState>((s) => s.blocStatus.status == Status.loading),
          predicate<PiecesState>((s) => s.blocStatus.status == Status.error),
        ],
      );

      blocTest<PiecesBloc, PiecesState>(
        'FetchPieces is a no-op once data is loaded',
        build: _makeBlocWithData,
        act: (bloc) async {
          bloc.add(FetchPieces());
          await Future<void>.delayed(Duration.zero);
          bloc.add(FetchPieces());
        },
        expect: () => [
          predicate<PiecesState>((s) => s.blocStatus.status == Status.loading),
          predicate<PiecesState>(
              (s) => s.blocStatus.status == Status.ok && s.piecesById.length == 6),
        ],
      );
    });
  });
}
