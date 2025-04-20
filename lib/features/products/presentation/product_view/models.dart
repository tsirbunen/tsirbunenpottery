enum ViewMode {
  categories,
  collections,
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
    }
  }
}

extension ViewModeRouteExtension on ViewMode {
  String routeRoot() {
    switch (this) {
      case ViewMode.categories:
        return '/categories';
      case ViewMode.collections:
        return '/collections';
    }
  }
}

class GridParams {
  final int itemsPerRow;
  final double photoWidth;

  GridParams({
    required this.itemsPerRow,
    required this.photoWidth,
  });
}
