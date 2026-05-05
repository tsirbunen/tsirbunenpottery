// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pieces_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PiecesState {
  BlocStatus get blocStatus;
  Map<String, Piece> get piecesById;
  Map<String, Design> get designsById;
  Map<String, List<String>> get imageFileNamesByDesignId;
  List<Design> get allDesigns;
  List<Piece> get allPieces;

  /// Create a copy of PiecesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PiecesStateCopyWith<PiecesState> get copyWith =>
      _$PiecesStateCopyWithImpl<PiecesState>(this as PiecesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PiecesState &&
            (identical(other.blocStatus, blocStatus) ||
                other.blocStatus == blocStatus) &&
            const DeepCollectionEquality()
                .equals(other.piecesById, piecesById) &&
            const DeepCollectionEquality()
                .equals(other.designsById, designsById) &&
            const DeepCollectionEquality().equals(
                other.imageFileNamesByDesignId, imageFileNamesByDesignId) &&
            const DeepCollectionEquality()
                .equals(other.allDesigns, allDesigns) &&
            const DeepCollectionEquality().equals(other.allPieces, allPieces));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      blocStatus,
      const DeepCollectionEquality().hash(piecesById),
      const DeepCollectionEquality().hash(designsById),
      const DeepCollectionEquality().hash(imageFileNamesByDesignId),
      const DeepCollectionEquality().hash(allDesigns),
      const DeepCollectionEquality().hash(allPieces));

  @override
  String toString() {
    return 'PiecesState(blocStatus: $blocStatus, piecesById: $piecesById, designsById: $designsById, imageFileNamesByDesignId: $imageFileNamesByDesignId, allDesigns: $allDesigns, allPieces: $allPieces)';
  }
}

/// @nodoc
abstract mixin class $PiecesStateCopyWith<$Res> {
  factory $PiecesStateCopyWith(
          PiecesState value, $Res Function(PiecesState) _then) =
      _$PiecesStateCopyWithImpl;
  @useResult
  $Res call(
      {BlocStatus blocStatus,
      Map<String, Piece> piecesById,
      Map<String, Design> designsById,
      Map<String, List<String>> imageFileNamesByDesignId,
      List<Design> allDesigns,
      List<Piece> allPieces});
}

/// @nodoc
class _$PiecesStateCopyWithImpl<$Res> implements $PiecesStateCopyWith<$Res> {
  _$PiecesStateCopyWithImpl(this._self, this._then);

  final PiecesState _self;
  final $Res Function(PiecesState) _then;

  /// Create a copy of PiecesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blocStatus = null,
    Object? piecesById = null,
    Object? designsById = null,
    Object? imageFileNamesByDesignId = null,
    Object? allDesigns = null,
    Object? allPieces = null,
  }) {
    return _then(_self.copyWith(
      blocStatus: null == blocStatus
          ? _self.blocStatus
          : blocStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      piecesById: null == piecesById
          ? _self.piecesById
          : piecesById // ignore: cast_nullable_to_non_nullable
              as Map<String, Piece>,
      designsById: null == designsById
          ? _self.designsById
          : designsById // ignore: cast_nullable_to_non_nullable
              as Map<String, Design>,
      imageFileNamesByDesignId: null == imageFileNamesByDesignId
          ? _self.imageFileNamesByDesignId
          : imageFileNamesByDesignId // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      allDesigns: null == allDesigns
          ? _self.allDesigns
          : allDesigns // ignore: cast_nullable_to_non_nullable
              as List<Design>,
      allPieces: null == allPieces
          ? _self.allPieces
          : allPieces // ignore: cast_nullable_to_non_nullable
              as List<Piece>,
    ));
  }
}

