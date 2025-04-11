// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DesignImpl _$$DesignImplFromJson(Map<String, dynamic> json) => _$DesignImpl(
      id: json['id'] as String,
      names: (json['names'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$LanguageEnumMap, k), e as String),
      ),
      categoryIds: (json['categoryIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$DesignImplToJson(_$DesignImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'names': instance.names.map((k, e) => MapEntry(_$LanguageEnumMap[k]!, e)),
      'categoryIds': instance.categoryIds,
    };

const _$LanguageEnumMap = {
  Language.en: 'en',
  Language.fi: 'fi',
};
