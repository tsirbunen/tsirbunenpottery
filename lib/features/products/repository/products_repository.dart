import 'package:madmudmobile/features/products/domain/models/products/products.dart';
import 'package:madmudmobile/features/products/repository/dev_data.dart';

class ProductsRepository {
  ProductsRepository();

  Future<Products> fetchProductData() async {
    // Note: This is a temporary development implementation
    return products;
  }
}
