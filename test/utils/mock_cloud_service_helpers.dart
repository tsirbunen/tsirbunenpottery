import 'package:mockito/mockito.dart';
import 'package:tsirbunenpottery/utils/constants.dart';

import '../firebase/firebase_related_mocks.mocks.dart';
import 'test_data.dart';

/// Returns a [MockCloudService] pre-configured with realistic test data.
MockCloudService mockCloudServiceWithData() {
  final mock = MockCloudService();
  when(mock.fetchMany(collection: 'categories'))
      .thenAnswer((_) async => mockCategoryDocsData);
  when(mock.fetchMany(collection: 'collections'))
      .thenAnswer((_) async => mockCollectionDocsData);
  when(mock.fetchMany(collection: 'designs'))
      .thenAnswer((_) async => mockDesignDocsData);
  when(mock.fetchMany(collection: 'pieces'))
      .thenAnswer((_) async => mockPieceDocsData);
  return mock;
}

/// Returns a [MockCloudService] with product data and a stubbed home image.
MockCloudService mockCloudServiceWithHomeImageData({
  String fileName = 'hero_image.jpg',
}) {
  final mock = mockCloudServiceWithData();
  when(mock.fetchOne(
    collection: 'miscellaneous',
    documentId: homePageImageDocId,
  )).thenAnswer((_) async => {'name': fileName});
  return mock;
}

/// Returns a [MockCloudService] whose calls all reject with a network error.
MockCloudService mockCloudServiceFailing() {
  final mock = MockCloudService();
  when(mock.fetchMany(collection: anyNamed('collection')))
      .thenAnswer((_) => Future.error(Exception('Network failure')));
  when(mock.fetchOne(
    collection: anyNamed('collection'),
    documentId: anyNamed('documentId'),
  )).thenAnswer((_) => Future.error(Exception('Network failure')));
  return mock;
}
