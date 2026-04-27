import 'package:tsirbunenpottery/localization/translation.dart';

abstract class Translations {
  String get language;
  String translate(Translation key);
}
