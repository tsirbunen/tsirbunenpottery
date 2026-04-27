import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/bootstrap/router/route_enum.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/utils/app_typography.dart';
import 'package:tsirbunenpottery/widgets/company/trademark.dart';

const SizedBox _spacer = SizedBox(width: AppDimensions.navSpacerWidth);

class HorizontalNavigation extends StatefulWidget {
  const HorizontalNavigation({super.key});

  @override
  State<HorizontalNavigation> createState() => _HorizontalNavigationState();
}

class _HorizontalNavigationState extends State<HorizontalNavigation> {
  double _totalWidthEstimate = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final style = Theme.of(context).textTheme.headlineSmall!;
    _totalWidthEstimate = _computeTotalWidth(style);
  }

  double _computeTotalWidth(TextStyle style) {
    return RouteEnum.values.fold(
      AppDimensions.navTrademarkWidthEstimate + AppDimensions.navSpacerWidth,
      (sum, route) => sum + _measureText(context.local(route.pageName()), style),
    );
  }

  double _measureText(String text, TextStyle style) {
    final tp = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return tp.width + 30.0;
  }

  @override
  Widget build(BuildContext context) {
    final generalStyle = Theme.of(context).textTheme.headlineSmall ?? const TextStyle();
    final boldStyle = generalStyle.emphasized;
    final currentPath =
        GoRouter.of(context).routerDelegate.currentConfiguration.uri.path;

    return LayoutBuilder(
      builder: (context, constraints) {
        final canFit = _totalWidthEstimate <= constraints.maxWidth;
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
}
