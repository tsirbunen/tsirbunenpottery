import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tsirbunenpottery/core/logging/noop_app_logger.dart';
import 'package:tsirbunenpottery/core/retry/retry_backoff.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/data/firestore_data_parser.dart';
import 'package:tsirbunenpottery/data/products_repository.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/categories_bloc.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/categories_event.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/categories_state.dart';
import 'package:tsirbunenpottery/features/categories/repository/categories_repository.dart';

import '../../utils/mock_cloud_service_helpers.dart';

CategoriesBloc _makeBlocWithData() => CategoriesBloc(
    CategoriesRepository(ProductsRepository(mockCloudServiceWithData(), const FirestoreDataParser(logger: NoOpAppLogger()), logger: const NoOpAppLogger())),
    logger: const NoOpAppLogger(),
    backoff: RetryBackoff());

CategoriesBloc _makeBlocFailing() => CategoriesBloc(
    CategoriesRepository(ProductsRepository(mockCloudServiceFailing(), const FirestoreDataParser(logger: NoOpAppLogger()), logger: const NoOpAppLogger())),
    logger: const NoOpAppLogger(),
    backoff: RetryBackoff());

void main() {
  group('Feature Categories >', () {
    group('CategoriesBloc -', () {
      test('initial state is ok status with empty collections', () {
        final bloc = _makeBlocWithData();
        expect(bloc.state.blocStatus.status, Status.ok);
        expect(bloc.state.categoriesById, isEmpty);
        expect(bloc.state.categoryDesigns, isEmpty);
        bloc.close();
      });

      blocTest<CategoriesBloc, CategoriesState>(
        'FetchCategories transitions: loading → ok with 4 categories',
        build: _makeBlocWithData,
        act: (bloc) => bloc.add(FetchCategories()),
        expect: () => [
          predicate<CategoriesState>(
            (s) => s.blocStatus.status == Status.loading,
            'loading state',
          ),
          predicate<CategoriesState>(
            (s) =>
                s.blocStatus.status == Status.ok &&
                s.categoriesById.length == 4 &&
                s.categoryDesigns.containsKey('cat-1') &&
                !s.categoryDesigns.containsKey('cat-4'),
            'ok state with data — empty category excluded',
          ),
        ],
      );

      blocTest<CategoriesBloc, CategoriesState>(
        'FetchCategories emits error status on cloud failure',
        build: _makeBlocFailing,
        act: (bloc) => bloc.add(FetchCategories()),
        expect: () => [
          predicate<CategoriesState>(
            (s) => s.blocStatus.status == Status.loading,
            'loading state',
          ),
          predicate<CategoriesState>(
            (s) => s.blocStatus.status == Status.error,
            'error state',
          ),
        ],
      );
    });
  });
}
