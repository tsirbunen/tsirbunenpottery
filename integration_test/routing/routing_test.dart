import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tsirbunenpottery/bootstrap/app/app.dart';
import 'package:tsirbunenpottery/bootstrap/service_locator/service_locator.dart';
import 'package:tsirbunenpottery/features/home/presentation/pages/home_page.dart';
import 'package:tsirbunenpottery/features/pieces/presentation/pages/pieces_page.dart';
import '../utils/integration_test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('ROUTING -', () {
    setUpAll(() {
      prepareBlocsForIntegrationTests();
    });

    tearDownAll(() {
      getIt.reset();
    });

    testWidgets('app boots and renders home page', (tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('can navigate from home to pieces and back', (tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      // Open drawer and tap Pieces
      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Pieces'));
      await tester.pumpAndSettle();

      expect(find.byType(PiecesPage), findsOneWidget);

      // Navigate back to home via drawer
      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
