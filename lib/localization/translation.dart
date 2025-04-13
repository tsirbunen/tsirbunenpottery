enum Translation {
  // Page names:
  home,
  categories,
  collections,
  story,
  contact,
  // App and app bar labels:
  tradeName,
  appShortDescription,
  chineseCharacter,
  // Languages:
  english,
  finnish,
}

extension TranslationToKey on Translation {
  String toKey() {
    return toString().split('.').last;
  }
}
