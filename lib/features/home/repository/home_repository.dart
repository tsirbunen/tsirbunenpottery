import 'package:tsirbunenpottery/data/cloud_service.dart';
import 'package:tsirbunenpottery/utils/app_firestore_refs.dart';
import 'package:tsirbunenpottery/utils/app_image_refs.dart';

abstract interface class IHomeRepository {
  Future<String?> fetchHomePageImageFileName();
}

class HomeRepository implements IHomeRepository {
  final CloudService _cloudService;

  HomeRepository(this._cloudService);

  @override
  Future<String?> fetchHomePageImageFileName() async {
    final data = await _cloudService.fetchOne(
      collection: FirestoreCollections.miscellaneous,
      documentId: homePageImageDocId,
    );
    return data?['name'] as String?;
  }
}
