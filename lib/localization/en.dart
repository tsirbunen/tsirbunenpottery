import 'package:tsirbunenpottery/localization/languages.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/localization/translations.dart';

class En implements Translations {
  @override
  String get language => Language.en.name;

  @override
  String translate(Translation key) => all[key.name] ?? '';

  @override
  Map<String, String> get all => {
        'tradeName': 'TSIRBUNEN POTTERY',
        'appShortDescription': 'a little everyday luxury',
        'homeTitle': 'tsirbunen pottery',
        'homeDescription':
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
        'chineseCharacter': '泥',
        'home': 'Home',
        'pieces': 'Pieces',
        'categories': 'Categories',
        'collections': 'Collections',
        'designs': 'Designs',
        'story': 'Story',
        'contact': 'Contact',
        'english': 'English',
        'finnish': 'Finnish',
        'allDesigns': 'All Designs',
        'allPieces': 'All Pieces',
        'designNotFound': 'Design not found',
        'productDetails': 'Product Details',
        'foodSafetyTitle': 'Food Safety Information',
        'foodSafetyDetails': foodSafetyDetails,
        'contactUs': 'Contact Us',
        'contactTitlePlaceholder': 'Title...',
        'contactMessagePlaceholder': 'Message...',
        'submitLabel': 'Submit',
        'comingSoon': 'Coming soon',
        'emailCopiedToClipboard': 'Email copied to clipboard',
        'tapToCopyEmail': 'Tap the email to copy it!',
        'contactEmail': 'tsirbunenpottery@gmail.com',
        'storyOnContactPage':
            'Handmade from start to finish, no two alike.',
        'dataLoadError': 'Could not load data. Please try again later.',
        'retry': 'Try again',
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

String foodSafetyDetails = foodSafetyInfo.join(' ');
