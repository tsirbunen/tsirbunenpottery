// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collections_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CollectionsState {
  BlocStatus get blocStatus;
  List<Collection> get collections;
  Map<String, Design> get designsById;
  Map<String, Piece> get piecesById;
  Map<String, Map<String, List<String>>> get collectionDesigns;
  Map<String, List<String>> get imageFileNamesByDesignId;

  /// Create a copy of CollectionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CollectionsStateCopyWith<CollectionsState> get copyWith =>
      _$CollectionsStateCopyWithImpl<CollectionsState>(
          this as CollectionsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CollectionsState &&
            (identical(other.blocStatus, blocStatus) ||
                other.blocStatus == blocStatus) &&
            const DeepCollectionEquality()
                .equals(other.collections, collections) &&
            const DeepCollectionEquality()
                .equals(other.designsById, designsById) &&
            const DeepCollectionEquality()
                .equals(other.piecesById, piecesById) &&
            const DeepCollectionEquality()
                .equals(other.collectionDesigns, collectionDesigns) &&
            const DeepCollectionEquality().equals(
                other.imageFileNamesByDesignId, imageFileNamesByDesignId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      blocStatus,
      const DeepCollectionEquality().hash(collections),
      const DeepCollectionEquality().hash(designsById),
      const DeepCollectionEquality().hash(piecesById),
      const DeepCollectionEquality().hash(collectionDesigns),
      const DeepCollectionEquality().hash(imageFileNamesByDesignId));

  @override
  String toString() {
    return 'CollectionsState(blocStatus: $blocStatus, collections: $collections, designsById: $designsById, piecesById: $piecesById, collectionDesigns: $collectionDesigns, imageFileNamesByDesignId: $imageFileNamesByDesignId)';
  }
}

/// @nodoc
abstract mixin class $CollectionsStateCopyWith<$Res> {
  factory $CollectionsStateCopyWith(
          CollectionsState value, $Res Function(CollectionsState) _then) =
      _$CollectionsStateCopyWithImpl;
  @useResult
  $Res call(
      {BlocStatus blocStatus,
      List<Collection> collections,
      Map<String, Design> designsById,
      Map<String, Piece> piecesById,
      Map<String, Map<String, List<String>>> collectionDesigns,
      Map<String, List<String>> imageFileNamesByDesignId});
}

/// @nodoc
class _$CollectionsStateCopyWithImpl<$Res>
    implements $CollectionsStateCopyWith<$Res> {
  _$CollectionsStateCopyWithImpl(this._self, this._then);

  final CollectionsState _self;
  final $Res Function(CollectionsState) _then;

  /// Create a copy of CollectionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blocStatus = null,
    Object? collections = null,
    Object? designsById = null,
    Object? piecesById = null,
    Object? collectionDesigns = null,
    Object? imageFileNamesByDesignId = null,
  }) {
    return _then(_self.copyWith(
      blocStatus: null == blocStatus
          ? _self.blocStatus
          : blocStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      collections: null == collections
          ? _self.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<Collection>,
      designsById: null == designsById
          ? _self.designsById
          : designsById // ignore: cast_nullable_to_non_nullable
              as Map<String, Design>,
      piecesById: null == piecesById
          ? _self.piecesById
          : piecesById // ignore: cast_nullable_to_non_nullable
              as Map<String, Piece>,
      collectionDesigns: null == collectionDesigns
          ? _self.collectionDesigns
          : collectionDesigns // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, List<String>>>,
      imageFileNamesByDesignId: null == imageFileNamesByDesignId
          ? _self.imageFileNamesByDesignId
          : imageFileNamesByDesignId // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
    ));
  }
}

