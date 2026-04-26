import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/bootstrap/router/route_enum.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/utils/app_typography.dart';
import 'package:tsirbunenpottery/widgets/company/trademark.dart';

const SizedBox _spacer = SizedBox(width: AppDimensions.navSpacerWidth);

class HorizontalNavigation extends StatelessWidget {
  const HorizontalNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final generalStyle = Theme.of(context).textTheme.headlineSmall!;
    final boldStyle = generalStyle.copyWith(fontWeight: AppTypography.selectedPageFontWeight);
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
            MediaQuery.of(context).size.width > AppDimensions.wideScreenBreakpoint;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Trademark(isInverted: false, hasBorder: true),
            if (isWide && canFit) _spacer,
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

    return approxTextWidths.fold(
      AppDimensions.navTrademarkWidthEstimate + AppDimensions.navSpacerWidth,
      (sum, w) => sum + w + AppDimensions.navItemPaddingEstimate,
    );
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
