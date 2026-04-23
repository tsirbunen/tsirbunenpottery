import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/bootstrap/router/routes.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/widgets/grouped_items_view/grouped_items_view.dart';
import 'package:tsirbunenpottery/widgets/items_grid/barrel.dart';
import 'package:tsirbunenpottery/widgets/page_base/page_base.dart';

class CollectionsView extends StatefulWidget {
  final String? selectedCollectionId;

  const CollectionsView({super.key, this.selectedCollectionId});

  String get scrollTargetName =>
      ViewMode.collections.scrollTargetName(null, selectedCollectionId);

  @override
  State<CollectionsView> createState() => _CollectionsViewState();
}

class _CollectionsViewState extends State<CollectionsView>
    with ScrollPositionMixin<CollectionsView> {
  @override
  String get scrollTargetName => widget.scrollTargetName;

  @override
  Widget build(BuildContext context) {
    return PageBase(
      scrollController: scrollController,
      pageBody: BlocBuilder<CollectionsBloc, CollectionsState>(
        builder: (context, state) => GroupedItemsView(
          blocStatus: state.blocStatus,
          groupedDesigns: state.collectionDesigns,
          selectedGroupId: widget.selectedCollectionId,
          designsById: state.designsById,
          allPieces: state.allPieces,
          imageFileNamesByDesignId: state.imageFileNamesByDesignId,
          viewMode: ViewMode.collections,
          groupTitle: (id, lang) =>
              state.collectionsById[id]?.names[lang] ?? '',
          onNavigate: (ctx, id) => CollectionRoute(id: id).push(ctx),
          onRetry: () =>
              context.read<CollectionsBloc>().add(FetchCollections()),
        ),
      ),
    );
  }
}
