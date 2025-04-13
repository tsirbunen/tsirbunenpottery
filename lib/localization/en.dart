import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/localization/translations.dart';

class En implements Translations {
  @override
  String get language => Language.en.name;

  @override
  String translate(String key) => all[key] ?? '';

  @override
  Map<String, String> get all => {
        'tradeName': 'TSIRBUNEN POTTERY',
        'appShortDescription': 'clay to unique treasures',
        'chineseCharacter': '泥',
        'home': 'Home',
        'categories': 'Categories',
        'collections': 'Collections',
        'story': 'Story',
        'contact': 'Contact',
        'english': 'English',
        'finnish': 'Finnish',
      };
}