/// Adds pattern-matching-related methods to [PiecesState].
extension PiecesStatePatterns on PiecesState {
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
    TResult Function(_PiecesState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PiecesState() when $default != null:
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
    TResult Function(_PiecesState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PiecesState():
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
    TResult? Function(_PiecesState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PiecesState() when $default != null:
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
    TResult Function(
            BlocStatus blocStatus,
            Map<String, Piece> piecesById,
            Map<String, Design> designsById,
            Map<String, List<String>> imageFileNamesByDesignId,
            List<Design> allDesigns,
            List<Piece> allPieces)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PiecesState() when $default != null:
        return $default(_that.blocStatus, _that.piecesById, _that.designsById,
            _that.imageFileNamesByDesignId, _that.allDesigns, _that.allPieces);
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
    TResult Function(
            BlocStatus blocStatus,
            Map<String, Piece> piecesById,
            Map<String, Design> designsById,
            Map<String, List<String>> imageFileNamesByDesignId,
            List<Design> allDesigns,
            List<Piece> allPieces)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PiecesState():
        return $default(_that.blocStatus, _that.piecesById, _that.designsById,
            _that.imageFileNamesByDesignId, _that.allDesigns, _that.allPieces);
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
    TResult? Function(
            BlocStatus blocStatus,
            Map<String, Piece> piecesById,
            Map<String, Design> designsById,
            Map<String, List<String>> imageFileNamesByDesignId,
            List<Design> allDesigns,
            List<Piece> allPieces)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PiecesState() when $default != null:
        return $default(_that.blocStatus, _that.piecesById, _that.designsById,
            _that.imageFileNamesByDesignId, _that.allDesigns, _that.allPieces);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PiecesState implements PiecesState {
  const _PiecesState(
      {this.blocStatus = const BlocStatus.ok(),
      final Map<String, Piece> piecesById = const {},
      final Map<String, Design> designsById = const {},
      final Map<String, List<String>> imageFileNamesByDesignId = const {},
      final List<Design> allDesigns = const [],
      final List<Piece> allPieces = const []})
      : _piecesById = piecesById,
        _designsById = designsById,
        _imageFileNamesByDesignId = imageFileNamesByDesignId,
        _allDesigns = allDesigns,
        _allPieces = allPieces;

  @override
  @JsonKey()
  final BlocStatus blocStatus;
  final Map<String, Piece> _piecesById;
  @override
  @JsonKey()
  Map<String, Piece> get piecesById {
    if (_piecesById is EqualUnmodifiableMapView) return _piecesById;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_piecesById);
  }

  final Map<String, Design> _designsById;
  @override
  @JsonKey()
  Map<String, Design> get designsById {
    if (_designsById is EqualUnmodifiableMapView) return _designsById;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_designsById);
  }

  final Map<String, List<String>> _imageFileNamesByDesignId;
  @override
  @JsonKey()
  Map<String, List<String>> get imageFileNamesByDesignId {
    if (_imageFileNamesByDesignId is EqualUnmodifiableMapView)
      return _imageFileNamesByDesignId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_imageFileNamesByDesignId);
  }

  final List<Design> _allDesigns;
  @override
  @JsonKey()
  List<Design> get allDesigns {
    if (_allDesigns is EqualUnmodifiableListView) return _allDesigns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allDesigns);
  }

  final List<Piece> _allPieces;
  @override
  @JsonKey()
  List<Piece> get allPieces {
    if (_allPieces is EqualUnmodifiableListView) return _allPieces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allPieces);
  }

  /// Create a copy of PiecesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PiecesStateCopyWith<_PiecesState> get copyWith =>
      __$PiecesStateCopyWithImpl<_PiecesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PiecesState &&
            (identical(other.blocStatus, blocStatus) ||
                other.blocStatus == blocStatus) &&
            const DeepCollectionEquality()
                .equals(other._piecesById, _piecesById) &&
            const DeepCollectionEquality()
                .equals(other._designsById, _designsById) &&
            const DeepCollectionEquality().equals(
                other._imageFileNamesByDesignId, _imageFileNamesByDesignId) &&
            const DeepCollectionEquality()
                .equals(other._allDesigns, _allDesigns) &&
            const DeepCollectionEquality()
                .equals(other._allPieces, _allPieces));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      blocStatus,
      const DeepCollectionEquality().hash(_piecesById),
      const DeepCollectionEquality().hash(_designsById),
      const DeepCollectionEquality().hash(_imageFileNamesByDesignId),
      const DeepCollectionEquality().hash(_allDesigns),
      const DeepCollectionEquality().hash(_allPieces));

  @override
  String toString() {
    return 'PiecesState(blocStatus: $blocStatus, piecesById: $piecesById, designsById: $designsById, imageFileNamesByDesignId: $imageFileNamesByDesignId, allDesigns: $allDesigns, allPieces: $allPieces)';
  }
}

/// @nodoc
abstract mixin class _$PiecesStateCopyWith<$Res>
    implements $PiecesStateCopyWith<$Res> {
  factory _$PiecesStateCopyWith(
          _PiecesState value, $Res Function(_PiecesState) _then) =
      __$PiecesStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {BlocStatus blocStatus,
      Map<String, Piece> piecesById,
      Map<String, Design> designsById,
      Map<String, List<String>> imageFileNamesByDesignId,
      List<Design> allDesigns,
      List<Piece> allPieces});
}

/// @nodoc
class __$PiecesStateCopyWithImpl<$Res> implements _$PiecesStateCopyWith<$Res> {
  __$PiecesStateCopyWithImpl(this._self, this._then);

  final _PiecesState _self;
  final $Res Function(_PiecesState) _then;

  /// Create a copy of PiecesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? blocStatus = null,
    Object? piecesById = null,
    Object? designsById = null,
    Object? imageFileNamesByDesignId = null,
    Object? allDesigns = null,
    Object? allPieces = null,
  }) {
    return _then(_PiecesState(
      blocStatus: null == blocStatus
          ? _self.blocStatus
          : blocStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      piecesById: null == piecesById
          ? _self._piecesById
          : piecesById // ignore: cast_nullable_to_non_nullable
              as Map<String, Piece>,
      designsById: null == designsById
          ? _self._designsById
          : designsById // ignore: cast_nullable_to_non_nullable
              as Map<String, Design>,
      imageFileNamesByDesignId: null == imageFileNamesByDesignId
          ? _self._imageFileNamesByDesignId
          : imageFileNamesByDesignId // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      allDesigns: null == allDesigns
          ? _self._allDesigns
          : allDesigns // ignore: cast_nullable_to_non_nullable
              as List<Design>,
      allPieces: null == allPieces
          ? _self._allPieces
          : allPieces // ignore: cast_nullable_to_non_nullable
              as List<Piece>,
    ));
  }
}

// dart format on
