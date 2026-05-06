import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/features/designs/domain/bloc/barrel.dart';
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
  String get scrollTargetName => ViewMode.designs.fixedScrollTargetName;

  void _onRetry() => context.read<DesignsBloc>().add(FetchDesigns());

  @override
  Widget build(BuildContext context) {
    final language = context.select((LanguageBloc b) => b.state.language);

    return PageBase(
      scrollController: scrollController,
      pageBody: BlocBuilder<DesignsBloc, DesignsState>(
        builder: (context, state) {
          final designs = state.designs;
          final representativePieces = state.representativePieces;
          final gridParams = computeGridParams(context, [designs.length]);

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
      ),
    );
  }
}
