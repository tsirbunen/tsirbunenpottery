enum Translation {
  home,
  pieces,
  collections,
  tradeName,
  appShortDescription,
  chineseCharacter,
  tradeNameBeginning,
}

extension TranslationToKey on Translation {
  String toKey() {
    return toString().split('.').last;
  }
}
