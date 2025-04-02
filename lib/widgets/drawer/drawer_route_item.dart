import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madmudmobile/widgets/hover_detector/hover_detector.dart';

const iconSize = 34.0;
const fontSize = 18.0;
const itemPadding = EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0);
const labelPadding = EdgeInsets.only(left: 20.0);
const double iconAndTrademarkContainerWidth = 60.0;

class DrawerRouteItem extends StatelessWidget {
  final String routeLabel;
  final IconData iconData;
  final String path;
  final bool isTitle;

  const DrawerRouteItem({
    super.key,
    required this.routeLabel,
    required this.iconData,
    required this.path,
    this.isTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final style = Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontSize: fontSize,
        );

    return HoverDetector(builder: (BuildContext context, bool isHovering) {
      return Container(
        color: isHovering ? colors.tertiary : Colors.transparent,
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _navigateTo(context),
              child: Padding(
                padding: itemPadding,
                child: Row(
                  children: [
                    Container(
                      width: iconAndTrademarkContainerWidth,
                      alignment: Alignment.center,
                      child:
                          Icon(iconData, size: iconSize, color: colors.primary),
                    ),
                    Expanded(
                      child: Padding(
                        padding: labelPadding,
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
