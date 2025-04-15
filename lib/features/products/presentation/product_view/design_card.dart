import 'dart:math';
import 'package:flutter/material.dart';
import 'package:madmudmobile/features/products/domain/models/design/design.dart';
import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/widgets/photo_with_fallback/photo_with_fallback.dart';

class DesignCard extends StatelessWidget {
  final Design design;
  final Language language;
  final List<String> pieceIds;
  final Size size;

  const DesignCard({
    super.key,
    required this.design,
    required this.language,
    required this.pieceIds,
    this.size = const Size(200.0, 150.0),
  });

  @override
  Widget build(BuildContext context) {
    final designName = design.names[language] ?? '';

    // FIXME: Remove this temporary base URL once real URLs are available
    const temporaryBaseUrl =
        'https://raw.githubusercontent.com/tsirbunen/madmudmobile/main/assets/';
    final photoUrls = ['espresso.png', 'plants.png', 'soap.png'];
    final randomIndexBetween0and2 = Random().nextInt(3);
    final photo = Photo(
        id: 0, url: '$temporaryBaseUrl${photoUrls[randomIndexBetween0and2]}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PhotoWithFallback(
          photo: photo,
          size: size,
        ),
        Text(designName),
      ],
    );
  }
}
