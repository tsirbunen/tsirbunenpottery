import 'package:madmudmobile/localization/translations.dart';

class En implements Translations {
  @override
  String get language => 'En';

  @override
  String translate(String key) => all[key] ?? '';

  @override
  Map<String, String> get all => {
        'tradeName': 'MAD MUD COMPANY',
        'appShortDescription': 'mud to unique treasures',
        'chineseCharacter': '泥',
        'tradeNameBeginning': 'MAD MUD',
        'home': 'Home',
        'pieces': 'Pieces',
        'collections': 'Collections',
      };
}
