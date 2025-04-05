import 'package:flutter/material.dart';
import 'package:madmudmobile/app/router/route_enum.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

extension DrawerRouteExtension on RouteEnum {
  IconData get iconData => {
        RouteEnum.home: Symbols.home,
        RouteEnum.pieces: Symbols.local_cafe_rounded,
        RouteEnum.collections: Symbols.category_rounded,
        RouteEnum.contact: Symbols.contact_page_rounded,
        RouteEnum.story: Symbols.info_rounded,
      }[this]!;
}
