import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_bloc.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_state.dart';
import 'package:madmudmobile/app/router/route_enum.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_bloc.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_state.dart';
import 'package:madmudmobile/features/products/domain/models/design/design.dart';
import 'package:madmudmobile/features/products/presentation/product_view/product_sub_view.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/utils/current_page_name_from_settings.dart';

enum ViewMode {
  categories,
  collections,
}

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralStateBloc, GeneralState>(
        builder: (BuildContext context, GeneralState state) {
      final language = state.language;

      return BlocBuilder<ProductsBloc, ProductsState>(builder: (
        BuildContext context,
        ProductsState state,
      ) {
        final mode = _viewMode(context);
        final groupedDesigns = mode == ViewMode.categories
            ? state.categoryDesigns
            : state.collectionDesigns;

        final subViewDetails =
            _commonSubViewLayoutParams(context, groupedDesigns);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: groupedDesigns.entries.map((entry) {
            final id = entry.key;
            final pieceIdsByDesignIds = entry.value;

            return ProductSubView(
              title: _subViewTitle(mode, state, id, language),
              designs: _subViewDesigns(pieceIdsByDesignIds, state.designsById),
              pieceIdsByDesignIds: pieceIdsByDesignIds,
              language: language,
              photoWidth: subViewDetails.width,
              isSingleRow: subViewDetails.isSingleRow,
            );
          }).toList(),
        );
      });
    });
  }

  ViewMode _viewMode(BuildContext context) {
    final currentPage = currentPageNameFromSettings(context);
    final categoriesPage = context.local(RouteEnum.categories.pageName());
    if (currentPage == categoriesPage) return ViewMode.categories;

    return ViewMode.collections;
  }

  String _subViewTitle(mode, state, categoryOrCollectionId, Language language) {
    return (mode == ViewMode.categories ? state.categories : state.collections)
        .firstWhere((c) => c.id == categoryOrCollectionId)
        .names[language]!;
  }

  _subViewDesigns(Map<String, List<String>> pieceIdsByDesignIds, designsById) {
    final designIds = pieceIdsByDesignIds.keys.toList();
    return designIds.map((id) => designsById[id]).whereType<Design>().toList();
  }

  // Note: We need to calculate the width of the photos in the parent of the sub views
  // so that we can set the same width for all the photos in every sub view.
  _commonSubViewLayoutParams(BuildContext context,
      Map<String, Map<String, List<String>>> groupedDesigns) {
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth = screenWidth - 2 * sideMargin;
    final itemsPerRowEstimate = (availableWidth + horizontalGridSpacing) ~/
        (minPhotoWidth + horizontalGridSpacing);

    double? width;
    bool isSingleRow = false;

    for (var entry in groupedDesigns.entries) {
      final designsCount = entry.value.length;
      final itemsPerRow = itemsPerRowEstimate.clamp(1, designsCount);
      if (itemsPerRow == 1) isSingleRow = true;

      double totalSpacing = horizontalGridSpacing * (itemsPerRow - 1);
      double photoWidth = ((availableWidth - totalSpacing) / itemsPerRow)
          .clamp(minPhotoWidth, maxPhotoWidth);
      if (width == null || photoWidth < width) {
        width = photoWidth;
      }
    }

    return (width: width, isSingleRow: isSingleRow);
  }
}
