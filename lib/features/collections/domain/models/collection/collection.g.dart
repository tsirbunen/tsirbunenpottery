// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Collection _$CollectionFromJson(Map<String, dynamic> json) => _Collection(
      id: json['id'] as String,
      names: (json['names'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$LanguageEnumMap, k), e as String),
      ),
      description: (json['description'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$LanguageEnumMap, k), e as String),
      ),
    );

Map<String, dynamic> _$CollectionToJson(_Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'names': instance.names.map((k, e) => MapEntry(_$LanguageEnumMap[k]!, e)),
      'description': instance.description
          .map((k, e) => MapEntry(_$LanguageEnumMap[k]!, e)),
    };

const _$LanguageEnumMap = {
  Language.en: 'en',
  Language.fi: 'fi',
};
