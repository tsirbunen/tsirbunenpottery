import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tsirbunenpottery/localization/languages.dart';

part 'language_state.freezed.dart';

@freezed
abstract class LanguageState with _$LanguageState {
  const factory LanguageState({
    @Default(Language.fi) Language language,
  }) = _LanguageState;
}
