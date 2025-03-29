import 'package:flutter/material.dart';
import 'package:madmudmobile/widgets/drawer/drawer_route_item.dart';
import 'package:madmudmobile/widgets/trademark/trademark.dart';

const double dividerWidth = 1.15;
const EdgeInsets padding =
    EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0);
const double heightBreakpoint = 800.0;
const double paddingMobile = 0.0;
const double paddingDesktop = 5.0;

class DrawerHeaderItem extends StatelessWidget {
  const DrawerHeaderItem({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomPadding =
        screenHeight > heightBreakpoint ? paddingDesktop : paddingMobile;

    return Column(
      children: [
        Padding(
          padding: padding,
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: iconAndTrademarkContainerWidth,
                margin: EdgeInsets.only(bottom: bottomPadding),
                child: const Trademark(),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(width: dividerWidth, color: colors.tertiary),
          )),
        )
      ],
    );
  }
}
