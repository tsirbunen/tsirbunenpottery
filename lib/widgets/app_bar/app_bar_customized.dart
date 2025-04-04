import 'package:flutter/material.dart';
import 'package:madmudmobile/utils/current_page_name_from_settings.dart';
import 'package:madmudmobile/widgets/app_bar/app_bar_action_button.dart';
import 'package:madmudmobile/widgets/horizontal_navigation/horizontal_navigation.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

const double appBarHeight = 90.0;
const double heightBreakpoint = 800.0;
const double widthBreakpoint = 400.0;
const double paddingMobile = 0.0;
const double paddingDesktop = 5.0;
const double mobilePadding = 5.0;
const double desktopPadding = 10.0;
const double minWidthForShowNavBar = 600;

class AppBarCustomized extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustomized({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= minWidthForShowNavBar;
    final currentPage = currentPageNameFromSettings(context);

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
                AppBarActionButton(
                    onPressed: () => _openDrawer(context),
                    iconData: Symbols.menu),
                Expanded(
                    child: HorizontalNavigation(
                  isWide: isWide,
                  currentPage: currentPage,
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppBarActionButton(
                      onPressed: () => {},
                      iconData: Symbols.search,
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
