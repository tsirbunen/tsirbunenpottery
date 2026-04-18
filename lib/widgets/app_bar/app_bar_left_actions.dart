import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/theme/app_icons.dart';
import 'package:tsirbunenpottery/widgets/action_button/action_button.dart';

class AppBarLeftActions extends StatelessWidget {
  const AppBarLeftActions({super.key});

  @override
  Widget build(BuildContext context) {
    final isDetailRoute =
        GoRouterState.of(context).pathParameters.containsKey('id');

    if (isDetailRoute) {
      return ActionButton(
        onPressed: () => GoRouter.of(context).pop(),
        iconData: AppIcons.back,
      );
    }

    return ActionButton(
      onPressed: () => Scaffold.of(context).openDrawer(),
      iconData: AppIcons.menu,
    );
  }
}
