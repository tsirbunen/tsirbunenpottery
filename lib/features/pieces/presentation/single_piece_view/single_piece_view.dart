import 'package:tsirbunenpottery/features/pieces/domain/bloc/pieces_bloc.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/bootstrap/router/route_enum.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/features/pieces/domain/bloc/pieces_state.dart';
import 'package:tsirbunenpottery/features/pieces/presentation/single_piece_view/design_description.dart';
import 'package:tsirbunenpottery/features/pieces/presentation/single_piece_view/piece_photos.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/utils/app_spacing.dart';
import 'package:tsirbunenpottery/utils/app_gaps.dart';
import 'package:tsirbunenpottery/widgets/bloc_status_view/bloc_status_view.dart';
import 'package:tsirbunenpottery/widgets/footer/footer.dart';
import 'package:tsirbunenpottery/widgets/page_base/page_base.dart';

class SinglePieceView extends StatelessWidget {
  final String id;

  const SinglePieceView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final language = context.select((LanguageBloc b) => b.state.language);

    return PageBase(
      pageBody: BlocBuilder<PiecesBloc, PiecesState>(
        builder: (context, state) {
          final piece = state.piecesById[id];
          final designId = piece?.designId;
          final design = state.designsById[designId];
          final designName = design?.names[language];

          return BlocStatusView(
            status: state.blocStatus,
            child: (design == null || designName == null || piece == null)
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          context.local(Translation.pieceNotFound),
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        AppGaps.v15,
                        OutlinedButton(
                          onPressed: () => context.go(RouteEnum.pieces.path()),
                          child: Text(context.local(Translation.backToPieces)),
                        ),
                      ],
                    ),
                  )
                : LayoutBuilder(
                    builder: (context, constraints) {
                      final hasRoomForRow = constraints.maxWidth > AppDimensions.singlePieceViewMaxWidth;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(AppSpacing.spacing20),
                            child: hasRoomForRow
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      PiecePhotos(photoNames: piece.imageFileNames),
                                      AppGaps.h20,
                                      Flexible(
                                        child: ConstrainedBox(
                                          constraints: const BoxConstraints(maxWidth: AppDimensions.singlePieceViewMaxWidth),
                                          child: DesignDescription(language: language, design: design),
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      PiecePhotos(photoNames: piece.imageFileNames),
                                      AppGaps.v20,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing15),
                                        child: DesignDescription(language: language, design: design),
                                      ),
                                    ],
                                  ),
                          ),
                          const Footer(),
                        ],
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
