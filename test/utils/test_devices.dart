import 'package:flutter/material.dart';
import 'package:madmudmobile/widgets/horizontal_navigation/horizontal_navigation.dart';

const testDevices = <String, Size>{
  'MOBILE': Size(350, 600),
  // FIXME: For some reason, in test environment the min width that works
  // when running the app does not work so we need to add extra width
  // to prevent overflow in tests. How to fix this?
  'DESKTOP': Size(minWidthForShowNavBarRoutes + 50, 1200),
};
