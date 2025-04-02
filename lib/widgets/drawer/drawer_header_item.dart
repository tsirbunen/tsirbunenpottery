import 'package:flutter/material.dart';
import 'package:madmudmobile/widgets/trademark/trademark.dart';

const EdgeInsets padding =
    EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0);
const String tradeName = 'MAD MUD COMPANY';
const double tradeNameFontSize = 15.0;
const FontWeight tradeNameFontWeight = FontWeight.w900;
const double descriptionFontSize = 12.0;
const FontWeight descriptionFontWeight = FontWeight.w500;
const List<String> shortDescriptions = [
  'Where the mud gets personal.',
  'Handmade, unique, always.'
];

class DrawerHeaderItem extends StatelessWidget {
  const DrawerHeaderItem({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      color: colors.tertiary,
      child: Column(
        children: [
          Padding(
            padding: padding,
            child: Row(
              children: [
                const Trademark(isInverted: false, hasBorder: true),
                const SizedBox(width: 25),
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
                      ...shortDescriptions.map(
                        (description) => Text(
                          description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: descriptionFontSize,
                            color: colors.primary,
                            fontWeight: descriptionFontWeight,
                          ),
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
