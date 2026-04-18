import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tsirbunenpottery/data/identifiable.dart';
import 'package:tsirbunenpottery/localization/languages.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category implements Identifiable {
  const factory Category({
    required String id,
    required Map<Language, String> names,
  }) = _Category;

  factory Category.fromJson(Map<String, Object?> json) =>
      _$CategoryFromJson(json);
}
