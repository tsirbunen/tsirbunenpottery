import 'package:tsirbunenpottery/data/cloud_service.dart';
import 'package:tsirbunenpottery/utils/app_image_refs.dart';

abstract interface class IContactRepository {
  Future<String?> fetchOwnerPhotoFileName();
}

class ContactRepository implements IContactRepository {
  final CloudService _cloudService;

  ContactRepository(this._cloudService);

  @override
  Future<String?> fetchOwnerPhotoFileName() async {
    final data = await _cloudService.fetchOne(
      collection: 'miscellaneous',
      documentId: ownerPhotoDocId,
    );
    return data?['name'] as String?;
  }
}
