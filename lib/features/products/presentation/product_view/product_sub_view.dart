import 'package:flutter/material.dart';
import 'package:madmudmobile/features/products/domain/models/design/design.dart';
import 'package:madmudmobile/features/products/presentation/product_view/design_card.dart';
import 'package:madmudmobile/localization/languages.dart';

const double horizontalGridSpacing = 15.0;
const double verticalGridSpacing = 20.0;
const double minPhotoWidth = 200.0;
const double maxPhotoWidth = 400.0;
const double sideMargin = 25.0;
// Note: Let's subtract some space from the photo width (if single row) as a guide to
// the user to scroll horizontally to see more designs
const double singleRowSubtraction = 15.0;

class ProductSubView extends StatelessWidget {
  final String title;
  final List<Design> designs;
  final Language language;
  final Map<String, List<String>> pieceIdsByDesignIds;
  final double photoWidth;
  final bool isSingleRow;

  const ProductSubView({
    super.key,
    required this.title,
    required this.designs,
    required this.language,
    required this.pieceIdsByDesignIds,
    required this.photoWidth,
    this.isSingleRow = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = _photoSize(isSingleRow);

    return Container(
      margin: const EdgeInsets.only(
          left: 25.0, right: 0.0, top: 30.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: _titleStyle(context)),
          const SizedBox(height: 10.0),
          isSingleRow
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: designs.map((design) {
                      final pieceIds = pieceIdsByDesignIds[design.id] ?? [];

                      return Padding(
                        padding:
                            const EdgeInsets.only(right: horizontalGridSpacing),
                        child: DesignCard(
                          design: design,
                          language: language,
                          pieceIds: pieceIds,
                          size: size,
                        ),
                      );
                    }).toList(),
                  ),
                )
              : Wrap(
                  spacing: horizontalGridSpacing,
                  runSpacing: verticalGridSpacing,
                  children: designs.map((design) {
                    final pieceIds = pieceIdsByDesignIds[design.id] ?? [];
                    return DesignCard(
                      design: design,
                      language: language,
                      pieceIds: pieceIds,
                      size: size,
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }

  Size _photoSize(bool isSingleRow) {
    final width = isSingleRow && designs.length > 1
        ? photoWidth - singleRowSubtraction
        : photoWidth;

    return Size(width, width * 0.75);
  }

  TextStyle _titleStyle(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontWeight: FontWeight.w600,
        );
  }
}
