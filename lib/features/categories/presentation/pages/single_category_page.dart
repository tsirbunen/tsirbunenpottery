import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/features/categories/presentation/categories_view/categories_view.dart';

class SingleCategoryPage extends StatelessWidget {
  final String id;
  const SingleCategoryPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return CategoriesView(selectedCategoryId: id);
  }
}
