import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';
import 'package:tsirbunenpottery/widgets/items_grid/piece_card.dart';
import 'package:tsirbunenpottery/theme/app_icons.dart';
import 'package:tsirbunenpottery/widgets/action_button/action_button.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/utils/app_spacing.dart';
import 'package:tsirbunenpottery/utils/app_gaps.dart';
import 'package:tsirbunenpottery/utils/app_layout_constants.dart';
import 'package:tsirbunenpottery/widgets/items_grid/models.dart';
import 'package:tsirbunenpottery/widgets/items_grid/scroll_position_mixin.dart';
import 'package:tsirbunenpottery/widgets/items_grid/title_with_hover_effect.dart';
import 'package:tsirbunenpottery/localization/languages.dart';


class ItemsGrid extends StatefulWidget {
  final String title;
  final String id;
  final List<Design> designs;
  final List<Piece> pieces;
  final Language language;
  final Map<String, List<String>> imageFileNamesByDesignId;
  final GridParams gridParams;
  final ViewMode mode;
  final bool isTheOnlySubView;
  final void Function(BuildContext, String id)? onNavigate;

  const ItemsGrid({
    super.key,
    required this.title,
    required this.id,
    required this.designs,
    required this.pieces,
    required this.language,
    required this.imageFileNamesByDesignId,
    required this.gridParams,
    required this.mode,
    required this.isTheOnlySubView,
    this.onNavigate,
  });

  String get scrollTargetName {
    return mode.scrollTargetName(id, id, isHorizontal: true);
  }

  @override
  State<ItemsGrid> createState() => _ItemsGridState();
}

class _ItemsGridState extends State<ItemsGrid>
    with ScrollPositionMixin<ItemsGrid> {
  @override
  String get scrollTargetName => widget.scrollTargetName;
  bool expandAll = false;
  late Map<String, Design> _designsById;

  @override
  void initState() {
    super.initState();
    _designsById = {for (final d in widget.designs) d.id: d};
  }

  @override
  void didUpdateWidget(ItemsGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.designs != oldWidget.designs) {
      _designsById = {for (final d in widget.designs) d.id: d};
    }
  }

  @override
  Widget build(BuildContext context) {
    final isNarrow = widget.gridParams.availableWidth < AppLayoutConstants.showExpandBreakpoint;
    final size = _photoSize(isNarrow);
    final horizontalAlignment =
        isNarrow ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final designsById = _designsById;

    return Column(
      crossAxisAlignment: horizontalAlignment,
      children: [
        Container(
          margin: const EdgeInsets.only(top: AppSpacing.spacing25),
          // FIXME: This component works in development and production, but fails in tests
          // due to horizontal overflow. Figure out the problem.
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TitleWithHoverEffect(
                  title: widget.title,
                  onTap: (context) => _navigateTo(context),
                  showEffect: !widget.isTheOnlySubView,
                ),
              ),
              if (_showExpandCollapseButton())
                Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.spacing10),
                  child: ActionButton(
                      iconData: expandAll
                          ? AppIcons.expandUp
                          : AppIcons.expandDown,
                      onPressed: _toggleShowAll),
                )
            ],
          ),
        ),
        AppGaps.v10,
        Container(
          margin: const EdgeInsets.only(
              left: AppLayoutConstants.horizontalGridSpacing,
              bottom: AppSpacing.spacing20),
          child: expandAll || widget.isTheOnlySubView
              ? Wrap(
                  spacing: AppLayoutConstants.horizontalGridSpacing,
                  runSpacing: AppLayoutConstants.verticalGridSpacing,
                  children: widget.pieces.expand((piece) {
                    final design = designsById[piece.designId];
                    if (design == null) return const <Widget>[];
                    return [
                      PieceCard(
                        piece: piece,
                        design: design,
                        language: widget.language,
                        size: size,
                      ),
                    ];
                  }).toList(),
                )
              : SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: widget.pieces.expand((piece) {
                      final design = designsById[piece.designId];
                      if (design == null) return const <Widget>[];
                      return [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: AppLayoutConstants.horizontalGridSpacing),
                          child: PieceCard(
                            piece: piece,
                            design: design,
                            language: widget.language,
                            size: size,
                          ),
                        ),
                      ];
                    }).toList(),
                  ),
                ),
        ),
      ],
    );
  }

  void _navigateTo(BuildContext context) {
    widget.onNavigate?.call(context, widget.id);
  }

  Size _photoSize(bool isNarrow) {
    final subtraction = widget.isTheOnlySubView ? 0.0 : AppLayoutConstants.groupedRowPhotoWidthInset;
    final availableWidthPerPhoto =
        widget.gridParams.availableWidth / AppLayoutConstants.narrowColumnsCount;
    final adjustedPhotoWidth =
        isNarrow ? availableWidthPerPhoto : widget.gridParams.photoWidth;
    final width = (adjustedPhotoWidth - AppLayoutConstants.horizontalGridSpacing) - subtraction;
    return Size(width, width * AppDimensions.gridPhotoAspectRatio);
  }

  bool _showExpandCollapseButton() {
    final expandNeeded = widget.designs.length > widget.gridParams.itemsPerRow;
    final canShowExpand =
        AppLayoutConstants.showExpandBreakpoint < MediaQuery.of(context).size.width;
    return expandNeeded && canShowExpand && !widget.isTheOnlySubView;
  }

  void _toggleShowAll() {
    setState(() {
      expandAll = !expandAll;
    });
  }
}
