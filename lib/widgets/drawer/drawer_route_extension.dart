import 'package:tsirbunenpottery/bootstrap/router/route_enum.dart';
import 'package:tsirbunenpottery/theme/app_icons.dart';
import 'package:flutter/material.dart';

extension DrawerRouteExtension on RouteEnum {
  IconData get iconData => switch (this) {
        RouteEnum.home => AppIcons.home,
        RouteEnum.pieces => AppIcons.pieces,
        RouteEnum.designs => AppIcons.designs,
        RouteEnum.categories => AppIcons.categories,
        RouteEnum.collections => AppIcons.collections,
        RouteEnum.contact => AppIcons.contact,
      };
}
