import 'package:flutter/material.dart';
import 'package:madmudmobile/features/products/domain/models/design/design.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/localization/translation.dart';

// FIXME: Replace these when the real text contents once available

const String description =
    'I love the ritual of a slow morning coffee, and these latte mugs are made with that in mind. Generously sized and comfortable to hold, they are perfect for your favorite latte, a cozy tea, or even a hot chocolate piled high with cream.';

const details = {
  'Approximate capacity': '75 ml',
  'Dimensions': 'Height ~6.5 cm, Diameter ~6.8 cm',
  'Material': 'High-fired stoneware',
  'Glaze': 'Commercial glaze',
  'Finish': 'Glazed inside, unglazed outside',
};

const List<String> foodSafetyInfo = [
  'We use commercially manufactured glazes that are intended to be food safe.',
  'However, we do not conduct independent laboratory testing on each individual piece.',
  'Please inspect any item you plan to use with food to ensure that',
  'the glazed surface is fully intact,',
  'there are no cracks, crazing, or chips, and that',
  'all food-contact areas are completely covered in glaze.',
  'If you are ever unsure, we recommend using the item for decorative purposes only.',
  'Your safety matters to us! Thank you for understanding!'
];

class DesignDescription extends StatelessWidget {
  final Design design;
  final Language language;

  const DesignDescription(
      {super.key, required this.design, required this.language});

  @override
  Widget build(BuildContext context) {
    final String designName = design.names[language]!;

    final productDetailsTitle = context.local(Translation.productDetails);
    final String foodSafetyInfoTitle =
        context.local(Translation.foodSafetyInfo);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(designName, style: Theme.of(context).textTheme.headlineMedium),
        Text(
          description,
          softWrap: true,
          style: _descriptionTextStyle(context),
        ),
        const SizedBox(height: 25.0),
        Text('$productDetailsTitle:', style: _subTitleTextStyle(context)),
        const SizedBox(height: 5.0),
        ...details.entries.map(
          (entry) => Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text('• ${entry.key}: ${entry.value}',
                style: _listItemTextStyle(context)),
          ),
        ),
        const SizedBox(height: 25.0),
        Text('$foodSafetyInfoTitle:', style: _subTitleTextStyle(context)),
        const SizedBox(height: 5.0),
        Text(foodSafetyInfo.join(' '), style: _listItemTextStyle(context)),
      ],
    );
  }

  TextStyle _descriptionTextStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle _subTitleTextStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle _listItemTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(height: 1.0);
  }
}
