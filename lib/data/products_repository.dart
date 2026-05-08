import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/data/cloud_service.dart';
import 'package:tsirbunenpottery/data/firestore_data_parser.dart';
import 'package:tsirbunenpottery/utils/app_firestore_refs.dart';
import 'package:tsirbunenpottery/features/categories/domain/models/category/category.dart';
import 'package:tsirbunenpottery/features/collections/domain/models/collection/collection.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';

const _tag = 'ProductsRepository';

typedef AllProductsData = ({
  List<Piece> pieces,
  List<Design> designs,
  List<Category> categories,
  List<Collection> collections,
});

abstract interface class IProductsRepository {
  Future<AllProductsData> getProducts();
}

class ProductsRepository implements IProductsRepository {
  final CloudService _cloudService;
  final FirestoreDataParser _parser;
  final AppLogger _logger;
  Future<AllProductsData>? _cache;

  ProductsRepository(
    this._cloudService,
    this._parser, {
    required AppLogger logger,
  }) : _logger = logger;

  @override
  Future<AllProductsData> getProducts() {
    return _cache ??= _fetchAllFromCloud().catchError((Object e) {
      _cache = null;
      throw e;
    });
  }

  Future<AllProductsData> _fetchAllFromCloud() async {
    final [collectionsData, categoriesData, designsData, piecesData] =
        await Future.wait([
      _cloudService.fetchMany(collection: FirestoreCollections.collections),
      _cloudService.fetchMany(collection: FirestoreCollections.categories),
      _cloudService.fetchMany(collection: FirestoreCollections.designs),
      _cloudService.fetchMany(collection: FirestoreCollections.pieces),
    ]);

    final collections =
        collectionsData.map(_parser.parseCollection).whereType<Collection>().toList();
    final categories =
        categoriesData.map(_parser.parseCategory).whereType<Category>().toList();
    final designs = designsData
        .map((data) => _parser.parseDesign(data, categories))
        .whereType<Design>()
        .toList();
    final pieces = piecesData
        .map((data) => _parser.parsePiece(data, designs, collections))
        .whereType<Piece>()
        .toList();

    _logger.logInfo(
      'Parsed: ${collections.length} collections, ${categories.length} categories, '
      '${designs.length} designs, ${pieces.length} pieces',
      tag: _tag,
    );

    return (
      pieces: pieces,
      designs: designs,
      categories: categories,
      collections: collections,
    );
  }
}
