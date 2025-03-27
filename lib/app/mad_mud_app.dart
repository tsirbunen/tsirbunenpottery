import 'package:flutter/material.dart';
import 'package:madmudmobile/services/router/route_controller.dart';

class MadMudApp extends StatelessWidget {
  const MadMudApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerConfig = RouteController().buildRouter();

    return MaterialApp.router(
      routerConfig: routerConfig,
    );
  }
}
