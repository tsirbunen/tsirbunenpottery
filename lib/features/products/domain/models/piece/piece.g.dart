// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'piece.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PieceImpl _$$PieceImplFromJson(Map<String, dynamic> json) => _$PieceImpl(
      id: json['id'] as String,
      serialNumber: (json['serialNumber'] as num).toInt(),
      designId: json['designId'] as String,
      imageFileNames: (json['imageFileNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      collectionId: json['collectionId'] as String?,
    );

Map<String, dynamic> _$$PieceImplToJson(_$PieceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serialNumber': instance.serialNumber,
      'designId': instance.designId,
      'imageFileNames': instance.imageFileNames,
      'collectionId': instance.collectionId,
    };
