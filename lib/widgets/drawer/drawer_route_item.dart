import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/utils/app_spacing.dart';
import 'package:tsirbunenpottery/utils/app_typography.dart';
import 'package:tsirbunenpottery/widgets/hover_detector/hover_detector.dart';

const _itemPadding = EdgeInsets.symmetric(vertical: AppSpacing.spacing15, horizontal: AppSpacing.spacing15);
const _labelPadding = EdgeInsets.only(left: AppSpacing.spacing20);

class DrawerRouteItem extends StatelessWidget {
  final String routeLabel;
  final IconData iconData;
  final String path;
  final bool isTitle;
  final double width;
  final bool isCurrentRoute;

  const DrawerRouteItem({
    super.key,
    required this.routeLabel,
    required this.iconData,
    required this.path,
    required this.width,
    required this.isCurrentRoute,
    this.isTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final generalStyle =
        Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: AppTypography.drawerItemFontSize,
            ) ??
        const TextStyle(fontSize: AppTypography.drawerItemFontSize);
    final emphasizedStyle = generalStyle.emphasized;
    final style = isCurrentRoute ? emphasizedStyle : generalStyle;

    return HoverDetector(builder: (BuildContext context, bool isHovering) {
      return Container(
        color: isHovering ? colors.onTertiary : Colors.transparent,
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _navigateTo(context),
              child: Padding(
                padding: _itemPadding,
                child: Row(
                  children: [
                    Container(
                      width: width,
                      alignment: Alignment.center,
                      child: Icon(
                        iconData,
                        size: AppDimensions.iconSize,
                        color: colors.primary,
                        weight: isCurrentRoute
                            ? AppTypography.selectedIconWeight
                            : AppTypography.defaultIconWeight,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: _labelPadding,
                        child: Text(routeLabel, style: style),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  void _navigateTo(BuildContext context) {
    Navigator.of(context).pop();
    context.go(path);
  }
}
