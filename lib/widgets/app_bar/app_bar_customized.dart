import 'package:flutter/material.dart';
import 'package:madmudmobile/widgets/app_bar/app_bar_action_button.dart';
import 'package:madmudmobile/widgets/horizontal_navigation/horizontal_navigation.dart';
import 'package:madmudmobile/widgets/hover_detector/hover_detector.dart';
import 'package:madmudmobile/widgets/trademark/trademark.dart';

const double appBarHeight = 85.0;
const double heightBreakpoint = 800.0;
const double widthBreakpoint = 400.0;
const double paddingMobile = 0.0;
const double paddingDesktop = 5.0;
const double mobilePadding = 5.0;
const double desktopPadding = 15.0;
const double minWidthForShowNavBar = 600;

class AppBarCustomized extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustomized({super.key});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < minWidthForShowNavBar;

    return Container(
      height: appBarHeight,
      decoration: _decoration(context),
      child: Padding(
        padding: _padding(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HoverDetector(builder: (BuildContext context, bool isHovering) {
                  return Trademark(
                    onPressed: () => _openDrawer(context),
                    isInverted: isHovering,
                    hasBorder: true,
                  );
                }),
                if (!isNarrow) const Expanded(child: HorizontalNavigation()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppBarActionButton(
                      onPressed: () => {},
                      iconData: Icons.search,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  BoxDecoration _decoration(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BoxDecoration(
      color: colors.tertiary,
      border: Border(bottom: BorderSide(width: 1.0, color: colors.tertiary)),
    );
  }

  EdgeInsets _padding(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottom =
        size.height > heightBreakpoint ? desktopPadding : mobilePadding;
    final horizontal =
        size.width > widthBreakpoint ? desktopPadding : mobilePadding;

    return EdgeInsets.only(left: horizontal, right: horizontal, bottom: bottom);
  }

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}
