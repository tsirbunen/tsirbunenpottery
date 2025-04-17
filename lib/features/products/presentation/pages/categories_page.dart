import 'package:flutter/material.dart';
import 'package:madmudmobile/features/products/presentation/product_view/product_view.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductView(
      scrollTargetName: 'CategoriesPage',
    );
  }
}
