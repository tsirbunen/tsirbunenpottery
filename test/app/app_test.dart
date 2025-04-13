import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/app/mad_mud_app/mad_mud_app.dart';
import '../utils/prepare_blocs_for_tests.dart';

void main() {
  group('MAD MUD APP >', () {
    group('APP -', () {
      setUpAndTearDownAllBlocsAndPreventNetworkImages();
      testWidgets('app launches successfully', (WidgetTester tester) async {
        await tester.pumpWidget(const MadMudApp());

        expect(find.byType(MadMudApp), findsOneWidget);
      });
    });
  });
}
