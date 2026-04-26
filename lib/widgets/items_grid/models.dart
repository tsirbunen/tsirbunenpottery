import 'package:flutter/widgets.dart';
import 'package:tsirbunenpottery/utils/app_layout_constants.dart';

enum ViewMode {
  pieces,
  categories,
  collections,
  designs,
}

extension ScrollTargetExtension on ViewMode {
  String scrollTargetName(String? categoryId, String? collectionId,
      {bool isHorizontal = false}) {
    final direction = isHorizontal ? 'horizontal' : 'vertical';
    switch (this) {
      case ViewMode.categories:
        return categoryId == null
            ? 'categories'
            : 'category-$direction-$categoryId';
      case ViewMode.collections:
        return collectionId == null
            ? 'collections'
            : 'collection-$direction-$collectionId';
      case ViewMode.designs:
        return 'designs-$direction';
      case ViewMode.pieces:
        return 'pieces-$direction';
    }
  }

  String get fixedScrollTargetName => scrollTargetName(null, null);
}

GridParams computeGridParams(
  BuildContext context,
  List<int> counts,
) {
  final screenWidth = MediaQuery.of(context).size.width;
  final availableWidth = screenWidth - 2 * AppLayoutConstants.sideMargin;
  final itemsPerRowEstimate =
      (availableWidth + AppLayoutConstants.horizontalGridSpacing) ~/
          (AppLayoutConstants.defaultMinPhotoWidth +
              AppLayoutConstants.horizontalGridSpacing);

  double width = 0.0;
  int itemsPerRow = 0;

  for (final count in counts) {
    if (count == 0) continue;
    final itemsPerThisRow = itemsPerRowEstimate.clamp(1, count);
    if (itemsPerThisRow > itemsPerRow) itemsPerRow = itemsPerThisRow;
    final totalSpacing =
        AppLayoutConstants.horizontalGridSpacing * (itemsPerThisRow - 1);
    final photoWidth = ((availableWidth - totalSpacing) / itemsPerThisRow)
        .clamp(AppLayoutConstants.defaultMinPhotoWidth,
            AppLayoutConstants.defaultMaxPhotoWidth);
    if (width == 0.0 || photoWidth < width) width = photoWidth;
  }

  return GridParams(
    itemsPerRow: itemsPerRow,
    photoWidth: width,
    availableWidth: availableWidth,
  );
}

class GridParams {
  final int itemsPerRow;
  final double photoWidth;
  final double availableWidth;

  GridParams({
    required this.itemsPerRow,
    required this.photoWidth,
    required this.availableWidth,
  });
}
