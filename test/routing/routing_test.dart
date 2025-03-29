import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/features/collections/presentation/collections_page.dart';
import 'package:madmudmobile/features/home/presentation/home_page.dart';
import 'package:madmudmobile/features/pieces/presentation/pieces_page.dart';
import 'utils.dart';

void main() {
  group('DRAWER ROUTING -', () {
    final devices = <String, Size>{
      'MOBILE': const Size(350, 600),
      'DESKTOP': const Size(1000, 1200),
    };

    devices.forEach((String description, Size size) {
      testWidgets('drawer can be opened in $description',
          (WidgetTester tester) async {
        setViewSizeAndAddTeardown(tester, size);
        await pumpMadMudApp(tester);

        expect(find.byType(Drawer), findsNothing);
        await openDrawer(tester);
        expect(find.byType(Drawer), findsOneWidget);
      });

      testWidgets('navigate between routes in $description',
          (WidgetTester tester) async {
        setViewSizeAndAddTeardown(tester, size);
        await pumpMadMudApp(tester);

        final routeToPage = {
          'Home': HomePage,
          'Pieces': PiecesPage,
          'Collections': CollectionsPage,
        };

        final routeOrder = [
          'Home',
          'Pieces',
          'Collections',
          'Home',
          'Collections',
          'Pieces',
          'Home'
        ];

        for (int i = 0; i < routeOrder.length - 1; i++) {
          final routeTo = routeOrder[i + 1];
          final page = routeToPage[routeTo]!;
          await openDrawer(tester);
          await clickDrawerRoute(tester, routeTo);
          expect(find.byType(page), findsOneWidget);
        }
      });
    });
  });
}
