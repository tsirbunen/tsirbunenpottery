import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/app/mad_mud_app.dart';
import 'package:madmudmobile/widgets/drawer/drawer_route_item.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

setViewSizeAndAddTeardown(WidgetTester tester, Size size) {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;

  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
}

pumpMadMudApp(WidgetTester tester) async {
  await tester.pumpWidget(const MadMudApp());
  await tester.pumpAndSettle();
}

openDrawer(WidgetTester tester) async {
  final openDrawerButtonFinder = find.byIcon(Symbols.menu);
  await tester.tap(openDrawerButtonFinder);
  await tester.pumpAndSettle();
}

clickDrawerRoute(WidgetTester tester, String route) async {
  final routeFinders = find.text(route);
  // Note: routeFinders contain both the drawer items and the horizontal navBar items
  // so when testing the drawer we need to ignore the horizontal navBar items
  final targetFinder = find.descendant(
    of: find.byType(DrawerRouteItem),
    matching: routeFinders,
  );
  expect(targetFinder, findsOneWidget);
  await tester.tap(targetFinder);
  await tester.pumpAndSettle();
}

clickNavBarRoute(WidgetTester tester, String route) async {
  // Note: When the drawer is not open, only the horizontal navBar items are available
  final routeFinders = find.text(route);

  expect(routeFinders, findsOneWidget);
  await tester.tap(routeFinders);
  await tester.pumpAndSettle();
}
