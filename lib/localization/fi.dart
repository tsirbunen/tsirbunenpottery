import 'package:madmudmobile/localization/translations.dart';

class Fi implements Translations {
  @override
  String get language => 'Fi';

  @override
  String translate(String key) => all[key] ?? '';

  @override
  Map<String, String> get all => {
        'tradeName': 'MAD MUD COMPANY',
        'appShortDescription': 'uniikkeja aarteita savesta',
        'chineseCharacter': '泥',
        'tradeNameBeginning': 'MAD MUD',
        'home': 'Koti',
        'pieces': 'Tuotteet',
        'collections': 'Kokoelmat',
      };
}
