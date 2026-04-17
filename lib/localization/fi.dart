import 'package:tsirbunenpottery/localization/languages.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/localization/translations.dart';

class Fi implements Translations {
  @override
  String get language => Language.fi.name;

  @override
  String translate(Translation key) => all[key.name] ?? '';

  @override
  Map<String, String> get all => {
        'tradeName': 'TSIRBUNEN POTTERY',
        'appShortDescription': 'ylellisempää arkea',
        'homeTitle': 'tsirbunen pottery',
        'homeDescription':
            'Etsitkö kahvimukia, nuudelikulhoa tai salaattilautasta?\n'
            'Piristäisikö posliinisormus tai seinäreliefi arkeasi?\n'
            'Nämä ja paljon muuta löydät\n'
            'Tsirbunen Potteryn valikoimasta.\n\n'
            'Kaikki tuotteet on yksitellen käsin rakennettu,\n'
            'eikä kahta täysin samanlaista tuotetta löydy.\n'
            'Valikoima elää: kun yksi työ lähtee uuteen kotiin,\n'
            'tilalle tulee jotain muuta.\n\n'
            'Jos valikoimasta ei löydy oikeanlaista tuotetta,\n'
            'ota rohkeasti yhteyttä - kuvan kanssa tai ilman!\n'
            'Toteutan mielelläni tilaustöitä.',
        'chineseCharacter': '泥',
        'home': 'Koti',
        'pieces': 'Tuotteet',
        'categories': 'Kategoriat',
        'collections': 'Kokoelmat',
        'designs': 'Mallit',
        'story': 'Tarina',
        'contact': 'Yhteystiedot',
        'english': 'Englanti',
        'finnish': 'Suomi',
        'allDesigns': 'Kaikki mallit',
        'allPieces': 'Kaikki tuotteet',
        'designNotFound': 'Mallia ei löydy',
        'productDetails': 'Tuotteen tiedot',
        'foodSafetyTitle': 'Elintarviketurvallisuus',
        'foodSafetyDetails': foodSafetyDetails,
        'contactUs': 'Ota yhteyttä',
        'contactTitlePlaceholder': 'Otsikko...',
        'contactMessagePlaceholder': 'Viesti...',
        'submitLabel': 'Lähetä',
        'comingSoon': 'Tulossa pian',
        'emailCopiedToClipboard': 'Sähköposti kopioitu leikepöydälle',
        'tapToCopyEmail': 'Kopioi sähköposti napauttamalla sitä!',
        'contactEmail': 'tsirbunenpottery@gmail.com',
        'storyOnContactPage':
            'Käsityönä valmistettu alusta loppuun, ei kahta samanlaista.',
        'dataLoadError': 'Tietojen lataus epäonnistui. Yritä myöhemmin uudelleen.',
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
