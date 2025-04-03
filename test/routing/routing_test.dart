import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/features/collections/presentation/collections_page.dart';
import 'package:madmudmobile/features/home/presentation/home_page.dart';
import 'package:madmudmobile/features/pieces/presentation/pieces_page.dart';
import 'package:madmudmobile/widgets/horizontal_navigation/horizontal_navigation.dart';
import 'utils.dart';

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
const devices = <String, Size>{
  'MOBILE': Size(350, 600),
  'DESKTOP': Size(1000, 1200),
};

void main() {
  group('ROUTING >', () {
    group('DRAWER -', () {
      devices.forEach((String description, Size size) {
        testWidgets('drawer can be opened in $description',
            (WidgetTester tester) async {
          setViewSizeAndAddTeardown(tester, size);
          await pumpMadMudApp(tester);

          expect(find.byType(Drawer), findsNothing);
          await openDrawer(tester);
          expect(find.byType(Drawer), findsOneWidget);
        });

        testWidgets('routes can be navigated to and from in $description',
            (WidgetTester tester) async {
          setViewSizeAndAddTeardown(tester, size);
          await pumpMadMudApp(tester);

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

    group('NAV BAR -', () {
      devices.forEach((String description, Size size) {
        testWidgets(
            'horizontal navigation is${description == 'DESKTOP' ? "" : " not"} visible in $description',
            (WidgetTester tester) async {
          setViewSizeAndAddTeardown(tester, size);
          await pumpMadMudApp(tester);

          if (description == 'DESKTOP') {
            expect(find.byType(HorizontalNavigation), findsOneWidget);
          } else {
            expect(find.byType(TextButton), findsNothing);
          }
        });
      });

      testWidgets('routes can be navigated to and from in DESKTOP',
          (WidgetTester tester) async {
        setViewSizeAndAddTeardown(tester, devices['DESKTOP']!);
        await pumpMadMudApp(tester);

        for (int i = 0; i < routeOrder.length - 1; i++) {
          final routeTo = routeOrder[i + 1];
          final page = routeToPage[routeTo]!;
          await clickNavBarRoute(tester, routeTo);
          expect(find.byType(page), findsOneWidget);
        }
      });
    });
  });
}
