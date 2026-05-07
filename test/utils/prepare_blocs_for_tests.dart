import 'package:flutter_test/flutter_test.dart';
import 'package:tsirbunenpottery/bootstrap/environment/app_environment.dart';
import 'package:tsirbunenpottery/bootstrap/service_locator/service_locator.dart';
import 'package:tsirbunenpottery/core/logging/noop_app_logger.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_event.dart';
import 'package:tsirbunenpottery/localization/languages.dart';

import 'mock_cloud_service_helpers.dart';

void prepareBlocsForTests() {
  getIt.reset();
  prepareBlocs(
    cloudService: mockCloudServiceWithHomeImageData(),
    logger: const NoOpAppLogger(),
    environment: const Environment(noNetworkImages: true),
  );
  getIt<LanguageBloc>().add(ChangeLanguage(Language.en));
}

void setUpAndTearDownAllBlocsAndPreventNetworkImages() {
  setUp(() {
    prepareBlocsForTests();
  });

  tearDown(() {
    getIt.reset();
  });
}
