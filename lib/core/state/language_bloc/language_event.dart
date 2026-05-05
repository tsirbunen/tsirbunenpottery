import 'package:tsirbunenpottery/core/state/bloc_utils/app_bloc_event.dart';
import 'package:tsirbunenpottery/localization/languages.dart';

sealed class LanguageEvent extends AppBlocEvent {}

class ChangeLanguage extends LanguageEvent {
  final Language language;

  ChangeLanguage(this.language);
}
