import 'package:flutter/material.dart';
import 'package:madmudmobile/features/contact/presentation/contact_form.dart';
import 'package:madmudmobile/features/contact/presentation/photo_and_info.dart';
import 'package:madmudmobile/widgets/footer/footer.dart';
import 'package:madmudmobile/widgets/page_base/page_base.dart';

const double showPhotoBreakpoint = 800.0;

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isHorizontal = width > showPhotoBreakpoint;

    return PageBase(
        pageBody: Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isHorizontal
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PhotoAndInfo(),
                      SizedBox(width: 50.0),
                      ContactForm(),
                    ],
                  )
                : const Column(
                    children: [
                      ContactForm(),
                      SizedBox(height: 30.0),
                      PhotoAndInfo(),
                    ],
                  ),
            const Footer(),
          ]),
    ));
  }
}
