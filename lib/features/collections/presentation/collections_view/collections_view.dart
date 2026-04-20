import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_state.dart';
import 'package:tsirbunenpottery/localization/languages.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/bootstrap/router/routes.dart';
import 'package:tsirbunenpottery/widgets/items_grid/barrel.dart';
import 'package:tsirbunenpottery/widgets/footer/footer.dart';
import 'package:tsirbunenpottery/widgets/bloc_status_view/bloc_status_view.dart';
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

  void _onRetry() => context.read<CollectionsBloc>().add(FetchCollections());

  @override
  Widget build(BuildContext context) {
    return PageBase(
      scrollController: scrollController,
      pageBody: BlocBuilder<CollectionsBloc, CollectionsState>(
        builder: (context, state) {
          final groupedDesigns = _designsToShow(state);
          final allPieces = state.allPieces;
          final gridParams = computeGridParams(context, groupedDesigns);
          final collectionsById = state.collectionsById;

          return BlocSelector<LanguageBloc, LanguageState, Language>(
            selector: (langState) => langState.language,
            builder: (context, language) {
              return BlocStatusView(
                status: state.blocStatus,
                onRetry: _onRetry,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...groupedDesigns.entries.expand((entry) {
                      final collectionId = entry.key;
                      final collection = collectionsById[collectionId];
                      if (collection == null) return const <Widget>[];

                      final pieceIdsByDesignId = entry.value;

                      final designs = pieceIdsByDesignId.keys
                          .map((id) => state.designsById[id])
                          .whereType<Design>()
                          .toList();

                      final pieceIds = pieceIdsByDesignId.values
                          .expand((ids) => ids)
                          .toSet();
                      final pieces = allPieces
                          .where((p) => pieceIds.contains(p.id))
                          .toList();

                      return [
                        ItemsGrid(
                          id: collectionId,
                          title: collection.names[language] ?? '',
                          designs: designs,
                          pieces: pieces,
                          imageFileNamesByDesignId:
                              state.imageFileNamesByDesignId,
                          language: language,
                          gridParams: gridParams,
                          isTheOnlySubView: widget.selectedCollectionId != null,
                          mode: ViewMode.collections,
                          onNavigate: (context, id) =>
                              CollectionRoute(id: id).push(context),
                        )
                      ];
                    }),
                    const Footer(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Map<String, Map<String, List<String>>> _designsToShow(
      CollectionsState state) {
    if (widget.selectedCollectionId != null &&
        state.collectionDesigns.containsKey(widget.selectedCollectionId)) {
      return {
        widget.selectedCollectionId!:
            state.collectionDesigns[widget.selectedCollectionId]!,
      };
    }
    return state.collectionDesigns;
  }

}
