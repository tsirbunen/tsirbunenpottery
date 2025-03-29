import 'package:flutter/material.dart';
import 'package:madmudmobile/widgets/app_bar/app_bar_action_button.dart';
import 'package:madmudmobile/widgets/hover_detector/hover_detector.dart';
import 'package:madmudmobile/widgets/trademark/trademark.dart';

const double appBarHeight = 100.0;
const double heightBreakpoint = 800.0;
const double widthBreakpoint = 400.0;
const double paddingMobile = 0.0;
const double paddingDesktop = 5.0;
const double mobilePadding = 10.0;
const double desktopPadding = 20.0;

class AppBarCustomized extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustomized({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final paddings = _paddings(context);

    return Container(
      height: appBarHeight,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: colors.tertiary),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: paddings.horizontal,
            right: paddings.horizontal,
            bottom: paddings.bottom),
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
                    isInverted: !isHovering,
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppBarActionButton(
                      onPressed: () => _openDrawer(context),
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

  _paddings(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final bottom = height > heightBreakpoint ? desktopPadding : mobilePadding;
    final horizontal = width > widthBreakpoint ? desktopPadding : mobilePadding;

    return (bottom: bottom, horizontal: horizontal);
  }

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}
