import 'package:flutter/widgets.dart';
import 'package:tsirbunenpottery/utils/app_layout_constants.dart';
import 'package:tsirbunenpottery/utils/app_scroll_keys.dart';

enum ViewMode {
  pieces,
  categories,
  collections,
  designs,
}

String _groupedKey(String key, String direction, String? groupId) =>
    groupId == null ? key : '$key-$direction-$groupId';

String _fixedKey(String key, String direction) => '$key-$direction';

extension ScrollTargetExtension on ViewMode {
  String scrollTargetName(String? groupId, {bool isHorizontal = false}) {
    final direction = isHorizontal ? AppScrollKeys.horizontal : AppScrollKeys.vertical;
    switch (this) {
      case ViewMode.categories:
        return _groupedKey(AppScrollKeys.categories, direction, groupId);
      case ViewMode.collections:
        return _groupedKey(AppScrollKeys.collections, direction, groupId);
      case ViewMode.designs:
        return _fixedKey(AppScrollKeys.designs, direction);
      case ViewMode.pieces:
        return _fixedKey(AppScrollKeys.pieces, direction);
    }
  }

  String get fixedScrollTargetName => scrollTargetName(null);
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
