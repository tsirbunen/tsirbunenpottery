import 'package:flutter/material.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/localization/translation.dart';

const double logoDefaultSize = 36.0;
const double tradeNameDefaultSize = 7.0;
const double textHeight = 1.0;
const double spacerHeight = 1.0;
const EdgeInsets padding =
    EdgeInsets.only(left: 6.0, right: 6.0, bottom: 5.0, top: 1.0);
const double borderRadius = 50.0;
const double borderWidth = 1.0;
const double containerWidthDefault = 60.0;

class Trademark extends StatelessWidget {
  final double logoSize;
  final double tradeNameSize;
  final bool isInverted;
  final bool hasBorder;
  final void Function()? onPressed;
  final double width;

  const Trademark({
    super.key,
    this.logoSize = logoDefaultSize,
    this.tradeNameSize = tradeNameDefaultSize,
    this.isInverted = true,
    this.hasBorder = false,
    this.width = containerWidthDefault,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.titleMedium!;
    final colors = Theme.of(context).colorScheme;
    final textColor = isInverted ? colors.surface : colors.primary;
    final tradeNameParts = context.local(Translation.tradeName).split(' ');

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: _decoration(colors),
        width: width,
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/birdie512.png',
                      width: logoSize,
                      height: logoSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: spacerHeight),
              ...tradeNameParts.map((part) {
                return Text(
                  part,
                  style: _style(
                    baseStyle,
                    textColor,
                    tradeNameSize,
                    FontWeight.w700,
                  ),
                );
              }),
              const SizedBox(height: spacerHeight),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _decoration(ColorScheme colors) {
    return BoxDecoration(
      color: isInverted ? colors.primary : Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      border: hasBorder
          ? Border.all(color: colors.primary, width: borderWidth)
          : null,
    );
  }

  TextStyle _style(
      TextStyle baseStyle, Color color, double fontSize, FontWeight weight) {
    return baseStyle.copyWith(
      color: color,
      height: textHeight,
      fontWeight: weight,
      fontSize: fontSize,
    );
  }
}
