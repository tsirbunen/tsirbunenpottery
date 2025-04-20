import 'package:flutter/material.dart';
import 'package:madmudmobile/features/products/presentation/product_view/models.dart';
import 'package:madmudmobile/features/products/presentation/product_view/products_view.dart';

class CategoriesPage extends StatelessWidget {
  final String? selectedCategoryId;

  const CategoriesPage({super.key, this.selectedCategoryId});

  @override
  Widget build(BuildContext context) {
    return ProductsView(
      selectedCategoryId: selectedCategoryId,
      mode: ViewMode.categories,
    );
  }
}
