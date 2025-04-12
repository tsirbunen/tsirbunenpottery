import 'package:flutter/material.dart';
import 'package:madmudmobile/features/products/domain/models/design/design.dart';
import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/widgets/photo_with_fallback/photo_with_fallback.dart';

class DesignCard extends StatelessWidget {
  final Design design;
  final Language language;
  final double photoWidth;
  final double photoHeight;
  final List<String> pieceIds;

  const DesignCard({
    super.key,
    required this.design,
    required this.language,
    required this.pieceIds,
    this.photoWidth = 200.0,
    this.photoHeight = 150.0,
  });

  @override
  Widget build(BuildContext context) {
    final designName = design.names[language] ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PhotoWithFallback(
          size: Size(photoWidth, photoHeight),
        ),
        Text(designName),
      ],
    );
  }
}
