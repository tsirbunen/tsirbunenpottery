import 'package:tsirbunenpottery/data/cloud_service.dart';
import 'package:tsirbunenpottery/utils/app_image_refs.dart';

class ContactRepository {
  final CloudService _cloudService;

  ContactRepository(this._cloudService);

  Future<String?> fetchOwnerPhotoFileName() async {
    final data = await _cloudService.fetchOne(
      collection: 'miscellaneous',
      documentId: ownerPhotoDocId,
    );
    return data?['name'] as String?;
  }
}
