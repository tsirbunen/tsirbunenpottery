// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'piece.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Piece _$PieceFromJson(Map<String, dynamic> json) => _Piece(
      id: json['id'] as String,
      designId: json['designId'] as String,
      imageFileNames: (json['imageFileNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      sold: json['sold'] as bool,
      collectionId: json['collectionId'] as String?,
    );

Map<String, dynamic> _$PieceToJson(_Piece instance) => <String, dynamic>{
      'id': instance.id,
      'designId': instance.designId,
      'imageFileNames': instance.imageFileNames,
      'sold': instance.sold,
      'collectionId': instance.collectionId,
    };
