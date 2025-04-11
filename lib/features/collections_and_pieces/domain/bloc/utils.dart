import 'package:madmudmobile/features/collections_and_pieces/domain/models/design/design.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/models/piece/piece.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/models/products/products.dart';

Map<String, dynamic> organizeProductsData(Products products) {
  final Map<String, Piece> piecesById = {};
  final Map<String, Design> designsById = {};
  final Map<String, Map<String, List<String>>> collectionDesigns = {};
  final Map<String, Map<String, List<String>>> categoryDesigns = {};

  for (var design in products.designs) {
    designsById[design.id] = design;
  }

  for (final piece in products.pieces) {
    piecesById[piece.id] = piece;
    final designId = piece.designId;
    final design = designsById[designId];
    if (design != null) {
      final categoryIds = design.categoryIds ?? [];
      for (var categoryId in categoryIds) {
        if (!categoryDesigns.containsKey(categoryId)) {
          categoryDesigns[categoryId] = {};
        }

        if (!categoryDesigns[categoryId]!.containsKey(design.id)) {
          categoryDesigns[categoryId]![design.id] = [];
        }

        categoryDesigns[categoryId]![design.id]!.add(piece.id);
      }
    }

    final collectionId = piece.collectionId;
    if (collectionId != null) {
      if (!collectionDesigns.containsKey(collectionId)) {
        collectionDesigns[collectionId] = {};
      }

      if (!collectionDesigns[collectionId]!.containsKey(designId)) {
        collectionDesigns[collectionId]![designId] = [];
      }

      if (!collectionDesigns[collectionId]![designId]!.contains(piece.id)) {
        collectionDesigns[collectionId]![designId]!.add(piece.id);
      }
    }
  }

  return {
    'piecesById': piecesById,
    'designsById': designsById,
    'collectionDesigns': collectionDesigns,
    'categoryDesigns': categoryDesigns,
    'collections': products.collections,
    'categories': products.categories,
  };
}
