import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:madmudmobile/localization/languages.dart';

part 'design.freezed.dart';
part 'design.g.dart';

@freezed
class Design with _$Design {
  const factory Design({
    required String uuid,
    required Map<Language, String> names,
  }) = _Design;

  factory Design.fromJson(Map<String, Object?> json) => _$DesignFromJson(json);
}
