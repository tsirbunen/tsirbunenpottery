import 'package:flutter_test/flutter_test.dart';
import 'package:tsirbunenpottery/features/home/repository/home_repository.dart';

import '../../utils/mock_cloud_service_helpers.dart';

void main() {
  group('Feature Home >', () {
    group('HomeRepository -', () {
      test('returns the image file name from cloud data', () async {
        final repo =
            HomeRepository(mockCloudServiceWithHomeImageData(fileName: 'hero_image.jpg'));
        expect(await repo.fetchHomePageImageFileName(), 'hero_image.jpg');
      });

      test('returns null when cloud document is absent', () async {
        // nice mock: unstubbed fetchOne returns null
        final repo = HomeRepository(mockCloudServiceWithData());
        expect(await repo.fetchHomePageImageFileName(), isNull);
      });

      test('propagates cloud errors', () async {
        final repo = HomeRepository(mockCloudServiceFailing());
        expect(repo.fetchHomePageImageFileName(), throwsException);
      });
    });
  });
}
