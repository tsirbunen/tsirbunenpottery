import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tsirbunenpottery/core/logging/noop_app_logger.dart';
import 'package:tsirbunenpottery/core/retry/retry_backoff.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/contact/domain/bloc/contact_bloc.dart';
import 'package:tsirbunenpottery/features/contact/domain/bloc/contact_event.dart';
import 'package:tsirbunenpottery/features/contact/domain/bloc/contact_state.dart';
import 'package:tsirbunenpottery/features/contact/repository/contact_repository.dart';

import '../../utils/mock_cloud_service_helpers.dart';

ContactBloc _makeBlocWithData() => ContactBloc(
      ContactRepository(mockCloudServiceWithHomeImageData()),
      logger: const NoOpAppLogger(),
      backoff: RetryBackoff(),
    );

ContactBloc _makeBlocFailing() => ContactBloc(
      ContactRepository(mockCloudServiceFailing()),
      logger: const NoOpAppLogger(),
      backoff: RetryBackoff(),
    );

void main() {
  group('Feature Contact >', () {
    group('ContactBloc -', () {
      test('initial state is ok status with null owner photo', () {
        final bloc = _makeBlocWithData();
        expect(bloc.state.blocStatus.status, Status.ok);
        expect(bloc.state.ownerPhotoFileName, isNull);
        bloc.close();
      });

      blocTest<ContactBloc, ContactState>(
        'FetchOwnerPhoto transitions: loading → ok with file name',
        build: _makeBlocWithData,
        act: (bloc) => bloc.add(FetchOwnerPhoto()),
        expect: () => [
          predicate<ContactState>(
            (s) => s.blocStatus.status == Status.loading,
            'loading state',
          ),
          predicate<ContactState>(
            (s) =>
                s.blocStatus.status == Status.ok &&
                s.ownerPhotoFileName == 'hero_image.jpg',
            'ok state with file name',
          ),
        ],
      );

      blocTest<ContactBloc, ContactState>(
        'FetchOwnerPhoto emits error status on cloud failure',
        build: _makeBlocFailing,
        act: (bloc) => bloc.add(FetchOwnerPhoto()),
        expect: () => [
          predicate<ContactState>((s) => s.blocStatus.status == Status.loading),
          predicate<ContactState>((s) => s.blocStatus.status == Status.error),
        ],
      );

      blocTest<ContactBloc, ContactState>(
        'FetchOwnerPhoto is a no-op once data is loaded',
        build: _makeBlocWithData,
        act: (bloc) {
          bloc.add(FetchOwnerPhoto());
          bloc.add(FetchOwnerPhoto());
        },
        expect: () => [
          predicate<ContactState>((s) => s.blocStatus.status == Status.loading),
          predicate<ContactState>(
            (s) => s.blocStatus.status == Status.ok && s.ownerPhotoFileName != null,
          ),
        ],
      );
    });
  });
}
