import 'package:flutter/material.dart';
import 'package:madmudmobile/app/router/route_enum.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

extension DrawerRouteExtension on RouteEnum {
  IconData get iconData => {
        RouteEnum.home: Symbols.home,
        RouteEnum.categories: Symbols.category_rounded,
        RouteEnum.collections: Symbols.hub_rounded,
        RouteEnum.designs: Symbols.local_cafe_rounded,
        RouteEnum.contact: Symbols.contact_page_rounded,
        RouteEnum.story: Symbols.history_edu_rounded,
      }[this]!;
}
