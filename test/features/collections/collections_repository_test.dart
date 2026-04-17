import 'package:flutter_test/flutter_test.dart';
import 'package:tsirbunenpottery/core/logging/noop_app_logger.dart';
import 'package:tsirbunenpottery/data/products_repository.dart';
import 'package:tsirbunenpottery/features/collections/repository/collections_repository.dart';

import '../../utils/mock_cloud_service_helpers.dart';

void main() {
  group('Feature Collections >', () {
    group('CollectionsRepository -', () {
      late CollectionsRepository repository;

      setUp(() {
        repository = CollectionsRepository(
          ProductsRepository(mockCloudServiceWithData(), logger: const NoOpAppLogger()),
        );
      });

      test('loads all 3 collections from the cloud', () async {
        final data = await repository.getData();
        expect(data.collections, hasLength(3));
      });

      test('piecesById contains all 6 pieces', () async {
        final data = await repository.getData();
        expect(data.piecesById, hasLength(6));
      });

      test('designsById contains all 3 designs', () async {
        final data = await repository.getData();
        expect(data.designsById, hasLength(3));
      });

      test('only collections with pieces appear in collectionDesigns', () async {
        final data = await repository.getData();
        expect(data.collectionDesigns.keys, containsAll(['coll-1', 'coll-2']));
        expect(data.collectionDesigns.containsKey('coll-3'), isFalse);
      });

      test('coll-1 maps to 2 designs', () async {
        final data = await repository.getData();
        expect(data.collectionDesigns['coll-1'], hasLength(2));
        expect(data.collectionDesigns['coll-1']?.keys,
            containsAll(['design-1', 'design-2']));
      });

      test('coll-2 has all 3 Salt & Foam pieces under design-3', () async {
        final data = await repository.getData();
        final pieceIds = data.collectionDesigns['coll-2']?['design-3'];
        expect(pieceIds, containsAll(['pcs-4', 'pcs-5', 'pcs-6']));
      });

      test('imageFileNamesByDesignId accumulates images across pieces', () async {
        final data = await repository.getData();
        // design-2 spans 2 pieces × 2 images = 4
        expect(data.imageFileNamesByDesignId['design-2'], hasLength(4));
        // design-3 spans 3 pieces × 2 images = 6
        expect(data.imageFileNamesByDesignId['design-3'], hasLength(6));
      });
    });
  });
}
