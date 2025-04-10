// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'piece.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PieceImpl _$$PieceImplFromJson(Map<String, dynamic> json) => _$PieceImpl(
      uuid: json['uuid'] as String,
      serialNumber: (json['serialNumber'] as num).toInt(),
      design: Design.fromJson(json['design'] as Map<String, dynamic>),
      collection: json['collection'] == null
          ? null
          : Collection.fromJson(json['collection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PieceImplToJson(_$PieceImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'serialNumber': instance.serialNumber,
      'design': instance.design,
      'collection': instance.collection,
    };
