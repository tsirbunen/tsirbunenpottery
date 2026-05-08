// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoriesState {
  BlocStatus get blocStatus;
  Map<String, Design> get designsById;
  Map<String, Map<String, List<String>>> get categoryDesigns;
  Map<String, List<String>> get imageFileNamesByDesignId;
  Map<String, Category> get categoriesById;
  Map<String, Piece> get piecesById;

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoriesStateCopyWith<CategoriesState> get copyWith =>
      _$CategoriesStateCopyWithImpl<CategoriesState>(
          this as CategoriesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoriesState &&
            (identical(other.blocStatus, blocStatus) ||
                other.blocStatus == blocStatus) &&
            const DeepCollectionEquality()
                .equals(other.designsById, designsById) &&
            const DeepCollectionEquality()
                .equals(other.categoryDesigns, categoryDesigns) &&
            const DeepCollectionEquality().equals(
                other.imageFileNamesByDesignId, imageFileNamesByDesignId) &&
            const DeepCollectionEquality()
                .equals(other.categoriesById, categoriesById) &&
            const DeepCollectionEquality()
                .equals(other.piecesById, piecesById));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      blocStatus,
      const DeepCollectionEquality().hash(designsById),
      const DeepCollectionEquality().hash(categoryDesigns),
      const DeepCollectionEquality().hash(imageFileNamesByDesignId),
      const DeepCollectionEquality().hash(categoriesById),
      const DeepCollectionEquality().hash(piecesById));

  @override
  String toString() {
    return 'CategoriesState(blocStatus: $blocStatus, designsById: $designsById, categoryDesigns: $categoryDesigns, imageFileNamesByDesignId: $imageFileNamesByDesignId, categoriesById: $categoriesById, piecesById: $piecesById)';
  }
}

/// @nodoc
abstract mixin class $CategoriesStateCopyWith<$Res> {
  factory $CategoriesStateCopyWith(
          CategoriesState value, $Res Function(CategoriesState) _then) =
      _$CategoriesStateCopyWithImpl;
  @useResult
  $Res call(
      {BlocStatus blocStatus,
      Map<String, Design> designsById,
      Map<String, Map<String, List<String>>> categoryDesigns,
      Map<String, List<String>> imageFileNamesByDesignId,
      Map<String, Category> categoriesById,
      Map<String, Piece> piecesById});
}

/// @nodoc
class _$CategoriesStateCopyWithImpl<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  _$CategoriesStateCopyWithImpl(this._self, this._then);

  final CategoriesState _self;
  final $Res Function(CategoriesState) _then;

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blocStatus = null,
    Object? designsById = null,
    Object? categoryDesigns = null,
    Object? imageFileNamesByDesignId = null,
    Object? categoriesById = null,
    Object? piecesById = null,
  }) {
    return _then(_self.copyWith(
      blocStatus: null == blocStatus
          ? _self.blocStatus
          : blocStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      designsById: null == designsById
          ? _self.designsById
          : designsById // ignore: cast_nullable_to_non_nullable
              as Map<String, Design>,
      categoryDesigns: null == categoryDesigns
          ? _self.categoryDesigns
          : categoryDesigns // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, List<String>>>,
      imageFileNamesByDesignId: null == imageFileNamesByDesignId
          ? _self.imageFileNamesByDesignId
          : imageFileNamesByDesignId // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      categoriesById: null == categoriesById
          ? _self.categoriesById
          : categoriesById // ignore: cast_nullable_to_non_nullable
              as Map<String, Category>,
      piecesById: null == piecesById
          ? _self.piecesById
          : piecesById // ignore: cast_nullable_to_non_nullable
              as Map<String, Piece>,
    ));
  }
}

/// Adds pattern-matching-related methods to [CategoriesState].
extension CategoriesStatePatterns on CategoriesState {
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
    TResult Function(_CategoriesState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoriesState() when $default != null:
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
    TResult Function(_CategoriesState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoriesState():
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
    TResult? Function(_CategoriesState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoriesState() when $default != null:
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
            Map<String, Design> designsById,
            Map<String, Map<String, List<String>>> categoryDesigns,
            Map<String, List<String>> imageFileNamesByDesignId,
            Map<String, Category> categoriesById,
            Map<String, Piece> piecesById)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoriesState() when $default != null:
        return $default(
            _that.blocStatus,
            _that.designsById,
            _that.categoryDesigns,
            _that.imageFileNamesByDesignId,
            _that.categoriesById,
            _that.piecesById);
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
            Map<String, Design> designsById,
            Map<String, Map<String, List<String>>> categoryDesigns,
            Map<String, List<String>> imageFileNamesByDesignId,
            Map<String, Category> categoriesById,
            Map<String, Piece> piecesById)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoriesState():
        return $default(
            _that.blocStatus,
            _that.designsById,
            _that.categoryDesigns,
            _that.imageFileNamesByDesignId,
            _that.categoriesById,
            _that.piecesById);
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
            Map<String, Design> designsById,
            Map<String, Map<String, List<String>>> categoryDesigns,
            Map<String, List<String>> imageFileNamesByDesignId,
            Map<String, Category> categoriesById,
            Map<String, Piece> piecesById)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoriesState() when $default != null:
        return $default(
            _that.blocStatus,
            _that.designsById,
            _that.categoryDesigns,
            _that.imageFileNamesByDesignId,
            _that.categoriesById,
            _that.piecesById);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CategoriesState implements CategoriesState {
  const _CategoriesState(
      {this.blocStatus = const BlocStatus.ok(),
      final Map<String, Design> designsById = const {},
      final Map<String, Map<String, List<String>>> categoryDesigns = const {},
      final Map<String, List<String>> imageFileNamesByDesignId = const {},
      final Map<String, Category> categoriesById = const {},
      final Map<String, Piece> piecesById = const {}})
      : _designsById = designsById,
        _categoryDesigns = categoryDesigns,
        _imageFileNamesByDesignId = imageFileNamesByDesignId,
        _categoriesById = categoriesById,
        _piecesById = piecesById;

  @override
  @JsonKey()
  final BlocStatus blocStatus;
  final Map<String, Design> _designsById;
  @override
  @JsonKey()
  Map<String, Design> get designsById {
    if (_designsById is EqualUnmodifiableMapView) return _designsById;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_designsById);
  }

