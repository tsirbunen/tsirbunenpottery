import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/app/mad_mud_app.dart';

void main() {
  group('MAD MUD APP -', () {
    testWidgets('launches successfully', (WidgetTester tester) async {
      await tester.pumpWidget(const MadMudApp());

      expect(find.byType(MadMudApp), findsOneWidget);
    });
  });
}