/// Adds pattern-matching-related methods to [CollectionsState].
extension CollectionsStatePatterns on CollectionsState {
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
    TResult Function(_CollectionsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CollectionsState() when $default != null:
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
    TResult Function(_CollectionsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CollectionsState():
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
    TResult? Function(_CollectionsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CollectionsState() when $default != null:
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
            List<Collection> collections,
            Map<String, Design> designsById,
            Map<String, Piece> piecesById,
            Map<String, Map<String, List<String>>> collectionDesigns,
            Map<String, List<String>> imageFileNamesByDesignId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CollectionsState() when $default != null:
        return $default(
            _that.blocStatus,
            _that.collections,
            _that.designsById,
            _that.piecesById,
            _that.collectionDesigns,
            _that.imageFileNamesByDesignId);
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
            List<Collection> collections,
            Map<String, Design> designsById,
            Map<String, Piece> piecesById,
            Map<String, Map<String, List<String>>> collectionDesigns,
            Map<String, List<String>> imageFileNamesByDesignId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CollectionsState():
        return $default(
            _that.blocStatus,
            _that.collections,
            _that.designsById,
            _that.piecesById,
            _that.collectionDesigns,
            _that.imageFileNamesByDesignId);
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
            List<Collection> collections,
            Map<String, Design> designsById,
            Map<String, Piece> piecesById,
            Map<String, Map<String, List<String>>> collectionDesigns,
            Map<String, List<String>> imageFileNamesByDesignId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CollectionsState() when $default != null:
        return $default(
            _that.blocStatus,
            _that.collections,
            _that.designsById,
            _that.piecesById,
            _that.collectionDesigns,
            _that.imageFileNamesByDesignId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CollectionsState extends CollectionsState {
  const _CollectionsState(
      {this.blocStatus = const BlocStatus.ok(),
      final List<Collection> collections = const [],
      final Map<String, Design> designsById = const {},
      final Map<String, Piece> piecesById = const {},
      final Map<String, Map<String, List<String>>> collectionDesigns = const {},
      final Map<String, List<String>> imageFileNamesByDesignId = const {}})
      : _collections = collections,
        _designsById = designsById,
        _piecesById = piecesById,
        _collectionDesigns = collectionDesigns,
        _imageFileNamesByDesignId = imageFileNamesByDesignId,
        super._();

  @override
  @JsonKey()
  final BlocStatus blocStatus;
  final List<Collection> _collections;
  @override
  @JsonKey()
  List<Collection> get collections {
    if (_collections is EqualUnmodifiableListView) return _collections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collections);
  }

  final Map<String, Design> _designsById;
  @override
  @JsonKey()
  Map<String, Design> get designsById {
    if (_designsById is EqualUnmodifiableMapView) return _designsById;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_designsById);
  }

  final Map<String, Piece> _piecesById;
  @override
  @JsonKey()
  Map<String, Piece> get piecesById {
    if (_piecesById is EqualUnmodifiableMapView) return _piecesById;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_piecesById);
  }

  final Map<String, Map<String, List<String>>> _collectionDesigns;
  @override
  @JsonKey()
  Map<String, Map<String, List<String>>> get collectionDesigns {
    if (_collectionDesigns is EqualUnmodifiableMapView)
      return _collectionDesigns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_collectionDesigns);
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

  /// Create a copy of CollectionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CollectionsStateCopyWith<_CollectionsState> get copyWith =>
      __$CollectionsStateCopyWithImpl<_CollectionsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CollectionsState &&
            (identical(other.blocStatus, blocStatus) ||
                other.blocStatus == blocStatus) &&
            const DeepCollectionEquality()
                .equals(other._collections, _collections) &&
            const DeepCollectionEquality()
                .equals(other._designsById, _designsById) &&
            const DeepCollectionEquality()
                .equals(other._piecesById, _piecesById) &&
            const DeepCollectionEquality()
                .equals(other._collectionDesigns, _collectionDesigns) &&
            const DeepCollectionEquality().equals(
                other._imageFileNamesByDesignId, _imageFileNamesByDesignId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      blocStatus,
      const DeepCollectionEquality().hash(_collections),
      const DeepCollectionEquality().hash(_designsById),
      const DeepCollectionEquality().hash(_piecesById),
      const DeepCollectionEquality().hash(_collectionDesigns),
      const DeepCollectionEquality().hash(_imageFileNamesByDesignId));

  @override
  String toString() {
    return 'CollectionsState(blocStatus: $blocStatus, collections: $collections, designsById: $designsById, piecesById: $piecesById, collectionDesigns: $collectionDesigns, imageFileNamesByDesignId: $imageFileNamesByDesignId)';
  }
}

/// @nodoc
abstract mixin class _$CollectionsStateCopyWith<$Res>
    implements $CollectionsStateCopyWith<$Res> {
  factory _$CollectionsStateCopyWith(
          _CollectionsState value, $Res Function(_CollectionsState) _then) =
      __$CollectionsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {BlocStatus blocStatus,
      List<Collection> collections,
      Map<String, Design> designsById,
      Map<String, Piece> piecesById,
      Map<String, Map<String, List<String>>> collectionDesigns,
      Map<String, List<String>> imageFileNamesByDesignId});
}

/// @nodoc
class __$CollectionsStateCopyWithImpl<$Res>
    implements _$CollectionsStateCopyWith<$Res> {
  __$CollectionsStateCopyWithImpl(this._self, this._then);

  final _CollectionsState _self;
  final $Res Function(_CollectionsState) _then;

  /// Create a copy of CollectionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? blocStatus = null,
    Object? collections = null,
    Object? designsById = null,
    Object? piecesById = null,
    Object? collectionDesigns = null,
    Object? imageFileNamesByDesignId = null,
  }) {
    return _then(_CollectionsState(
      blocStatus: null == blocStatus
          ? _self.blocStatus
          : blocStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      collections: null == collections
          ? _self._collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<Collection>,
      designsById: null == designsById
          ? _self._designsById
          : designsById // ignore: cast_nullable_to_non_nullable
              as Map<String, Design>,
      piecesById: null == piecesById
          ? _self._piecesById
          : piecesById // ignore: cast_nullable_to_non_nullable
              as Map<String, Piece>,
      collectionDesigns: null == collectionDesigns
          ? _self._collectionDesigns
          : collectionDesigns // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, List<String>>>,
      imageFileNamesByDesignId: null == imageFileNamesByDesignId
          ? _self._imageFileNamesByDesignId
          : imageFileNamesByDesignId // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
    ));
  }
}

// dart format on
