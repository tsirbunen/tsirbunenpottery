import 'package:flutter/material.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/widgets/trademark/trademark.dart';

const EdgeInsets padding =
    EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0);
const double tradeNameFontSize = 15.0;
const FontWeight tradeNameFontWeight = FontWeight.w900;
const double descriptionFontSize = 12.0;
const FontWeight descriptionFontWeight = FontWeight.w500;
const SizedBox spacer = SizedBox(width: 20);

class DrawerHeaderItem extends StatelessWidget {
  final double width;
  const DrawerHeaderItem({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final tradeName = context.local(Translation.tradeName);
    final shortDescription = context.local(Translation.appShortDescription);

    return Container(
      color: colors.onTertiary,
      child: Column(
        children: [
          Padding(
            padding: padding,
            child: Row(
              children: [
                Trademark(isInverted: false, hasBorder: true, width: width),
                spacer,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tradeName,
                        style: TextStyle(
                          fontSize: tradeNameFontSize,
                          color: colors.primary,
                          fontWeight: tradeNameFontWeight,
                        ),
                      ),
                      Text(
                        shortDescription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: descriptionFontSize,
                          color: colors.primary,
                          fontWeight: descriptionFontWeight,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
