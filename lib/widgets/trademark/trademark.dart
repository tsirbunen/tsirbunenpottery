import 'package:flutter/material.dart';

const String chineseCharacter = '泥';
const double chineseCharacterDefaultSize = 34.0;
const String tradeNameBeginning = 'MAD MUD';
const double tradeNameDefaultSize = 10.0;
const double textHeight = 1.0;
const double spacerHeight = 6.0;
const EdgeInsets padding = EdgeInsets.all(2.0);
const double borderRadius = 4.0;
const double borderWidth = 1.0;
const double containerWidthDefault = 60.0;

class Trademark extends StatelessWidget {
  final double characterSize;
  final double tradeNameSize;
  final bool isInverted;
  final bool hasBorder;
  final void Function()? onPressed;
  final double width;

  const Trademark({
    super.key,
    this.characterSize = chineseCharacterDefaultSize,
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

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        decoration: _decoration(colors),
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                chineseCharacter,
                style: _style(
                    baseStyle, textColor, characterSize, FontWeight.w500),
              ),
              const SizedBox(height: spacerHeight),
              Text(
                tradeNameBeginning,
                style: _style(
                  baseStyle,
                  textColor,
                  tradeNameSize,
                  FontWeight.w700,
                ),
              ),
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
