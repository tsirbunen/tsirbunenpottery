import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/features/collections/presentation/collections_view/collections_view.dart';

class SingleCollectionPage extends StatelessWidget {
  final String id;
  const SingleCollectionPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return CollectionsView(selectedCollectionId: id);
  }
}
