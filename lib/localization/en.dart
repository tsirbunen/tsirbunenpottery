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
        'foodSafetyInfo': 'Food Safety Information',
      };
}
