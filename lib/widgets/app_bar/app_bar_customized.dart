import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/widgets/app_bar/app_bar_left_actions.dart';
import 'package:tsirbunenpottery/widgets/app_bar/app_bar_right_actions.dart';
import 'package:tsirbunenpottery/widgets/horizontal_navigation/horizontal_navigation.dart';

class AppBarCustomized extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustomized({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.appBarHeight,
      decoration: _decoration(context),
      child: Padding(
        padding: _padding(),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppBarLeftActions(),
                Expanded(child: HorizontalNavigation()),
                AppBarRightActions(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _decoration(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BoxDecoration(
      border: Border(bottom: BorderSide(width: AppDimensions.borderWidth, color: colors.onTertiary)),
    );
  }

  EdgeInsets _padding() {
    return const EdgeInsets.only(
      left: AppDimensions.appBarPadding,
      right: AppDimensions.appBarPadding,
      bottom: AppDimensions.appBarPadding,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppDimensions.appBarHeight);
}
