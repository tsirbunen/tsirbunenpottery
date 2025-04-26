import 'package:flutter/material.dart';
import 'package:madmudmobile/features/products/presentation/products_view/models.dart';
import 'package:madmudmobile/features/products/presentation/products_view/products_view.dart';

class DesignsPage extends StatelessWidget {
  const DesignsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductsView(mode: ViewMode.designs);
  }
}
