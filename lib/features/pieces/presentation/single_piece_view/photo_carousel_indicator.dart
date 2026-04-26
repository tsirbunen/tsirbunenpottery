import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';

class PhotoCarouselIndicator extends StatelessWidget {
  final int currentIndex;
  final int photosCount;

  const PhotoCarouselIndicator(
      {super.key, required this.currentIndex, required this.photosCount});

  @override
  Widget build(BuildContext context) {
    final colors = _dotColors(context);

    return Padding(
      padding: const EdgeInsets.only(top: AppDimensions.spacing10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(photosCount, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: AppDimensions.carouselDotSpacing),
            width: AppDimensions.carouselDotSize,
            height: AppDimensions.carouselDotSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == currentIndex ? colors.active : colors.inactive,
            ),
          );
        }),
      ),
    );
  }

  ({Color active, Color inactive}) _dotColors(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return (active: colors.secondary, inactive: colors.tertiary);
  }
}
