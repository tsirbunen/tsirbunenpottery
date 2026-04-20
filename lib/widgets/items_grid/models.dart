import 'package:flutter/widgets.dart';

const double singleRowSubtraction = 15.0;
const double horizontalGridSpacing = 15.0;
const double verticalGridSpacing = 20.0;
const double defaultMinPhotoWidth = 175.0;
const double defaultMaxPhotoWidth = 300.0;
const double sideMargin = 25.0;
const double showExpandBreakpoint = 700.0;
const int kNarrowColumnsCount = 3;

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
}

GridParams computeGridParams(
  BuildContext context,
  List<int> counts,
) {
  final screenWidth = MediaQuery.of(context).size.width;
  final availableWidth = screenWidth - 2 * sideMargin;
  final itemsPerRowEstimate = (availableWidth + horizontalGridSpacing) ~/
      (defaultMinPhotoWidth + horizontalGridSpacing);

  double width = 0.0;
  int itemsPerRow = 0;

  for (final count in counts) {
    if (count == 0) continue;
    final itemsPerThisRow = itemsPerRowEstimate.clamp(1, count);
    if (itemsPerThisRow > itemsPerRow) itemsPerRow = itemsPerThisRow;
    final totalSpacing = horizontalGridSpacing * (itemsPerThisRow - 1);
    final photoWidth =
        ((availableWidth - totalSpacing) / itemsPerThisRow)
            .clamp(defaultMinPhotoWidth, defaultMaxPhotoWidth);
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
