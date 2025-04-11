import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/localization/translations.dart';

class Fi implements Translations {
  @override
  String get language => Language.fi.name;

  @override
  String translate(String key) => all[key] ?? '';

  @override
  Map<String, String> get all => {
        'tradeName': 'MAD MUD COMPANY',
        'appShortDescription': 'clay to unique treasures',
        'chineseCharacter': '泥',
        'tradeNameBeginning': 'MAD MUD',
        'home': 'Koti',
        'categories': 'Kategoriat',
        'collections': 'Kokoelmat',
        'story': 'Tarina',
        'contact': 'Yhteystiedot',
        'english': 'Englanti',
        'finnish': 'Suomi',
      };
}
