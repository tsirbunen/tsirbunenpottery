import 'package:tsirbunenpottery/localization/languages.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/localization/translations.dart';

class En implements Translations {
  @override
  String get language => Language.en.name;

  @override
  String translate(Translation key) => switch (key) {
        Translation.tradeName => 'TSIRBUNEN POTTERY',
        Translation.appShortDescription => 'a little everyday luxury',
        Translation.homeTitle => 'tsirbunen pottery',
        Translation.homeDescription =>
          'Looking for a coffee mug, noodle bowl, or salad plate?\n'
              'Would a porcelain ring or a wall relief bring\n'
              'something extra to your everyday life?\n'
              'These and much more can be found in\n'
              'the Tsirbunen Pottery collection.\n\n'
              'Each piece is hand-built one by one,\n'
              'and no two items are ever exactly the same.\n'
              'The collection is always evolving:\n'
              'when something goes out, something else comes in.\n\n'
              'I also make custom pieces to order, so if\n'
              'you don\'t find quite what you\'re looking for,\n'
              'feel free to get in touch\n'
              '(with or without a reference image).',
        Translation.chineseCharacter => '泥',
        Translation.home => 'Home',
        Translation.pieces => 'Pieces',
        Translation.categories => 'Categories',
        Translation.collections => 'Collections',
        Translation.designs => 'Designs',
        Translation.story => 'Story',
        Translation.contact => 'Contact',
        Translation.english => 'English',
        Translation.finnish => 'Finnish',
        Translation.allDesigns => 'All Designs',
        Translation.allPieces => 'All Pieces',
        Translation.designNotFound => 'Design not found',
        Translation.pieceNotFound => 'Piece not found',
        Translation.backToPieces => 'Back to all pieces',
        Translation.productDetails => 'Product Details',
        Translation.foodSafetyTitle => 'Food Safety Information',
        Translation.foodSafetyDetails => _foodSafetyDetails,
        Translation.contactUs => 'Contact Us',
        Translation.contactTitlePlaceholder => 'Title...',
        Translation.contactMessagePlaceholder => 'Message...',
        Translation.submitLabel => 'Submit',
        Translation.comingSoon => 'Coming soon',
        Translation.emailCopiedToClipboard => 'Email copied to clipboard',
        Translation.tapToCopyEmail => 'Tap the email to copy it!',
        Translation.contactEmail => 'tsirbunenpottery@gmail.com',
        Translation.storyOnContactPage =>
          'Handmade from start to finish, no two alike.',
        Translation.dataLoadError =>
          'Could not load data. Please try again later.',
        Translation.firebaseInitError =>
          'Could not connect. Please refresh and try again.',
        Translation.retry => 'Try again',
      };
}

const List<String> foodSafetyInfo = [
  'We use commercially manufactured glazes that are intended to be food safe.',
  'However, we do not conduct independent laboratory testing on each individual piece.',
  'Please inspect any item you plan to use with food to ensure that',
  'the glazed surface is fully intact,',
  'there are no cracks, crazing, or chips, and that',
  'all food-contact areas are completely covered in glaze.',
  'If you are ever unsure, we recommend using the item for decorative purposes only.',
  'Your safety matters to us! Thank you for understanding!'
];

final String _foodSafetyDetails = foodSafetyInfo.join(' ');
