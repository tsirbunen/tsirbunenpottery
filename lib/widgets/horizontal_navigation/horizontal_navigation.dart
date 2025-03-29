import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madmudmobile/services/router/route_enum.dart';
import 'package:madmudmobile/widgets/drawer/drawer_route_extension.dart';

class HorizontalNavigation extends StatelessWidget {
  const HorizontalNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50.0),
      child: Row(
        children: [
          ...RouteEnum.values.map(
            (route) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () => _navigateTo(context, route.path()),
                  child: Text(route.label),
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
}
