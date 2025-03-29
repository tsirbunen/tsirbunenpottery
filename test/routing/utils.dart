import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/app/mad_mud_app.dart';
import 'package:madmudmobile/widgets/trademark/trademark.dart';

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
  final trademarkFinder = find.byType(Trademark);
  await tester.tap(trademarkFinder);
  await tester.pumpAndSettle();
}

clickDrawerRoute(WidgetTester tester, String route) async {
  final collectionsRouteFinder = find.text(route);
  expect(collectionsRouteFinder, findsOneWidget);
  await tester.tap(collectionsRouteFinder);
  await tester.pumpAndSettle();
}
