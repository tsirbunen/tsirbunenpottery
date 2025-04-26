import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madmudmobile/app/blocs/blocs.dart';
import 'package:madmudmobile/app/scroll_and_route_bloc/scroll_and_route_bloc.dart';
import 'package:madmudmobile/app/scroll_and_route_bloc/scroll_and_route_event.dart';
import 'package:madmudmobile/widgets/action_button/action_button.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:madmudmobile/features/products/domain/models/design/design.dart';
import 'package:madmudmobile/features/products/presentation/products_view/design_card.dart';
import 'package:madmudmobile/features/products/presentation/products_view/models.dart';
import 'package:madmudmobile/features/products/presentation/products_view/scroll_position_mixin.dart';
import 'package:madmudmobile/features/products/presentation/products_view/title_with_hover_effect.dart';
import 'package:madmudmobile/localization/languages.dart';

// Note: Let's subtract some space from the photo width (if single row) as a guide to
// the user to scroll horizontally to see more designs
const double singleRowSubtraction = 15.0;
const double horizontalGridSpacing = 15.0;
const double verticalGridSpacing = 20.0;
const double minPhotoWidth = 175.0;
const double maxPhotoWidth = 300.0;
const double sideMargin = 25.0;
const double showExpandBreakpoint = 700.0;

class ProductsSubView extends StatefulWidget {
  final String title;
  final String id;
  final List<Design> designs;
  final Language language;
  final Map<String, List<String>> pieceIdsByDesignIds;
  final GridParams gridParams;
  final ViewMode mode;
  final bool isTheOnlySubView;

  const ProductsSubView({
    super.key,
    required this.title,
    required this.id,
    required this.designs,
    required this.language,
    required this.pieceIdsByDesignIds,
    required this.gridParams,
    required this.mode,
    required this.isTheOnlySubView,
  });

  String get scrollTargetName {
    return mode.scrollTargetName(id, id, isHorizontal: true);
  }

  @override
  State<ProductsSubView> createState() => _ProductsSubViewState();
}

class _ProductsSubViewState extends State<ProductsSubView>
    with ScrollPositionMixin<ProductsSubView> {
  @override
  String get scrollTargetName => widget.scrollTargetName;
  bool expandAll = false;

  @override
  Widget build(BuildContext context) {
    final size = _photoSize();
    final fromRoute = _fromRoute();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 0.0, top: 30.0),
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
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ActionButton(
                      iconData: expandAll
                          ? Symbols.keyboard_arrow_up
                          : Symbols.keyboard_arrow_down,
                      onPressed: _toggleShowAll),
                )
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          margin: const EdgeInsets.only(left: 25.0, right: 0.0, bottom: 20.0),
          child: expandAll || widget.isTheOnlySubView
              ? Wrap(
                  spacing: horizontalGridSpacing,
                  runSpacing: verticalGridSpacing,
                  children: widget.designs.map((design) {
                    final pieceIds =
                        widget.pieceIdsByDesignIds[design.id] ?? [];
                    return DesignCard(
                      design: design,
                      language: widget.language,
                      pieceIds: pieceIds,
                      size: size,
                      fromRoute: fromRoute,
                    );
                  }).toList(),
                )
              : SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: widget.designs.map((design) {
                      final pieceIds =
                          widget.pieceIdsByDesignIds[design.id] ?? [];

                      return Padding(
                        padding:
                            const EdgeInsets.only(right: horizontalGridSpacing),
                        child: DesignCard(
                          design: design,
                          language: widget.language,
                          pieceIds: pieceIds,
                          size: size,
                          fromRoute: fromRoute,
                        ),
                      );
                    }).toList(),
                  ),
                ),
        ),
      ],
    );
  }

  void _navigateTo(BuildContext context) {
    final routeRoot = widget.mode.routeRoot();
    final layoutBloc = getIt.get<ScrollAndRouteBloc>();
    // FIXME: Should we also reset possible current history?
    layoutBloc.add(AddToHistory(route: _fromRoute()));
    context.go('$routeRoot/${widget.id}');
  }

  Size _photoSize() {
    final subtraction = widget.isTheOnlySubView ? 0.0 : singleRowSubtraction;
    final width = widget.gridParams.photoWidth - subtraction;
    return Size(width, width * 0.75);
  }

  bool _showExpandCollapseButton() {
    final expandNeeded = widget.designs.length > widget.gridParams.itemsPerRow;
    final canShowExpand =
        showExpandBreakpoint < MediaQuery.of(context).size.width;
    return expandNeeded && canShowExpand && !widget.isTheOnlySubView;
  }

  void _toggleShowAll() {
    setState(() {
      expandAll = !expandAll;
    });
  }

  String _fromRoute() {
    final routeRoot = widget.mode.routeRoot();
    if (widget.mode == ViewMode.designs) routeRoot;

    return widget.isTheOnlySubView ? '$routeRoot/${widget.id}' : routeRoot;
  }
}
