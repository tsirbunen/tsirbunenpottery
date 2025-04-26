import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/localization/translations.dart';

class Fi implements Translations {
  @override
  String get language => Language.fi.name;

  @override
  String translate(Translation key) => all[key.name] ?? '';

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
        'designNotFound': 'Mallia ei löydy',
        'productDetails': 'Tuotteen tiedot',
        'foodSafetyTitle': 'Elintarviketurvallisuus',
        'foodSafetyDetails': foodSafetyDetails
      };
}

const List<String> foodSafetyInfo = [
  'Käytämme kaupallisesti valmistettuja lasitteita, jotka on tarkoitettu elintarviketurvallisiksi.',
  'Emme kuitenkaan suorita itsenäistä laboratoriotestausta jokaiselle yksittäiselle kappaleelle.',
  'Tarkista kaikki esineet, joita aiot käyttää ruoan kanssa, varmistaaksesi että',
  'lasitettu pinta on täysin ehjä,',
  'siinä ei ole halkeamia, halkeilua tai siruja, ja että',
  'kaikki elintarvikkeiden kanssa kosketuksissa olevat alueet ovat täysin lasitettuja.',
  'Jos olet epävarma, suosittelemme käyttämään esinettä vain koristeellisiin tarkoituksiin.',
  'Turvallisuutesi on meille tärkeää! Kiitos ymmärryksestäsi!'
];

String foodSafetyDetails = foodSafetyInfo.join(' ');
