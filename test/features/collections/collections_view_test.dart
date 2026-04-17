import 'package:flutter_test/flutter_test.dart';

import '../../routing/routing_utils.dart';
import '../../utils/barrel.dart';

void main() {
  group('Feature Collections >', () {
    group('CollectionsView -', () {
      setUpAndTearDownAllBlocsAndPreventNetworkImages();

      testWidgets('shows names for collections that have pieces',
          (tester) async {
        setViewSizeAndAddTeardown(tester, testDevices['DESKTOP']!);
        await pumpApp(tester);
        await clickNavBarRoute(tester, 'Collections');

        expect(find.text('White on White'), findsOneWidget);
        expect(find.text('Yellow Cottage'), findsOneWidget);
      });

      testWidgets('does not show a collection that has no pieces',
          (tester) async {
        setViewSizeAndAddTeardown(tester, testDevices['DESKTOP']!);
        await pumpApp(tester);
        await clickNavBarRoute(tester, 'Collections');

        expect(find.text('Empty Collection'), findsNothing);
      });
    });
  });
}
