import 'package:flutter/material.dart';
import 'package:madmudmobile/widgets/page_base/page_base.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageBase(
      pageBody: Center(
        child: Text('COLLECTIONS'),
      ),
    );
  }
}
