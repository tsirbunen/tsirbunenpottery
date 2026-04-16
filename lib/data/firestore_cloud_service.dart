import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:tsirbunenpottery/data/cloud_service.dart';

class FirestoreCloudService implements CloudService {
  final FirebaseFirestore _firestore;

  FirestoreCloudService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Map<String, dynamic>?> fetchOne({
    required String collection,
    required String documentId,
  }) async {
    try {
      final doc =
          await _firestore.collection(collection).doc(documentId).get();
      if (!doc.exists) return null;
      return {'id': doc.id, ...doc.data()!};
    } on FirebaseException catch (e) {
      debugPrint(
        'FirestoreCloudService.fetchOne failed [$collection/$documentId]: '
        '${e.code} — ${e.message}',
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
      return snapshot.docs
          .map((doc) => {'id': doc.id, ...doc.data()})
          .toList();
    } on FirebaseException catch (e) {
      debugPrint(
        'FirestoreCloudService.fetchMany failed [$collection]: '
        '${e.code} — ${e.message}',
      );
      rethrow;
    }
  }
}
