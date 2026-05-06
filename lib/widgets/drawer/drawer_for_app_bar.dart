import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/bootstrap/router/route_enum.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/widgets/drawer/drawer_header_item.dart';
import 'package:tsirbunenpottery/widgets/drawer/drawer_route_item.dart';
import 'package:tsirbunenpottery/widgets/drawer/drawer_route_extension.dart';

class DrawerForAppBar extends StatelessWidget {
  const DrawerForAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final currentPath = GoRouterState.of(context).uri.path;

    return Drawer(
      shape: const ContinuousRectangleBorder(),
      child: Container(
        color: colors.surface,
        child: ListView(
          children: [
            const DrawerHeaderItem(width: AppDimensions.drawerIconContainerWidth),
            ...RouteEnum.values.map(
              (route) => DrawerRouteItem(
                routeLabel: context.local(route.pageName()),
                iconData: route.iconData,
                path: route.path(),
                isCurrentRoute: route.path() == currentPath,
                width: AppDimensions.drawerIconContainerWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
