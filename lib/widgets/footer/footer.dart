import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/bootstrap/router/route_enum.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = _routes(context);
    final width = MediaQuery.of(context).size.width;
    final isHorizontal = width > AppDimensions.narrowScreenBreakpoint;

    return Container(
        margin: const EdgeInsets.only(top: AppDimensions.spacing50),
        decoration: _decoration(context),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: AppDimensions.spacing5, bottom: AppDimensions.spacing5),
          child: isHorizontal
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [...routes],
                )
              : Column(
                  children: [
                    ...routes,
                  ],
                ),
        ));
  }

  Iterable<TextButton> _routes(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodySmall ?? const TextStyle();

    return RouteEnum.values.map(
      (route) {
        return TextButton(
          onPressed: () => _navigateTo(context, route.path()),
          child: Text(context.local(route.pageName()), style: textStyle),
        );
      },
    );
  }

  void _navigateTo(BuildContext context, String path) {
    context.go(path);
  }

  BoxDecoration _decoration(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BoxDecoration(
      // color: colors.onTertiary, // Is it better with the background color or without?
      border: Border(top: BorderSide(width: AppDimensions.borderWidth, color: colors.onTertiary)),
    );
  }
}
