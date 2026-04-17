import 'package:flutter_test/flutter_test.dart';
import 'package:tsirbunenpottery/features/home/presentation/pages/home_page.dart';

import '../../utils/barrel.dart';

void main() {
  group('Feature Home >', () {
    group('HomeView -', () {
      setUpAndTearDownAllBlocsAndPreventNetworkImages();

      testWidgets('home page renders without error', (tester) async {
        setViewSizeAndAddTeardown(tester, testDevices['DESKTOP']!);
        await pumpApp(tester);

        expect(find.byType(HomePage), findsOneWidget);
      });
    });
  });
}
