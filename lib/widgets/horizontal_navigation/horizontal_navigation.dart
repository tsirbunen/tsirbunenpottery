import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madmudmobile/services/router/route_enum.dart';
import 'package:madmudmobile/widgets/trademark/trademark.dart';

const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 10.0);
const double borderRadius = 5.0;
const SizedBox spacer = SizedBox(width: 30);
const FontWeight selectedPageFontWeight = FontWeight.w800;

class HorizontalNavigation extends StatelessWidget {
  final bool isWide;
  final String currentPage;
  const HorizontalNavigation(
      {super.key, required this.isWide, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    final generalTextStyle = Theme.of(context).textTheme.headlineSmall!;
    final emphasizedTextStyle =
        generalTextStyle.copyWith(fontWeight: selectedPageFontWeight);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Trademark(
          isInverted: false,
          hasBorder: true,
        ),
        if (isWide) spacer,
        if (isWide)
          ...RouteEnum.values.map(
            (route) {
              final pageName = route.pageName();
              final routeIsCurrent = pageName == currentPage;
              final textStyle =
                  routeIsCurrent ? emphasizedTextStyle : generalTextStyle;
              return Container(
                padding: padding,
                decoration: _decoration,
                child: TextButton(
                  onPressed: () => _navigateTo(context, route.path()),
                  child: Text(pageName, style: textStyle),
                ),
              );
            },
          ),
      ].toList(),
    );
  }

  void _navigateTo(BuildContext context, path) {
    context.go(path);
  }

  BoxDecoration get _decoration =>
      BoxDecoration(borderRadius: BorderRadius.circular(borderRadius));
}
