import 'package:tsirbunenpottery/bootstrap/service_locator/service_locator.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/data/cloud_service.dart';

/// Stub that returns empty data — no network calls, no Firebase needed.
class _StubCloudService implements CloudService {
  @override
  Future<Map<String, dynamic>?> fetchOne({
    required String collection,
    required String documentId,
  }) async =>
      null;

  @override
  Future<List<Map<String, dynamic>>> fetchMany({
    required String collection,
  }) async =>
      [];
}

void prepareBlocsForIntegrationTests() {
  if (getIt.isRegistered<LanguageBloc>()) return;
  prepareBlocs(cloudService: _StubCloudService());
}
