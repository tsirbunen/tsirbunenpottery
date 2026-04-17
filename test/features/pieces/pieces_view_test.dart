import 'package:flutter_test/flutter_test.dart';

import '../../routing/routing_utils.dart';
import '../../utils/barrel.dart';

void main() {
  group('Feature Pieces >', () {
    group('PiecesView -', () {
      setUpAndTearDownAllBlocsAndPreventNetworkImages();

      testWidgets('shows a card for each design after navigation',
          (tester) async {
        setViewSizeAndAddTeardown(tester, testDevices['DESKTOP']!);
        await pumpApp(tester);
        await clickNavBarRoute(tester, 'Pieces');

        expect(find.text('Waking Light'), findsOneWidget);
        expect(find.text('Soft Linen'), findsAtLeastNWidgets(1));
        expect(find.text('Salt & Foam'), findsAtLeastNWidgets(1));
      });
    });
  });
}
