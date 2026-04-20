import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tsirbunenpottery/core/logging/noop_app_logger.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/data/products_repository.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/collections_bloc.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/collections_event.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/collections_state.dart';
import 'package:tsirbunenpottery/features/collections/repository/collections_repository.dart';

import '../../utils/mock_cloud_service_helpers.dart';

CollectionsBloc _makeBlocWithData() => CollectionsBloc(
    CollectionsRepository(ProductsRepository(mockCloudServiceWithData(), logger: const NoOpAppLogger())),
    logger: const NoOpAppLogger());

CollectionsBloc _makeBlocFailing() => CollectionsBloc(
    CollectionsRepository(ProductsRepository(mockCloudServiceFailing(), logger: const NoOpAppLogger())),
    logger: const NoOpAppLogger());

void main() {
  group('Feature Collections >', () {
    group('CollectionsBloc -', () {
      test('initial state is ok status with empty collections', () {
        final bloc = _makeBlocWithData();
        expect(bloc.state.blocStatus.status, Status.ok);
        expect(bloc.state.collections, isEmpty);
        expect(bloc.state.collectionDesigns, isEmpty);
        bloc.close();
      });

      blocTest<CollectionsBloc, CollectionsState>(
        'FetchCollections transitions: loading → ok with 3 collections',
        build: _makeBlocWithData,
        act: (bloc) => bloc.add(FetchCollections()),
        expect: () => [
          predicate<CollectionsState>(
            (s) => s.blocStatus.status == Status.loading,
            'loading state',
          ),
          predicate<CollectionsState>(
            (s) =>
                s.blocStatus.status == Status.ok &&
                s.collections.length == 3 &&
                s.collectionDesigns.containsKey('coll-1') &&
                !s.collectionDesigns.containsKey('coll-3'),
            'ok state — empty collection excluded from designs map',
          ),
        ],
      );

      blocTest<CollectionsBloc, CollectionsState>(
        'FetchCollections emits error status on cloud failure',
        build: _makeBlocFailing,
        act: (bloc) => bloc.add(FetchCollections()),
        expect: () => [
          predicate<CollectionsState>((s) => s.blocStatus.status == Status.loading),
          predicate<CollectionsState>((s) => s.blocStatus.status == Status.error),
        ],
      );

      blocTest<CollectionsBloc, CollectionsState>(
        'FetchCollections is a no-op once data is loaded',
        build: _makeBlocWithData,
        act: (bloc) async {
          bloc.add(FetchCollections());
          await Future<void>.delayed(Duration.zero);
          bloc.add(FetchCollections());
        },
        expect: () => [
          predicate<CollectionsState>((s) => s.blocStatus.status == Status.loading),
          predicate<CollectionsState>(
              (s) => s.blocStatus.status == Status.ok && s.collections.length == 3),
        ],
      );
    });
  });
}
