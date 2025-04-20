import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madmudmobile/app/router/routes.dart';
import 'package:madmudmobile/features/products/domain/models/design/design.dart';
import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/widgets/photo_with_fallback/photo_with_fallback.dart';

// FIXME: Change this temporary base URL once real URLs are available
const baseUrl =
    'https://raw.githubusercontent.com/tsirbunen/madmudmobile/main/assets/';

class DesignCard extends StatelessWidget {
  final Design design;
  final Language language;
  final List<String> pieceIds;
  final Size size;
  final String fromRoute;

  const DesignCard({
    super.key,
    required this.design,
    required this.language,
    required this.pieceIds,
    required this.fromRoute,
    this.size = const Size(200.0, 150.0),
  });

  @override
  Widget build(BuildContext context) {
    final designName = design.names[language] ?? '';

    return GestureDetector(
      onTap: () => _navigateTo(
        context,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhotoWithFallback(
            photo: _photo(),
            size: size,
            zoomOnHover: true,
          ),
          Text(designName),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context) {
    final uri = Uri(
      path: '$designsRoot/${design.id}',
      queryParameters: {'fromRoute': fromRoute},
    );

    context.go(uri.toString());
  }

  Photo _photo() {
    // FIXME: Change this temporary base URL once real URLs are available
    final photoUrls = [
      'espresso.png',
      'plants.png',
      'espresso.png',
      'soap.png',
      'soap.png'
    ];
    final randomIndexBetween0and2 = Random().nextInt(5);
    final url = '$baseUrl${photoUrls[randomIndexBetween0and2]}';
    return Photo(id: 0, url: url);
  }
}
