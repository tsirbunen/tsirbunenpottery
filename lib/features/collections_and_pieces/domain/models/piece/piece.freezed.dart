// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'piece.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Piece _$PieceFromJson(Map<String, dynamic> json) {
  return _Piece.fromJson(json);
}

/// @nodoc
mixin _$Piece {
  String get uuid => throw _privateConstructorUsedError;
  int get serialNumber => throw _privateConstructorUsedError;
  Design get design => throw _privateConstructorUsedError;
  Collection? get collection => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PieceCopyWith<Piece> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PieceCopyWith<$Res> {
  factory $PieceCopyWith(Piece value, $Res Function(Piece) then) =
      _$PieceCopyWithImpl<$Res, Piece>;
  @useResult
  $Res call(
      {String uuid, int serialNumber, Design design, Collection? collection});

  $DesignCopyWith<$Res> get design;
  $CollectionCopyWith<$Res>? get collection;
}

/// @nodoc
class _$PieceCopyWithImpl<$Res, $Val extends Piece>
    implements $PieceCopyWith<$Res> {
  _$PieceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? serialNumber = null,
    Object? design = null,
    Object? collection = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      serialNumber: null == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as int,
      design: null == design
          ? _value.design
          : design // ignore: cast_nullable_to_non_nullable
              as Design,
      collection: freezed == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Collection?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DesignCopyWith<$Res> get design {
    return $DesignCopyWith<$Res>(_value.design, (value) {
      return _then(_value.copyWith(design: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CollectionCopyWith<$Res>? get collection {
    if (_value.collection == null) {
      return null;
    }

    return $CollectionCopyWith<$Res>(_value.collection!, (value) {
      return _then(_value.copyWith(collection: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PieceImplCopyWith<$Res> implements $PieceCopyWith<$Res> {
  factory _$$PieceImplCopyWith(
          _$PieceImpl value, $Res Function(_$PieceImpl) then) =
      __$$PieceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid, int serialNumber, Design design, Collection? collection});

  @override
  $DesignCopyWith<$Res> get design;
  @override
  $CollectionCopyWith<$Res>? get collection;
}

/// @nodoc
class __$$PieceImplCopyWithImpl<$Res>
    extends _$PieceCopyWithImpl<$Res, _$PieceImpl>
    implements _$$PieceImplCopyWith<$Res> {
  __$$PieceImplCopyWithImpl(
      _$PieceImpl _value, $Res Function(_$PieceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? serialNumber = null,
    Object? design = null,
    Object? collection = freezed,
  }) {
    return _then(_$PieceImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      serialNumber: null == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as int,
      design: null == design
          ? _value.design
          : design // ignore: cast_nullable_to_non_nullable
              as Design,
      collection: freezed == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Collection?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PieceImpl implements _Piece {
  const _$PieceImpl(
      {required this.uuid,
      required this.serialNumber,
      required this.design,
      this.collection});

  factory _$PieceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PieceImplFromJson(json);

  @override
  final String uuid;
  @override
  final int serialNumber;
  @override
  final Design design;
  @override
  final Collection? collection;

  @override
  String toString() {
    return 'Piece(uuid: $uuid, serialNumber: $serialNumber, design: $design, collection: $collection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PieceImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.design, design) || other.design == design) &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uuid, serialNumber, design, collection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PieceImplCopyWith<_$PieceImpl> get copyWith =>
      __$$PieceImplCopyWithImpl<_$PieceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PieceImplToJson(
      this,
    );
  }
}

abstract class _Piece implements Piece {
  const factory _Piece(
      {required final String uuid,
      required final int serialNumber,
      required final Design design,
      final Collection? collection}) = _$PieceImpl;

  factory _Piece.fromJson(Map<String, dynamic> json) = _$PieceImpl.fromJson;

  @override
  String get uuid;
  @override
  int get serialNumber;
  @override
  Design get design;
  @override
  Collection? get collection;
  @override
  @JsonKey(ignore: true)
  _$$PieceImplCopyWith<_$PieceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
