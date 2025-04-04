abstract class Translations {
  String get language;
  Map<String, String> get all;

  String translate(String key);
}
