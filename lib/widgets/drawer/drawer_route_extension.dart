import 'package:flutter/material.dart';
import 'package:madmudmobile/services/router/route_enum.dart';

extension DrawerRouteExtension on RouteEnum {
  IconData get iconData => {
        RouteEnum.home: Icons.home_outlined,
        RouteEnum.pieces: Icons.local_cafe_outlined,
        RouteEnum.collections: Icons.category_outlined,
      }[this]!;

  String get label => {
        RouteEnum.home: 'Home',
        RouteEnum.collections: 'Collections',
        RouteEnum.pieces: 'Pieces',
      }[this]!;
}
