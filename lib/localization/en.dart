import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/localization/translations.dart';

class En implements Translations {
  @override
  String get language => Language.en.name;

  @override
  String translate(String key) => all[key] ?? '';

  @override
  Map<String, String> get all => {
        'tradeName': 'MAD MUD COMPANY',
        'appShortDescription': 'clay to unique treasures',
        'chineseCharacter': '泥',
        'tradeNameBeginning': 'MAD MUD',
        'home': 'Home',
        'pieces': 'Pieces',
        'collections': 'Collections',
        'story': 'Story',
        'contact': 'Contact',
        'english': 'English',
        'finnish': 'Finnish',
      };
}
