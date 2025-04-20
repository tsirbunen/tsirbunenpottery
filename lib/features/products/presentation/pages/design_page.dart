import 'package:flutter/material.dart';
import 'package:madmudmobile/widgets/page_base/page_base.dart';

class DesignPage extends StatelessWidget {
  final String id;
  final String fromRoute;

  const DesignPage({super.key, required this.id, required this.fromRoute});

  @override
  Widget build(BuildContext context) {
    return PageBase(
      pageBody: Container(
        child: Text('DESIGN ${id}'),
      ),
    );
  }
}
