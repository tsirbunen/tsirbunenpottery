import 'package:madmudmobile/features/products/domain/models/products/products.dart';
import 'package:madmudmobile/features/products/repository/cloud_service.dart';
import 'package:madmudmobile/features/products/repository/dev_data.dart';

class ProductsRepository {
  ProductsRepository();
  final CloudService _cloudService = CloudService();

  Future<Products> fetchProductData() async {
    await _cloudService.fetchAllProductDataFromCloud();
    // Note: This is a temporary development implementation

    return products;
  }
}
