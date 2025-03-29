import 'package:flutter/material.dart';
import 'package:madmudmobile/services/router/route_enum.dart';
import 'package:madmudmobile/widgets/drawer/drawer_header_item.dart';
import 'package:madmudmobile/widgets/drawer/drawer_route_item.dart';
import 'package:madmudmobile/widgets/drawer/drawer_route_extension.dart';

class DrawerForAppBar extends StatelessWidget {
  const DrawerForAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Drawer(
      shape: const ContinuousRectangleBorder(),
      child: Container(
        color: colors.surface,
        child: ListView(
          children: [
            const DrawerHeaderItem(),
            ...RouteEnum.values.map(
              (route) => DrawerRouteItem(
                routeLabel: route.label,
                iconData: route.iconData,
                path: route.path(),
              ),
            ),
          ].toList(),
        ),
      ),
    );
  }
}
