import 'package:flutter/material.dart';
import 'package:madmudmobile/services/router/route_enum.dart';
import 'package:madmudmobile/utils/current_page_from_settings.dart';
import 'package:madmudmobile/widgets/drawer/drawer_header_item.dart';
import 'package:madmudmobile/widgets/drawer/drawer_route_item.dart';
import 'package:madmudmobile/widgets/drawer/drawer_route_extension.dart';

const double iconAndTrademarkContainerWidth = 60.0;

class DrawerForAppBar extends StatelessWidget {
  const DrawerForAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final currentPage = currentPageFromSettings(context);

    return Drawer(
      shape: const ContinuousRectangleBorder(),
      child: Container(
        color: colors.surface,
        child: ListView(
          children: [
            const DrawerHeaderItem(width: iconAndTrademarkContainerWidth),
            ...RouteEnum.values.map(
              (route) => DrawerRouteItem(
                routeLabel: route.pageName(),
                iconData: route.iconData,
                path: route.path(),
                isCurrentRoute: route.pageName() == currentPage,
                width: iconAndTrademarkContainerWidth,
              ),
            ),
          ].toList(),
        ),
      ),
    );
  }
}
