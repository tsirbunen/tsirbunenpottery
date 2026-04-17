import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/data/cloud_service.dart';

const _tag = 'FirestoreCloudService';

class FirestoreCloudService implements CloudService {
  final FirebaseFirestore _firestore;
  final AppLogger _logger;

  FirestoreCloudService({FirebaseFirestore? firestore, required AppLogger logger})
      : _firestore = firestore ?? FirebaseFirestore.instance,
        _logger = logger;

  @override
  Future<Map<String, dynamic>?> fetchOne({
    required String collection,
    required String documentId,
  }) async {
    try {
      final doc =
          await _firestore.collection(collection).doc(documentId).get();
      if (!doc.exists) {
        _logger.logInfo('fetchOne [$collection/$documentId]: not found', tag: _tag);
        return null;
      }
      _logger.logInfo('fetchOne [$collection/$documentId]: ok', tag: _tag);
      return {'id': doc.id, ...doc.data()!};
    } on FirebaseException catch (e) {
      _logger.logError(
        'fetchOne failed [$collection/$documentId]: ${e.code} — ${e.message}',
        error: e,
        tag: _tag,
      );
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchMany({
    required String collection,
  }) async {
    try {
      final snapshot = await _firestore.collection(collection).get();
      final docs = snapshot.docs
          .map((doc) => {'id': doc.id, ...doc.data()})
          .toList();
      _logger.logInfo('fetchMany [$collection]: ${docs.length} docs', tag: _tag);
      return docs;
    } on FirebaseException catch (e) {
      _logger.logError(
        'fetchMany failed [$collection]: ${e.code} — ${e.message}',
        error: e,
        tag: _tag,
      );
      rethrow;
    }
  }
}
