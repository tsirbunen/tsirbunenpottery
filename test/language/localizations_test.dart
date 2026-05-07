import 'package:flutter_test/flutter_test.dart';
import 'package:tsirbunenpottery/localization/en.dart';
import 'package:tsirbunenpottery/localization/fi.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/localization/translations.dart';
import '../utils/barrel.dart';

void main() {
  group('Localizations >', () {
    setUpAndTearDownAllBlocsAndPreventNetworkImages();

    test('all keys return non-empty strings for every language', () {
      final languages = <Translations>[En(), Fi()];

      for (final lang in languages) {
        for (final key in Translation.values) {
          expect(
            lang.translate(key),
            isNotEmpty,
            reason: '${lang.runtimeType} has empty string for key "${key.name}"',
          );
        }
      }
    });
  });
}
