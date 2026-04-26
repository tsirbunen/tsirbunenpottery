import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_state.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';
import 'package:tsirbunenpottery/localization/languages.dart';
import 'package:tsirbunenpottery/widgets/bloc_status_view/bloc_status_view.dart';
import 'package:tsirbunenpottery/widgets/footer/footer.dart';
import 'package:tsirbunenpottery/widgets/items_grid/barrel.dart';

class GroupedItemsView extends StatelessWidget {
  final BlocStatus blocStatus;
  final Map<String, Map<String, List<String>>> groupedDesigns;
  final String? selectedGroupId;
  final Map<String, Design> designsById;
  final List<Piece> allPieces;
  final Map<String, List<String>> imageFileNamesByDesignId;
  final ViewMode viewMode;
  final String Function(String groupId, Language language) groupTitle;
  final void Function(BuildContext context, String id) onNavigate;
  final VoidCallback onRetry;

  const GroupedItemsView({
    super.key,
    required this.blocStatus,
    required this.groupedDesigns,
    this.selectedGroupId,
    required this.designsById,
    required this.allPieces,
    required this.imageFileNamesByDesignId,
    required this.viewMode,
    required this.groupTitle,
    required this.onNavigate,
    required this.onRetry,
  });

  Map<String, Map<String, List<String>>> _visibleGroups() {
    if (selectedGroupId != null &&
        groupedDesigns.containsKey(selectedGroupId)) {
      return {selectedGroupId!: groupedDesigns[selectedGroupId]!};
    }
    return groupedDesigns;
  }

  ItemsGrid _buildItemsGridForGroup(
    String groupId,
    Map<String, List<String>> pieceIdsByDesignId,
    Language language,
    GridParams gridParams,
  ) {
    final designs = pieceIdsByDesignId.keys
        .map((id) => designsById[id])
        .whereType<Design>()
        .toList();

    final pieceIds = pieceIdsByDesignId.values.expand((ids) => ids).toSet();
    final pieces = allPieces.where((p) => pieceIds.contains(p.id)).toList();

    return ItemsGrid(
      id: groupId,
      title: groupTitle(groupId, language),
      designs: designs,
      pieces: pieces,
      imageFileNamesByDesignId: imageFileNamesByDesignId,
      language: language,
      gridParams: gridParams,
      mode: viewMode,
      onNavigate: onNavigate,
      isTheOnlySubView: selectedGroupId != null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final visibleGroups = _visibleGroups();
    final gridParams = computeGridParams(
      context,
      visibleGroups.values.map((v) => v.length).toList(),
    );

    return BlocSelector<LanguageBloc, LanguageState, Language>(
      selector: (state) => state.language,
      builder: (context, language) {
        return BlocStatusView(
          status: blocStatus,
          onRetry: onRetry,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...visibleGroups.entries.map(
                (group) => _buildItemsGridForGroup(group.key, group.value, language, gridParams),
              ),
              const Footer(),
            ],
          ),
        );
      },
    );
  }
}
