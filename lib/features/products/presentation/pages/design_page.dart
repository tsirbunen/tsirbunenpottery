import 'package:flutter/material.dart';
import 'package:madmudmobile/features/products/presentation/design_view/design_view.dart';

class DesignPage extends StatelessWidget {
  final String id;

  const DesignPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return DesignView(id: id);
  }
}
