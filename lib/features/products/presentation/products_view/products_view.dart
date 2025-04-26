import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_bloc.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_state.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_bloc.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_state.dart';
import 'package:madmudmobile/features/products/domain/models/design/design.dart';
import 'package:madmudmobile/features/products/presentation/products_view/models.dart';
import 'package:madmudmobile/features/products/presentation/products_view/products_sub_view.dart';
import 'package:madmudmobile/features/products/presentation/products_view/scroll_position_mixin.dart';
import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/widgets/footer/footer.dart';
import 'package:madmudmobile/widgets/page_base/page_base.dart';

class ProductsView extends StatefulWidget {
  final ViewMode mode;
  final String? selectedCategoryId;
  final String? selectedCollectionId;

  const ProductsView({
    super.key,
    required this.mode,
    this.selectedCategoryId,
    this.selectedCollectionId,
  });

  String get scrollTargetName {
    return mode.scrollTargetName(selectedCategoryId, selectedCollectionId);
  }

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView>
    with ScrollPositionMixin<ProductsView> {
  @override
  String get scrollTargetName => widget.scrollTargetName;

  @override
  Widget build(BuildContext context) {
    return PageBase(
      scrollController: scrollController,
      pageBody: BlocBuilder<GeneralStateBloc, GeneralState>(
          builder: (BuildContext context, GeneralState state) {
        final language = state.language;

        return BlocBuilder<ProductsBloc, ProductsState>(builder: (
          BuildContext context,
          ProductsState state,
        ) {
          final groupedDesigns = _designsToShow(state);
          final gridParams = _commonGridParams(context, groupedDesigns);

          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...groupedDesigns.entries.map((entry) {
                  final id = entry.key;
                  final pieceIdsByDesignIds = entry.value;

                  return ProductsSubView(
                    id: id,
                    title: _subViewTitle(widget.mode, state, id, language),
                    designs:
                        _subViewDesigns(pieceIdsByDesignIds, state.designsById),
                    pieceIdsByDesignIds: pieceIdsByDesignIds,
                    language: language,
                    gridParams: gridParams,
                    isTheOnlySubView: widget.mode == ViewMode.designs ||
                        widget.selectedCategoryId != null ||
                        widget.selectedCollectionId != null,
                    mode: widget.mode,
                  );
                }),
                const Footer(),
              ]);
        });
      }),
    );
  }

  Map<String, Map<String, List<String>>> _designsToShow(ProductsState state) {
    if (widget.mode == ViewMode.categories) {
      if (widget.selectedCategoryId != null &&
          state.categoryDesigns.containsKey(widget.selectedCategoryId)) {
        final designs = state.categoryDesigns[widget.selectedCategoryId]!;
        return {
          widget.selectedCategoryId!: designs,
        };
      } else {
        return state.categoryDesigns;
      }
    }

    if (widget.mode == ViewMode.collections) {
      if (widget.selectedCollectionId != null &&
          state.collectionDesigns.containsKey(widget.selectedCollectionId)) {
        final designs = state.collectionDesigns[widget.selectedCollectionId]!;
        return {
          widget.selectedCollectionId!: designs,
        };
      } else {
        return state.collectionDesigns;
      }
    }

    if (widget.mode == ViewMode.designs) {
      return state.allDesigns;
    }

    return {};
  }

  String _subViewTitle(mode, state, categoryOrCollectionId, Language language) {
    if (mode == ViewMode.designs) {
      return context.local(Translation.allDesigns);
    }

    return (mode == ViewMode.categories ? state.categories : state.collections)
        .firstWhere((c) => c.id == categoryOrCollectionId)
        .names[language]!;
  }

  _subViewDesigns(Map<String, List<String>> pieceIdsByDesignIds, designsById) {
    final designIds = pieceIdsByDesignIds.keys.toList();
    return designIds.map((id) => designsById[id]).whereType<Design>().toList();
  }

  // Note: We need to calculate the width of the photos in the parent of the sub views
  GridParams _commonGridParams(BuildContext context,
      Map<String, Map<String, List<String>>> groupedDesigns) {
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth = screenWidth - 2 * sideMargin;
    final itemsPerRowEstimate = (availableWidth + horizontalGridSpacing) ~/
        (minPhotoWidth + horizontalGridSpacing);

    double width = 0.0;
    int itemsPerRow = 0;

    for (var entry in groupedDesigns.entries) {
      final designsCount = entry.value.length;
      final itemsPerThisRow = itemsPerRowEstimate.clamp(1, designsCount);
      if (itemsPerThisRow > itemsPerRow) itemsPerRow = itemsPerThisRow;

      double totalSpacing = horizontalGridSpacing * (itemsPerThisRow - 1);
      double photoWidth = ((availableWidth - totalSpacing) / itemsPerThisRow)
          .clamp(minPhotoWidth, maxPhotoWidth);
      if (width == 0.0 || photoWidth < width) {
        width = photoWidth;
      }
    }

    return GridParams(
      itemsPerRow: itemsPerRow,
      photoWidth: width,
    );
  }
}
