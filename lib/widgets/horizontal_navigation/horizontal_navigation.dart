import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madmudmobile/services/router/route_enum.dart';
import 'package:madmudmobile/widgets/drawer/drawer_route_extension.dart';

const EdgeInsets margin = EdgeInsets.only(left: 50.0);
const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 10.0);
const double borderRadius = 5.0;

class HorizontalNavigation extends StatelessWidget {
  const HorizontalNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headlineSmall!;

    return Container(
      margin: margin,
      child: Row(
        children: [
          ...RouteEnum.values.map(
            (route) {
              return Container(
                padding: padding,
                decoration: _decoration,
                child: TextButton(
                  onPressed: () => _navigateTo(context, route.path()),
                  child: Text(route.label, style: textStyle),
                ),
              );
            },
          ),
        ].toList(),
      ),
    );
  }

  void _navigateTo(BuildContext context, path) {
    context.go(path);
  }

  BoxDecoration get _decoration =>
      BoxDecoration(borderRadius: BorderRadius.circular(borderRadius));
}
