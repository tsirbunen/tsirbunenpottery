import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/utils/app_gaps.dart';
import 'package:tsirbunenpottery/widgets/company/company.dart';
import 'package:tsirbunenpottery/widgets/company/trademark.dart';

const EdgeInsets _padding = EdgeInsets.symmetric(vertical: AppDimensions.spacing10, horizontal: AppDimensions.spacing15);

class DrawerHeaderItem extends StatelessWidget {
  final double width;
  const DrawerHeaderItem({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration(context),
      child: Padding(
        padding: _padding,
        child: Row(
          children: [
            Trademark(isInverted: false, hasBorder: true, width: width),
            AppGaps.h20,
            const Expanded(child: Company()),
          ],
        ),
      ),
    );
  }

  BoxDecoration _decoration(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BoxDecoration(
      border: Border(
          bottom: BorderSide(
        width: AppDimensions.borderWidth,
        color: colors.onTertiary,
      )),
    );
  }
}
