import 'package:flutter/material.dart';
import 'package:madmudmobile/widgets/page_base/page_base.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageBase(
      pageBody: Center(
        child: Column(
          children: [
            Text('CONTACT'),
          ],
        ),
      ),
    );
  }
}
