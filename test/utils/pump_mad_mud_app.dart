import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/app/mad_mud_app/mad_mud_app.dart';

pumpMadMudApp(WidgetTester tester) async {
  await tester.pumpWidget(const MadMudApp());
  await tester.pumpAndSettle();
}
