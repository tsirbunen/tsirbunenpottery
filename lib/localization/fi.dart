import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/localization/translations.dart';

class Fi implements Translations {
  @override
  String translate(Translation key) => switch (key) {
        Translation.tradeName => 'TSIRBUNEN POTTERY',
        Translation.appShortDescription => 'ylellisempää arkea',
        Translation.homeTitle => 'tsirbunen pottery',
        Translation.homeDescription =>
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
        Translation.chineseCharacter => '泥',
        Translation.home => 'Koti',
        Translation.pieces => 'Tuotteet',
        Translation.categories => 'Kategoriat',
        Translation.collections => 'Kokoelmat',
        Translation.designs => 'Mallit',
        Translation.contact => 'Yhteystiedot',
        Translation.english => 'Englanti',
        Translation.finnish => 'Suomi',
        Translation.allDesigns => 'Kaikki mallit',
        Translation.allPieces => 'Kaikki tuotteet',
        Translation.designNotFound => 'Mallia ei löydy',
        Translation.pieceNotFound => 'Tuotetta ei löydy',
        Translation.backToPieces => 'Takaisin kaikkiin tuotteisiin',
        Translation.productDetails => 'Tuotteen tiedot',
        Translation.foodSafetyTitle => 'Elintarviketurvallisuus',
        Translation.foodSafetyDetails => _foodSafetyDetails,
        Translation.contactUs => 'Ota yhteyttä',
        Translation.contactTitlePlaceholder => 'Otsikko...',
        Translation.contactMessagePlaceholder => 'Viesti...',
        Translation.submitLabel => 'Lähetä',
        Translation.comingSoon => 'Tulossa pian',
        Translation.emailCopiedToClipboard => 'Sähköposti kopioitu leikepöydälle',
        Translation.tapToCopyEmail => 'Kopioi sähköposti napauttamalla sitä!',
        Translation.contactEmail => 'tsirbunenpottery@gmail.com',
        Translation.storyOnContactPage =>
          'Käsityönä valmistettu alusta loppuun, ei kahta samanlaista.',
        Translation.dataLoadError =>
          'Tietojen lataus epäonnistui. Yritä myöhemmin uudelleen.',
        Translation.firebaseInitError =>
          'Yhteys epäonnistui. Päivitä sivu ja yritä uudelleen.',
        Translation.retry => 'Yritä uudelleen',
        Translation.pageNotFound => 'Sivua ei löydy',
        Translation.goHome => 'Siirry etusivulle',
      };
}

const List<String> _foodSafetyInfo = [
  'Käytämme kaupallisesti valmistettuja lasitteita, jotka on tarkoitettu elintarviketurvallisiksi.',
  'Emme kuitenkaan suorita itsenäistä laboratoriotestausta jokaiselle yksittäiselle kappaleelle.',
  'Tarkista kaikki esineet, joita aiot käyttää ruoan kanssa, varmistaaksesi että',
  'lasitettu pinta on täysin ehjä,',
  'siinä ei ole halkeamia, halkeilua tai siruja, ja että',
  'kaikki elintarvikkeiden kanssa kosketuksissa olevat alueet ovat täysin lasitettuja.',
  'Jos olet epävarma, suosittelemme käyttämään esinettä vain koristeellisiin tarkoituksiin.',
  'Turvallisuutesi on meille tärkeää! Kiitos ymmärryksestäsi!'
];

final String _foodSafetyDetails = _foodSafetyInfo.join(' ');
