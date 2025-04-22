import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/localization/translations.dart';

class Fi implements Translations {
  @override
  String get language => Language.fi.name;

  @override
  String translate(String key) => all[key] ?? '';

  @override
  Map<String, String> get all => {
        'tradeName': 'TSIRBUNEN POTTERY',
        'appShortDescription': 'clay to unique treasures',
        'chineseCharacter': '泥',
        'tradeNameBeginning': 'TSIRBUNEN',
        'home': 'Koti',
        'categories': 'Kategoriat',
        'collections': 'Kokoelmat',
        'designs': 'Mallit',
        'story': 'Tarina',
        'contact': 'Yhteystiedot',
        'english': 'Englanti',
        'finnish': 'Suomi',
        'allDesigns': 'Kaikki mallit',
      };
}
