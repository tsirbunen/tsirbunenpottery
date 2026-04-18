// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'piece.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Piece {
  String get id;
  String get designId;
  List<String> get imageFileNames;
  bool get sold;
  String? get collectionId;

  /// Create a copy of Piece
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PieceCopyWith<Piece> get copyWith =>
      _$PieceCopyWithImpl<Piece>(this as Piece, _$identity);

  /// Serializes this Piece to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Piece &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.designId, designId) ||
                other.designId == designId) &&
            const DeepCollectionEquality()
                .equals(other.imageFileNames, imageFileNames) &&
            (identical(other.sold, sold) || other.sold == sold) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, designId,
      const DeepCollectionEquality().hash(imageFileNames), sold, collectionId);

  @override
  String toString() {
    return 'Piece(id: $id, designId: $designId, imageFileNames: $imageFileNames, sold: $sold, collectionId: $collectionId)';
  }
}

/// @nodoc
abstract mixin class $PieceCopyWith<$Res> {
  factory $PieceCopyWith(Piece value, $Res Function(Piece) _then) =
      _$PieceCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String designId,
      List<String> imageFileNames,
      bool sold,
      String? collectionId});
}

/// @nodoc
class _$PieceCopyWithImpl<$Res> implements $PieceCopyWith<$Res> {
  _$PieceCopyWithImpl(this._self, this._then);

  final Piece _self;
  final $Res Function(Piece) _then;

  /// Create a copy of Piece
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? designId = null,
    Object? imageFileNames = null,
    Object? sold = null,
    Object? collectionId = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      designId: null == designId
          ? _self.designId
          : designId // ignore: cast_nullable_to_non_nullable
              as String,
      imageFileNames: null == imageFileNames
          ? _self.imageFileNames
          : imageFileNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sold: null == sold
          ? _self.sold
          : sold // ignore: cast_nullable_to_non_nullable
              as bool,
      collectionId: freezed == collectionId
          ? _self.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Piece].
extension PiecePatterns on Piece {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Piece value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Piece() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Piece value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Piece():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Piece value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Piece() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String designId, List<String> imageFileNames,
            bool sold, String? collectionId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Piece() when $default != null:
        return $default(_that.id, _that.designId, _that.imageFileNames,
            _that.sold, _that.collectionId);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String designId, List<String> imageFileNames,
            bool sold, String? collectionId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Piece():
        return $default(_that.id, _that.designId, _that.imageFileNames,
            _that.sold, _that.collectionId);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String designId, List<String> imageFileNames,
            bool sold, String? collectionId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Piece() when $default != null:
        return $default(_that.id, _that.designId, _that.imageFileNames,
            _that.sold, _that.collectionId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Piece implements Piece {
  const _Piece(
      {required this.id,
      required this.designId,
      required final List<String> imageFileNames,
      required this.sold,
      this.collectionId})
      : _imageFileNames = imageFileNames;
  factory _Piece.fromJson(Map<String, dynamic> json) => _$PieceFromJson(json);

  @override
  final String id;
  @override
  final String designId;
  final List<String> _imageFileNames;
  @override
  List<String> get imageFileNames {
    if (_imageFileNames is EqualUnmodifiableListView) return _imageFileNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageFileNames);
  }

  @override
  final bool sold;
  @override
  final String? collectionId;

  /// Create a copy of Piece
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PieceCopyWith<_Piece> get copyWith =>
      __$PieceCopyWithImpl<_Piece>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PieceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Piece &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.designId, designId) ||
                other.designId == designId) &&
            const DeepCollectionEquality()
                .equals(other._imageFileNames, _imageFileNames) &&
            (identical(other.sold, sold) || other.sold == sold) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, designId,
      const DeepCollectionEquality().hash(_imageFileNames), sold, collectionId);

  @override
  String toString() {
    return 'Piece(id: $id, designId: $designId, imageFileNames: $imageFileNames, sold: $sold, collectionId: $collectionId)';
  }
}

/// @nodoc
abstract mixin class _$PieceCopyWith<$Res> implements $PieceCopyWith<$Res> {
  factory _$PieceCopyWith(_Piece value, $Res Function(_Piece) _then) =
      __$PieceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String designId,
      List<String> imageFileNames,
      bool sold,
      String? collectionId});
}

/// @nodoc
class __$PieceCopyWithImpl<$Res> implements _$PieceCopyWith<$Res> {
  __$PieceCopyWithImpl(this._self, this._then);

  final _Piece _self;
  final $Res Function(_Piece) _then;

  /// Create a copy of Piece
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? designId = null,
    Object? imageFileNames = null,
    Object? sold = null,
    Object? collectionId = freezed,
  }) {
    return _then(_Piece(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      designId: null == designId
          ? _self.designId
          : designId // ignore: cast_nullable_to_non_nullable
              as String,
      imageFileNames: null == imageFileNames
          ? _self._imageFileNames
          : imageFileNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sold: null == sold
          ? _self.sold
          : sold // ignore: cast_nullable_to_non_nullable
              as bool,
      collectionId: freezed == collectionId
          ? _self.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
