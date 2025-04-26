import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/localization/translations.dart';

class En implements Translations {
  @override
  String get language => Language.en.name;

  @override
  String translate(Translation key) => all[key.name] ?? '';

  @override
  Map<String, String> get all => {
        'tradeName': 'TSIRBUNEN POTTERY',
        'appShortDescription': 'clay to unique treasures',
        'chineseCharacter': '泥',
        'home': 'Home',
        'categories': 'Categories',
        'collections': 'Collections',
        'designs': 'Designs',
        'story': 'Story',
        'contact': 'Contact',
        'english': 'English',
        'finnish': 'Finnish',
        'allDesigns': 'All Designs',
        'designNotFound': 'Design not found',
        'productDetails': 'Product Details',
        'foodSafetyTitle': 'Food Safety Information',
        'foodSafetyDetails': foodSafetyDetails
      };
}

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

String foodSafetyDetails = foodSafetyInfo.join(' ');
