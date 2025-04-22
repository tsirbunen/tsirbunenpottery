enum ViewMode {
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
      case ViewMode.designs:
        return '/designs';
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
