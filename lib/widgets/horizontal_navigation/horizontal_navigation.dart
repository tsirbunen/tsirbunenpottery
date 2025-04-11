import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/app/router/route_enum.dart';
import 'package:madmudmobile/utils/current_page_name_from_settings.dart';
import 'package:madmudmobile/widgets/trademark/trademark.dart';

const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 2.0);
const double borderRadius = 5.0;
const SizedBox spacer = SizedBox(width: 20.0);
const FontWeight selectedPageFontWeight = FontWeight.w800;
const double minWidthForShowNavBarRoutes = 800;
const double underlineHeight = 1.0;
const SizedBox underlineSpacer = SizedBox(height: 2.0);

class HorizontalNavigation extends StatelessWidget {
  const HorizontalNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final generalStyle = Theme.of(context).textTheme.headlineSmall!;
    final emphasizedStyle = generalStyle.copyWith(
      fontWeight: selectedPageFontWeight,
    );
    final currentPage = currentPageNameFromSettings(context);

    final isWide =
        MediaQuery.of(context).size.width > minWidthForShowNavBarRoutes;

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
              final pageName = context.local(route.pageName());
              final isCurrentRoute = pageName == currentPage;
              final textStyle = isCurrentRoute ? emphasizedStyle : generalStyle;
              final color = isCurrentRoute
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent;

              return Container(
                padding: padding,
                decoration: _decoration,
                child: IntrinsicWidth(
                  child: TextButton(
                    onPressed: () => _navigateTo(context, route.path()),
                    child: Column(
                      children: [
                        Text(pageName, style: textStyle),
                        underlineSpacer,
                        Container(
                          color: color,
                          height: underlineHeight,
                          width: double.infinity,
                        )
                      ],
                    ),
                  ),
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
