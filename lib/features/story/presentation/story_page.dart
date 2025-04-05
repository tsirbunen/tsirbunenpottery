import 'package:flutter/material.dart';
import 'package:madmudmobile/widgets/page_base/page_base.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageBase(
      pageBody: Center(
        child: Column(
          children: [
            Text('STORY'),
          ],
        ),
      ),
    );
  }
}
