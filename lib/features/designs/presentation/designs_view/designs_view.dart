import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_state.dart';
import 'package:tsirbunenpottery/localization/languages.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/widgets/items_grid/barrel.dart';
import 'package:tsirbunenpottery/widgets/footer/footer.dart';
import 'package:tsirbunenpottery/widgets/bloc_status_view/bloc_status_view.dart';
import 'package:tsirbunenpottery/widgets/page_base/page_base.dart';

class DesignsView extends StatefulWidget {
  const DesignsView({super.key});

  @override
  State<DesignsView> createState() => _DesignsViewState();
}

class _DesignsViewState extends State<DesignsView>
    with ScrollPositionMixin<DesignsView> {
  @override
  String get scrollTargetName => ViewMode.designs.scrollTargetName(null, null);

  void _onRetry() => context.read<DesignsBloc>().add(FetchDesigns());

  @override
  Widget build(BuildContext context) {
    return PageBase(
      scrollController: scrollController,
      pageBody: BlocBuilder<DesignsBloc, DesignsState>(
        builder: (context, state) {
          final designs = state.designsById.values.toList();

          // One representative piece per design for the overview grid.
          final representativePieces = designs
              .map((d) => state.piecesByDesignId[d.id]?.firstOrNull)
              .whereType<Piece>()
              .toList();

          final gridParams = _gridParams(context, designs.length);

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
                    ItemsGrid(
                      id: 'designs',
                      title: context.local(Translation.allDesigns),
                      designs: designs,
                      pieces: representativePieces,
                      imageFileNamesByDesignId: state.imageFileNamesByDesignId,
                      language: language,
                      gridParams: gridParams,
                      mode: ViewMode.designs,
                      isTheOnlySubView: true,
                    ),
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

  GridParams _gridParams(BuildContext context, int designCount) {
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth = screenWidth - 2 * sideMargin;
    final itemsPerRowEstimate = (availableWidth + horizontalGridSpacing) ~/
        (defaultMinPhotoWidth + horizontalGridSpacing);

    if (designCount == 0) {
      return GridParams(
        itemsPerRow: 0,
        photoWidth: 0,
        availableWidth: availableWidth,
      );
    }

    final itemsPerRow = itemsPerRowEstimate.clamp(1, designCount);
    final totalSpacing = horizontalGridSpacing * (itemsPerRow - 1);
    final photoWidth =
        ((availableWidth - totalSpacing) / itemsPerRow)
            .clamp(defaultMinPhotoWidth, defaultMaxPhotoWidth);

    return GridParams(
      itemsPerRow: itemsPerRow,
      photoWidth: photoWidth,
      availableWidth: availableWidth,
    );
  }
}
