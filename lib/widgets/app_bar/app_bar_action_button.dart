import 'package:flutter/material.dart';

const double containerSize = 50.0;
const double iconSize = 30.0;

class AppBarActionButton extends StatelessWidget {
  final IconData iconData;
  final void Function() onPressed;

  const AppBarActionButton({
    super.key,
    required this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: containerSize,
      height: containerSize,
      child: IconButton(
        icon: Icon(
          iconData,
          size: iconSize,
          color: colors.primary,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
