import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_state.dart';
import 'package:tsirbunenpottery/localization/languages.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/pieces_bloc.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/pieces_event.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/pieces_state.dart';
import 'package:tsirbunenpottery/widgets/items_grid/barrel.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/widgets/footer/footer.dart';
import 'package:tsirbunenpottery/widgets/bloc_status_view/bloc_status_view.dart';
import 'package:tsirbunenpottery/widgets/page_base/page_base.dart';

class PiecesView extends StatefulWidget {
  const PiecesView({super.key});

  @override
  State<PiecesView> createState() => _PiecesViewState();
}

class _PiecesViewState extends State<PiecesView>
    with ScrollPositionMixin<PiecesView> {
  @override
  String get scrollTargetName => ViewMode.pieces.scrollTargetName(null, null);

  void _onRetry() => context.read<PiecesBloc>().add(FetchPieces());

  @override
  Widget build(BuildContext context) {
    return PageBase(
      scrollController: scrollController,
      pageBody: BlocBuilder<PiecesBloc, PiecesState>(
        builder: (context, state) {
          final allDesigns = state.allDesigns;
          final allPieces = state.allPieces;
          final gridParams = computeGridParams(context, [allDesigns.length]);

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
                      id: 'pieces',
                      title: context.local(Translation.allPieces),
                      designs: allDesigns,
                      pieces: allPieces,
                      imageFileNamesByDesignId: state.imageFileNamesByDesignId,
                      language: language,
                      gridParams: gridParams,
                      mode: ViewMode.pieces,
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

}
