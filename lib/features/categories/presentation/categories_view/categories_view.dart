import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_state.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/bootstrap/router/routes.dart';
import 'package:tsirbunenpottery/widgets/items_grid/barrel.dart';
import 'package:tsirbunenpottery/widgets/footer/footer.dart';
import 'package:tsirbunenpottery/widgets/bloc_status_view/bloc_status_view.dart';
import 'package:tsirbunenpottery/widgets/page_base/page_base.dart';

class CategoriesView extends StatefulWidget {
  final String? selectedCategoryId;

  const CategoriesView({super.key, this.selectedCategoryId});

  String get scrollTargetName =>
      ViewMode.categories.scrollTargetName(selectedCategoryId, null);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView>
    with ScrollPositionMixin<CategoriesView> {
  bool _fetchTriggered = false;

  @override
  String get scrollTargetName => widget.scrollTargetName;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_fetchTriggered) return;
    _fetchTriggered = true;
    context.read<CategoriesBloc>().add(FetchCategories());
  }

  void _onRetry() => context.read<CategoriesBloc>().add(FetchCategories());

  @override
  Widget build(BuildContext context) {
    return PageBase(
      scrollController: scrollController,
      pageBody: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, langState) {
          final language = langState.language;

          return BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              final groupedDesigns = _designsToShow(state);
              final allPieces = state.piecesById.values.toList();
              final gridParams = computeGridParams(context, groupedDesigns);
              final categoriesById = {
                for (final c in state.categories) c.id: c
              };

              return BlocStatusView(
                status: state.blocStatus,
                onRetry: _onRetry,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...groupedDesigns.entries.expand((entry) {
                    final categoryId = entry.key;
                    final category = categoriesById[categoryId];
                    if (category == null) return const <Widget>[];

                    final pieceIdsByDesignId = entry.value;

                    final designs = pieceIdsByDesignId.keys
                        .map((id) => state.designsById[id])
                        .whereType<Design>()
                        .toList();

                    final pieceIds = pieceIdsByDesignId.values
                        .expand((ids) => ids)
                        .toList();
                    final pieces = allPieces
                        .where((p) => pieceIds.contains(p.id))
                        .toList();

                    return [ItemsGrid(
                      id: categoryId,
                      title: category.names[language] ?? '',
                      designs: designs,
                      pieces: pieces,
                      imageFileNamesByDesignId: state.imageFileNamesByDesignId,
                      language: language,
                      gridParams: gridParams,
                      mode: ViewMode.categories,
                      onNavigate: (context, id) =>
                          CategoryRoute(id: id).push(context),
                      isTheOnlySubView: widget.selectedCategoryId != null,
                    )];
                  }),
                  const Footer(),
                ],
              ));
            },
          );
        },
      ),
    );
  }

  Map<String, Map<String, List<String>>> _designsToShow(CategoriesState state) {
    if (widget.selectedCategoryId != null &&
        state.categoryDesigns.containsKey(widget.selectedCategoryId)) {
      return {
        widget.selectedCategoryId!:
            state.categoryDesigns[widget.selectedCategoryId]!,
      };
    }
    return state.categoryDesigns;
  }

}
