import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/localization/translation.dart';

const double tradeNameFontSize = 15.0;
const FontWeight tradeNameFontWeight = FontWeight.w900;
const double descriptionFontSize = 12.0;
const FontWeight descriptionFontWeight = FontWeight.w500;

class Company extends StatelessWidget {
  final bool isDark;
  final bool isCentered;
  const Company({super.key, this.isDark = true, this.isCentered = false});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final tradeName = context.local(Translation.tradeName);
    final shortDescription = context.local(Translation.appShortDescription);
    final textColor = isDark ? colors.primary : colors.secondary;

    return Column(
      // crossAxisAlignment: isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      crossAxisAlignment:  CrossAxisAlignment.center,
      children: [
        Text(
          tradeName,
          style: TextStyle(
            fontSize: tradeNameFontSize,
            color: textColor,
            fontWeight: tradeNameFontWeight,
          ),
        ),
        Text(
          shortDescription,
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: descriptionFontSize,
            color: textColor,
            fontWeight: descriptionFontWeight,
          ),
        ),
      ],
    );
  }
}
