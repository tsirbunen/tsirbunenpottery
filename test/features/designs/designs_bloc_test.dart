import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tsirbunenpottery/core/logging/noop_app_logger.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/data/products_repository.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/designs_bloc.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/designs_event.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/designs_state.dart';
import 'package:tsirbunenpottery/features/designs/repository/designs_repository.dart';

import '../../utils/mock_cloud_service_helpers.dart';

DesignsBloc _makeBlocWithData() => DesignsBloc(
    DesignsRepository(ProductsRepository(mockCloudServiceWithData(), logger: const NoOpAppLogger())));

DesignsBloc _makeBlocFailing() => DesignsBloc(
    DesignsRepository(ProductsRepository(mockCloudServiceFailing(), logger: const NoOpAppLogger())));

void main() {
  group('Feature Designs >', () {
    group('DesignsBloc -', () {
      test('initial state is ok status with empty data', () {
        final bloc = _makeBlocWithData();
        expect(bloc.state.blocStatus.status, Status.ok);
        expect(bloc.state.designsById, isEmpty);
        expect(bloc.state.piecesByDesignId, isEmpty);
        bloc.close();
      });

      blocTest<DesignsBloc, DesignsState>(
        'FetchDesigns transitions: loading → ok with 3 designs',
        build: _makeBlocWithData,
        act: (bloc) => bloc.add(FetchDesigns()),
        expect: () => [
          predicate<DesignsState>(
            (s) => s.blocStatus.status == Status.loading,
            'loading state',
          ),
          predicate<DesignsState>(
            (s) =>
                s.blocStatus.status == Status.ok &&
                s.designsById.length == 3 &&
                s.piecesByDesignId.length == 3,
            'ok state with data',
          ),
        ],
      );

      blocTest<DesignsBloc, DesignsState>(
        'FetchDesigns emits error status on cloud failure',
        build: _makeBlocFailing,
        act: (bloc) => bloc.add(FetchDesigns()),
        expect: () => [
          predicate<DesignsState>((s) => s.blocStatus.status == Status.loading),
          predicate<DesignsState>((s) => s.blocStatus.status == Status.error),
        ],
      );

      blocTest<DesignsBloc, DesignsState>(
        'FetchDesigns is a no-op once data is loaded',
        build: _makeBlocWithData,
        act: (bloc) async {
          bloc.add(FetchDesigns());
          await Future<void>.delayed(Duration.zero);
          bloc.add(FetchDesigns());
        },
        expect: () => [
          predicate<DesignsState>((s) => s.blocStatus.status == Status.loading),
          predicate<DesignsState>(
              (s) => s.blocStatus.status == Status.ok && s.designsById.length == 3),
        ],
      );
    });
  });
}