  final Map<String, Map<String, List<String>>> _categoryDesigns;
  @override
  @JsonKey()
  Map<String, Map<String, List<String>>> get categoryDesigns {
    if (_categoryDesigns is EqualUnmodifiableMapView) return _categoryDesigns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryDesigns);
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

  final Map<String, Category> _categoriesById;
  @override
  @JsonKey()
  Map<String, Category> get categoriesById {
    if (_categoriesById is EqualUnmodifiableMapView) return _categoriesById;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoriesById);
  }

  final Map<String, Piece> _piecesById;
  @override
  @JsonKey()
  Map<String, Piece> get piecesById {
    if (_piecesById is EqualUnmodifiableMapView) return _piecesById;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_piecesById);
  }

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoriesStateCopyWith<_CategoriesState> get copyWith =>
      __$CategoriesStateCopyWithImpl<_CategoriesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoriesState &&
            (identical(other.blocStatus, blocStatus) ||
                other.blocStatus == blocStatus) &&
            const DeepCollectionEquality()
                .equals(other._designsById, _designsById) &&
            const DeepCollectionEquality()
                .equals(other._categoryDesigns, _categoryDesigns) &&
            const DeepCollectionEquality().equals(
                other._imageFileNamesByDesignId, _imageFileNamesByDesignId) &&
            const DeepCollectionEquality()
                .equals(other._categoriesById, _categoriesById) &&
            const DeepCollectionEquality()
                .equals(other._piecesById, _piecesById));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      blocStatus,
      const DeepCollectionEquality().hash(_designsById),
      const DeepCollectionEquality().hash(_categoryDesigns),
      const DeepCollectionEquality().hash(_imageFileNamesByDesignId),
      const DeepCollectionEquality().hash(_categoriesById),
      const DeepCollectionEquality().hash(_piecesById));

  @override
  String toString() {
    return 'CategoriesState(blocStatus: $blocStatus, designsById: $designsById, categoryDesigns: $categoryDesigns, imageFileNamesByDesignId: $imageFileNamesByDesignId, categoriesById: $categoriesById, piecesById: $piecesById)';
  }
}

/// @nodoc
abstract mixin class _$CategoriesStateCopyWith<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  factory _$CategoriesStateCopyWith(
          _CategoriesState value, $Res Function(_CategoriesState) _then) =
      __$CategoriesStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {BlocStatus blocStatus,
      Map<String, Design> designsById,
      Map<String, Map<String, List<String>>> categoryDesigns,
      Map<String, List<String>> imageFileNamesByDesignId,
      Map<String, Category> categoriesById,
      Map<String, Piece> piecesById});
}

/// @nodoc
class __$CategoriesStateCopyWithImpl<$Res>
    implements _$CategoriesStateCopyWith<$Res> {
  __$CategoriesStateCopyWithImpl(this._self, this._then);

  final _CategoriesState _self;
  final $Res Function(_CategoriesState) _then;

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? blocStatus = null,
    Object? designsById = null,
    Object? categoryDesigns = null,
    Object? imageFileNamesByDesignId = null,
    Object? categoriesById = null,
    Object? piecesById = null,
  }) {
    return _then(_CategoriesState(
      blocStatus: null == blocStatus
          ? _self.blocStatus
          : blocStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      designsById: null == designsById
          ? _self._designsById
          : designsById // ignore: cast_nullable_to_non_nullable
              as Map<String, Design>,
      categoryDesigns: null == categoryDesigns
          ? _self._categoryDesigns
          : categoryDesigns // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, List<String>>>,
      imageFileNamesByDesignId: null == imageFileNamesByDesignId
          ? _self._imageFileNamesByDesignId
          : imageFileNamesByDesignId // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      categoriesById: null == categoriesById
          ? _self._categoriesById
          : categoriesById // ignore: cast_nullable_to_non_nullable
              as Map<String, Category>,
      piecesById: null == piecesById
          ? _self._piecesById
          : piecesById // ignore: cast_nullable_to_non_nullable
              as Map<String, Piece>,
    ));
  }
}

// dart format on
