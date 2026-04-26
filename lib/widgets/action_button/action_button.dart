import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/utils/app_typography.dart';

class ActionButton extends StatelessWidget {
  final IconData iconData;
  final void Function() onPressed;

  const ActionButton({
    super.key,
    required this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: AppDimensions.actionButtonSize,
      height: AppDimensions.actionButtonSize,
      child: IconButton(
        icon: Icon(
          iconData,
          size: AppDimensions.iconSize,
          weight: AppTypography.defaultIconWeight,
          color: colors.primary,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
