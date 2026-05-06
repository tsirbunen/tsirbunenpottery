import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/bootstrap/router/routes.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';
import 'package:tsirbunenpottery/localization/languages.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/utils/app_gaps.dart';
import 'package:tsirbunenpottery/utils/app_image_refs.dart';
import 'package:tsirbunenpottery/widgets/photo_with_fallback/photo.dart';
import 'package:tsirbunenpottery/widgets/photo_with_fallback/photo_with_fallback.dart';

class PieceCard extends StatelessWidget {
  final Design design;
  final Piece piece;
  final Language language;
  final Size size;

  const PieceCard({
    super.key,
    required this.design,
    required this.piece,
    required this.language,
    this.size = AppDimensions.pieceCardDefaultSize,
  });

  @override
  Widget build(BuildContext context) {
    final designName = design.names[language] ?? '';

    return GestureDetector(
      onTap: () => _navigateTo(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhotoWithFallback(
            photo: _photo(piece.imageFileNames),
            size: size,
            zoomOnHover: true,
          ),
          AppGaps.v5,
          SizedBox(
            width: size.width,
            child: Text(designName,
                style: _titleStyle(context),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context) {
    PieceRoute(id: piece.id).push(context);
  }

  Photo? _photo(List<String> imageFileNames) {
    if (imageFileNames.isEmpty) return null;
    final fileName = imageFileNames[0];
    return Photo(id: fileName, url: "$photoBaseUrl$fileName");
  }

  TextStyle _titleStyle(BuildContext context) {
    return Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(overflow: TextOverflow.ellipsis) ??
        const TextStyle(overflow: TextOverflow.ellipsis);
  }
}
