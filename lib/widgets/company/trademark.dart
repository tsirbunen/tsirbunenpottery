import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/utils/app_assets.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';

class Trademark extends StatelessWidget {
  final bool isInverted;
  final bool hasBorder;
  final void Function()? onPressed;
  final double width;

  const Trademark({
    super.key,
    this.isInverted = true,
    this.hasBorder = false,
    this.width = AppDimensions.trademarkWidth,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: _decoration(colors),
        width: width,
        height: width,
        child: const Padding(
          padding: AppDimensions.trademarkPadding,
          child: Image(image: AssetImage(AppAssets.birdie)),
        ),
      ),
    );
  }

  BoxDecoration _decoration(ColorScheme colors) {
    return BoxDecoration(
      color: isInverted ? colors.primary : Colors.transparent,
      borderRadius: BorderRadius.circular(AppDimensions.circularBorderRadius),
      border: hasBorder
          ? Border.all(color: colors.primary, width: AppDimensions.borderWidth)
          : null,
    );
  }
}
