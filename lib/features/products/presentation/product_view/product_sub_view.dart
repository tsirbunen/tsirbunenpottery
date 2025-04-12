import 'package:flutter/material.dart';
import 'package:madmudmobile/features/products/domain/models/design/design.dart';
import 'package:madmudmobile/features/products/presentation/product_view/design_card.dart';
import 'package:madmudmobile/localization/languages.dart';

const double horizontalGridSpacing = 10.0;
const double verticalGridSpacing = 20.0;
const double minPhotoWidth = 200.0;
const double maxPhotoWidth = 400.0;
const double sideMargin = 25.0;

class ProductSubView extends StatelessWidget {
  final String title;
  final List<Design> designs;
  final Language language;
  final Map<String, List<String>> pieceIdsByDesignIds;

  const ProductSubView({
    super.key,
    required this.title,
    required this.designs,
    required this.language,
    required this.pieceIdsByDesignIds,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth = screenWidth - 2 * sideMargin;

    final itemsPerRowEstimate = (availableWidth + horizontalGridSpacing) ~/
        (minPhotoWidth + horizontalGridSpacing);
    final itemsPerRow = itemsPerRowEstimate.clamp(1, designs.length);

    double totalSpacing = horizontalGridSpacing * (itemsPerRow - 1);
    double photoWidth = ((availableWidth - totalSpacing) / itemsPerRow)
        .clamp(minPhotoWidth, maxPhotoWidth);

    final rowCount =
        itemsPerRow == 1 ? 1 : (designs.length / itemsPerRow).ceil();

    return Container(
      margin: const EdgeInsets.only(
          left: 25.0, right: 25.0, top: 30.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: _titleStyle(context)),
          const SizedBox(height: 10.0),
          rowCount == 1
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: designs.map((design) {
                      final pieceIds = pieceIdsByDesignIds[design.id] ?? [];

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: horizontalGridSpacing),
                        child: DesignCard(
                          design: design,
                          language: language,
                          pieceIds: pieceIds,
                          photoWidth: photoWidth,
                          photoHeight: photoWidth * 0.75,
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
                      photoWidth: photoWidth,
                      photoHeight: photoWidth * 0.75,
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }

  TextStyle _titleStyle(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!;
  }
}
