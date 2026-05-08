import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/bootstrap/router/routes.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/widgets/grouped_items_view/grouped_items_view.dart';
import 'package:tsirbunenpottery/widgets/items_grid/barrel.dart';
import 'package:tsirbunenpottery/widgets/page_base/page_base.dart';

class CategoriesView extends StatefulWidget {
  final String? selectedCategoryId;

  const CategoriesView({super.key, this.selectedCategoryId});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView>
    with ScrollPositionMixin<CategoriesView> {
  @override
  String get scrollTargetName =>
      ViewMode.categories.scrollTargetName(widget.selectedCategoryId);

  @override
  Widget build(BuildContext context) {
    return PageBase(
      scrollController: scrollController,
      pageBody: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) => GroupedItemsView(
          blocStatus: state.blocStatus,
          groupedDesigns: state.categoryDesigns,
          selectedGroupId: widget.selectedCategoryId,
          designsById: state.designsById,
          piecesById: state.piecesById,
          imageFileNamesByDesignId: state.imageFileNamesByDesignId,
          viewMode: ViewMode.categories,
          groupTitle: (id, lang) =>
              state.categoriesById[id]?.names[lang] ?? '',
          onNavigate: (ctx, id) => CategoryRoute(id: id).push(ctx),
          onRetry: () =>
              context.read<CategoriesBloc>().add(FetchCategories()),
        ),
      ),
    );
  }
}
