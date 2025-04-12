import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_bloc.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_state.dart';
import 'package:madmudmobile/app/router/route_enum.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_bloc.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_state.dart';
import 'package:madmudmobile/features/products/domain/models/design/design.dart';
import 'package:madmudmobile/features/products/domain/models/piece/piece.dart';
import 'package:madmudmobile/features/products/presentation/product_view/product_sub_view.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/utils/current_page_name_from_settings.dart';

enum ProductViewMode {
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
        final groupedDesigns = mode == ProductViewMode.categories
            ? state.categoryDesigns
            : state.collectionDesigns;
        final allDesigns = state.designsById;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: groupedDesigns.entries.map((entry) {
            final categoryOrCollectionId = entry.key;
            final pieceIdsByDesignIds = entry.value;

            final designIds = pieceIdsByDesignIds.keys.toList();
            final designs = designIds
                .map((id) => allDesigns[id])
                .whereType<Design>()
                .toList();

            String title;

            if (mode == ProductViewMode.categories) {
              final category = state.categories.firstWhere(
                (category) => category.id == categoryOrCollectionId,
              );

              title = category.names[language]!;
            } else {
              final collection = state.collections.firstWhere(
                (collection) => collection.id == categoryOrCollectionId,
              );

              title = collection.names[language]!;
            }

            return ProductSubView(
              title: title,
              designs: designs,
              pieceIdsByDesignIds: pieceIdsByDesignIds,
              language: language,
            );
          }).toList(),
        );
      });
    });
  }

  ProductViewMode _viewMode(BuildContext context) {
    final currentPage = currentPageNameFromSettings(context);
    final categoriesPage = context.local(RouteEnum.categories.pageName());
    if (currentPage == categoriesPage) return ProductViewMode.categories;

    return ProductViewMode.collections;
  }
}
