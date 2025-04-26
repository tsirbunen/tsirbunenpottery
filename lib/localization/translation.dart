enum Translation {
  // Page names:
  home,
  categories,
  collections,
  designs,
  story,
  contact,
  // App and app bar labels:
  tradeName,
  appShortDescription,
  chineseCharacter,
  // Languages:
  english,
  finnish,
  // All designs title:
  allDesigns,
  // Design view:
  designNotFound,
  productDetails,
  foodSafetyTitle,
  foodSafetyDetails,
  // Contact us view:
  contactUs,
  contactTitlePlaceholder,
  contactMessagePlaceholder,
  submitLabel,
  emailCopiedToClipboard,
  tapToCopyEmail,
  contactEmail,
  storyOnContactPage
}

extension TranslationToKey on Translation {
  String toKey() {
    return toString().split('.').last;
  }
}
