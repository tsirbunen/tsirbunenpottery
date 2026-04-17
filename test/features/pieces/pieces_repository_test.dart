import 'package:flutter_test/flutter_test.dart';
import 'package:tsirbunenpottery/core/logging/noop_app_logger.dart';
import 'package:tsirbunenpottery/data/products_repository.dart';
import 'package:tsirbunenpottery/features/pieces/repository/pieces_repository.dart';

import '../../utils/mock_cloud_service_helpers.dart';

void main() {
  group('Feature Pieces >', () {
    group('PiecesRepository -', () {
      late PiecesRepository repository;

      setUp(() {
        repository = PiecesRepository(
          ProductsRepository(mockCloudServiceWithData(), logger: const NoOpAppLogger()),
        );
      });

      test('piecesById contains all 6 pieces', () async {
        final data = await repository.getData();
        expect(data.piecesById, hasLength(6));
      });

      test('designsById contains all 3 designs', () async {
        final data = await repository.getData();
        expect(data.designsById, hasLength(3));
      });

      test('imageFileNamesByDesignId accumulates images across pieces', () async {
        final data = await repository.getData();
        // design-2 (Soft Linen) spans 2 pieces × 2 images = 4
        expect(data.imageFileNamesByDesignId['design-2'], hasLength(4));
        expect(data.imageFileNamesByDesignId['design-2'], containsAll([
          'soft_linen_1.jpg',
          'soft_linen_2.jpg',
          'soft_linen_3.jpg',
          'soft_linen_4.jpg',
        ]));
      });

      test('pieceIdsByDesignId groups pieces by design', () async {
        final data = await repository.getData();
        expect(data.pieceIdsByDesignId['design-1'], hasLength(1));
        expect(data.pieceIdsByDesignId['design-1'], contains('pcs-1'));
        expect(data.pieceIdsByDesignId['design-2'], hasLength(2));
        expect(data.pieceIdsByDesignId['design-3'], hasLength(3));
        expect(data.pieceIdsByDesignId['design-3'],
            containsAll(['pcs-4', 'pcs-5', 'pcs-6']));
      });
    });
  });
}
