import 'package:flutter/material.dart';
import 'package:madmudmobile/services/router/route_controller.dart';
import 'package:madmudmobile/theme/app_theme.dart';

class MadMudApp extends StatelessWidget {
  const MadMudApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerConfig = RouteController().buildRouter();

    return MaterialApp.router(
      routerConfig: routerConfig,
      theme: const AppTheme().themeData,
    );
  }
}
