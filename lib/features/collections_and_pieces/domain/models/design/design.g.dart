// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DesignImpl _$$DesignImplFromJson(Map<String, dynamic> json) => _$DesignImpl(
      uuid: json['uuid'] as String,
      names: (json['names'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$LanguageEnumMap, k), e as String),
      ),
    );

Map<String, dynamic> _$$DesignImplToJson(_$DesignImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'names': instance.names.map((k, e) => MapEntry(_$LanguageEnumMap[k]!, e)),
    };

const _$LanguageEnumMap = {
  Language.en: 'en',
  Language.fi: 'fi',
};
