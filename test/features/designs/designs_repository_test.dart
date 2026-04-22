import 'package:flutter_test/flutter_test.dart';
import 'package:tsirbunenpottery/core/logging/noop_app_logger.dart';
import 'package:tsirbunenpottery/data/firestore_data_parser.dart';
import 'package:tsirbunenpottery/data/products_repository.dart';
import 'package:tsirbunenpottery/features/designs/repository/designs_repository.dart';

import '../../utils/mock_cloud_service_helpers.dart';

void main() {
  group('Feature Designs >', () {
    group('DesignsRepository -', () {
      late DesignsRepository repository;

      setUp(() {
        repository = DesignsRepository(
          ProductsRepository(mockCloudServiceWithData(), const FirestoreDataParser(logger: NoOpAppLogger()), logger: const NoOpAppLogger()),
        );
      });

      test('designsById contains all 3 designs', () async {
        final data = await repository.getData();
        expect(data.designsById, hasLength(3));
      });

      test('piecesByDesignId groups pieces correctly', () async {
        final data = await repository.getData();
        expect(data.piecesByDesignId['design-1'], hasLength(1));
        expect(data.piecesByDesignId['design-2'], hasLength(2));
        expect(data.piecesByDesignId['design-3'], hasLength(3));
      });

      test('imageFileNamesByDesignId accumulates images across pieces', () async {
        final data = await repository.getData();
        // design-3 (Salt & Foam) spans 3 pieces × 2 images = 6
        expect(data.imageFileNamesByDesignId['design-3'], hasLength(6));
        expect(data.imageFileNamesByDesignId['design-3'], containsAll([
          'salt_and_foam_1.jpg',
          'salt_and_foam_6.jpg',
        ]));
      });

      test('design-1 has a single piece with correct id', () async {
        final data = await repository.getData();
        expect(data.piecesByDesignId['design-1']?.first.id, 'pcs-1');
      });
    });
  });
}
