import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/home_bloc.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/home_event.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/home_state.dart';
import 'package:tsirbunenpottery/features/home/repository/home_repository.dart';

import '../../utils/mock_cloud_service_helpers.dart';

HomeBloc _makeBlocWithData() =>
    HomeBloc(HomeRepository(mockCloudServiceWithHomeImageData()));

HomeBloc _makeBlocFailing() =>
    HomeBloc(HomeRepository(mockCloudServiceFailing()));

void main() {
  group('Feature Home >', () {
    group('HomeBloc -', () {
      test('initial state is ok status with null image file name', () {
        final bloc = _makeBlocWithData();
        expect(bloc.state.blocStatus.status, Status.ok);
        expect(bloc.state.homePageImageFileName, isNull);
        bloc.close();
      });

      blocTest<HomeBloc, HomeState>(
        'FetchHomePageImageFileName transitions: loading → ok with file name',
        build: _makeBlocWithData,
        act: (bloc) => bloc.add(FetchHomePageImageFileName()),
        expect: () => [
          predicate<HomeState>(
            (s) => s.blocStatus.status == Status.loading,
            'loading state',
          ),
          predicate<HomeState>(
            (s) =>
                s.blocStatus.status == Status.ok &&
                s.homePageImageFileName == 'hero_image.jpg',
            'ok state with file name',
          ),
        ],
      );

      blocTest<HomeBloc, HomeState>(
        'FetchHomePageImageFileName emits error status on cloud failure',
        build: _makeBlocFailing,
        act: (bloc) => bloc.add(FetchHomePageImageFileName()),
        expect: () => [
          predicate<HomeState>((s) => s.blocStatus.status == Status.loading),
          predicate<HomeState>((s) => s.blocStatus.status == Status.error),
        ],
      );

      blocTest<HomeBloc, HomeState>(
        'FetchHomePageImageFileName is a no-op once data is loaded',
        build: _makeBlocWithData,
        act: (bloc) async {
          bloc.add(FetchHomePageImageFileName());
          await Future<void>.delayed(Duration.zero);
          bloc.add(FetchHomePageImageFileName());
        },
        expect: () => [
          predicate<HomeState>((s) => s.blocStatus.status == Status.loading),
          predicate<HomeState>((s) =>
              s.blocStatus.status == Status.ok &&
              s.homePageImageFileName != null),
        ],
      );
    });
  });
}
