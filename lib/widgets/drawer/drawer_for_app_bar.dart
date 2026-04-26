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
    final currentPage = _currentPageName(context);

    return Drawer(
      shape: const ContinuousRectangleBorder(),
      child: Container(
        color: colors.surface,
        child: ListView(
          children: [
            const DrawerHeaderItem(width: AppDimensions.drawerIconContainerWidth),
            ...RouteEnum.values.map(
              (route) {
                final pageName = context.local(route.pageName());
                
                return DrawerRouteItem(
                  routeLabel: pageName,
                  iconData: route.iconData,
                  path: route.path(),
                  isCurrentRoute: pageName == currentPage,
                  width: AppDimensions.drawerIconContainerWidth,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

String _currentPageName(BuildContext context) {
  final routeSettings = ModalRoute.of(context)?.settings;
  if (routeSettings is NoTransitionPage) return routeSettings.name ?? '';
  return '';
}
