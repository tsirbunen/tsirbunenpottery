enum Translation {
  // Page names:
  home,
  pieces,
  collections,
  story,
  contact,
  // App and app bar labels:
  tradeName,
  appShortDescription,
  chineseCharacter,
  tradeNameBeginning,
  // Languages:
  english,
  finnish,
}

extension TranslationToKey on Translation {
  String toKey() {
    return toString().split('.').last;
  }
}
