import 'package:equatable/equatable.dart';
import 'package:madmudmobile/app/blocs/bloc_status.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/models/category/category.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/models/collection/collection.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/models/design/design.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/models/piece/piece.dart';

class CollectionsAndPiecesState extends Equatable {
  final BlocStatus blocStatus;
  final List<Collection> collections;
  final List<Category> categories;
  final Map<String, Piece> piecesById;
  final Map<String, Design> designsById;
  final Map<String, Map<String, List<String>>> collectionDesigns;
  final Map<String, Map<String, List<String>>> categoryDesigns;

  const CollectionsAndPiecesState({
    this.blocStatus = const BlocStatus(Status.ok),
    this.piecesById = const {},
    this.designsById = const {},
    this.collections = const [],
    this.categories = const [],
    this.collectionDesigns = const {},
    this.categoryDesigns = const {},
  });

  CollectionsAndPiecesState copyWithStateChange({BlocStatus? newStatus}) {
    return CollectionsAndPiecesState(
      blocStatus: newStatus ?? blocStatus,
      piecesById: piecesById,
      designsById: designsById,
      collections: collections,
      categories: categories,
      collectionDesigns: collectionDesigns,
      categoryDesigns: categoryDesigns,
    );
  }

  @override
  List<Object?> get props => [
        blocStatus,
        // Note: The products data is not expected to change while user is using the app.
        // We probably need to check only the piecesById, for if there is any change
        // to the products data, that is reflected in the piecesById.
        piecesById,
      ];
}
