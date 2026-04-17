import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/bootstrap/router/route_enum.dart';
import 'package:tsirbunenpottery/widgets/company/trademark.dart';

const double spacerWidth = 20.0;
const SizedBox spacer = SizedBox(width: spacerWidth);
const FontWeight selectedPageFontWeight = FontWeight.w800;
const double minWidthForShowNavBarRoutes = 800;
const double trademarkWidthEstimate = 80.0;
const double paddingPerItemEstimate = 40.0;

class HorizontalNavigation extends StatelessWidget {
  const HorizontalNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final generalStyle = Theme.of(context).textTheme.headlineSmall!;
    final boldStyle = generalStyle.copyWith(fontWeight: selectedPageFontWeight);
    final currentPath =
        GoRouter.of(context).routerDelegate.currentConfiguration.uri.path;

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        final totalWidthEstimate = _estimateRouteLabelsTotalWidth(
          context,
          generalStyle,
        );

        final canFit = totalWidthEstimate <= maxWidth;
        final isWide =
            MediaQuery.of(context).size.width > minWidthForShowNavBarRoutes;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Trademark(isInverted: false, hasBorder: true),
            if (isWide && canFit) spacer,
            if (isWide && canFit)
              ...RouteEnum.values.map(
                (route) {
                  final pageName = context.local(route.pageName());
                  final isCurrentRoute = route.path() == currentPath;

                  return TextButton(
                    onPressed: () => context.go(route.path()),
                    child: Text(
                      pageName,
                      style: isCurrentRoute ? boldStyle : generalStyle,
                    ),
                  );
                },
              ),
          ],
        );
      },
    );
  }

  double _estimateRouteLabelsTotalWidth(BuildContext context, TextStyle style) {
    final approxTextWidths = RouteEnum.values.map(
      (route) => _estimateTextWidth(context.local(route.pageName()), style),
    );

    return approxTextWidths.fold((trademarkWidthEstimate + spacerWidth),
        (sum, w) => sum + w + paddingPerItemEstimate);
  }

  double _estimateTextWidth(String text, TextStyle style) {
    final tp = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return tp.width + 30.0;
  }
}
