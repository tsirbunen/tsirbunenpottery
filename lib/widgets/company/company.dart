import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/utils/app_typography.dart';

class Company extends StatelessWidget {
  final bool isDark;
  const Company({super.key, this.isDark = true});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final tradeName = context.local(Translation.tradeName);
    final shortDescription = context.local(Translation.appShortDescription);
    final textColor = isDark ? colors.primary : colors.secondary;

    return Column(
      crossAxisAlignment:  CrossAxisAlignment.center,
      children: [
        Text(
          tradeName,
          style: TextStyle(
            fontSize: AppTypography.tradeNameFontSize,
            color: textColor,
            fontWeight: AppTypography.tradeNameFontWeight,
          ),
        ),
        Text(
          shortDescription,
          style: TextStyle(
            fontSize: AppTypography.descriptionFontSize,
            color: textColor,
            fontWeight: AppTypography.descriptionFontWeight,
          ),
        ),
      ],
    );
  }
}
