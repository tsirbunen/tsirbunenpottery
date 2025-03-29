import 'package:flutter/material.dart';

const String chineseCharacter = '泥';
const double characterDefaultSize = 35.0;
const String tradeName = 'MAD MUD';
const double tradeNameDefaultSize = 10.0;
const double textHeight = 1.0;
const double spacerHeight = 6.0;
const EdgeInsets padding = EdgeInsets.all(2.0);
const double borderRadius = 4.0;

class Trademark extends StatelessWidget {
  final double characterSize;
  final double tradeNameSize;
  final bool isInverted;
  final void Function()? onPressed;

  const Trademark({
    super.key,
    this.characterSize = characterDefaultSize,
    this.tradeNameSize = tradeNameDefaultSize,
    this.isInverted = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.titleMedium!;
    final colors = Theme.of(context).colorScheme;
    final textColor = isInverted ? colors.surface : colors.primary;
    final background = isInverted ? colors.primary : Colors.transparent;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: padding,
          child: Column(
            children: [
              Text(
                chineseCharacter,
                style: _style(baseStyle, textColor, characterSize),
              ),
              const SizedBox(height: spacerHeight),
              Text(
                tradeName,
                style: _style(
                  baseStyle,
                  textColor,
                  tradeNameSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _style(TextStyle baseStyle, Color color, double fontSize) {
    return baseStyle.copyWith(
      color: color,
      height: textHeight,
      fontWeight: FontWeight.w900,
      fontSize: fontSize,
    );
  }
}
