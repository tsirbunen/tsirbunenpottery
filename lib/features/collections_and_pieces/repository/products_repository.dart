import 'package:madmudmobile/features/collections_and_pieces/domain/models/products/products.dart';
import 'package:madmudmobile/features/collections_and_pieces/repository/dev_data.dart';

class ProductsRepository {
  ProductsRepository();

  Future<Products> fetchProductData() async {
    // Note: This is a temporary development implementation
    return products;
  }
}
