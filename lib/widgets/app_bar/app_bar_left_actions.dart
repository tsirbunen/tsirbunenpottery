import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madmudmobile/widgets/action_button/action_button.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class AppBarLeftActions extends StatefulWidget {
  const AppBarLeftActions({super.key});

  @override
  AppBarLeftActionsState createState() => AppBarLeftActionsState();
}

class AppBarLeftActionsState extends State<AppBarLeftActions> {
  late String currentLocation;
  late GoRouterDelegate routerDelegate;

  @override
  Widget build(BuildContext context) {
    final fromRoute = _fromPage(context);
    final showBackArrowInsteadOfMenu = _routeHasId(context);

    if (showBackArrowInsteadOfMenu) {
      return ActionButton(
          onPressed: () => _goBack(context, fromRoute),
          iconData: Symbols.arrow_back);
    }

    return ActionButton(
        onPressed: () => _openDrawer(context), iconData: Symbols.menu);
  }

  String _fromPage(BuildContext context) {
    final uri = (Router.of(context).routerDelegate.currentConfiguration
            as RouteMatchList?)
        ?.uri;
    final routeFrom = uri?.queryParameters['fromRoute'];
    return routeFrom ?? 'home';
  }

  _routeHasId(BuildContext context) {
    final fullPath =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    return Uri.parse(fullPath).toString().contains(':id');
  }

  void _goBack(BuildContext context, fromRoute) {
    final router = GoRouter.of(context);
    if (router.canPop()) {
      router.pop();
    } else {
      router.go(fromRoute);
    }
  }

  void _openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
