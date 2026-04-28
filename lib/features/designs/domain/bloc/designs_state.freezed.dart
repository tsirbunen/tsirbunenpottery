// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'designs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DesignsState {
  BlocStatus get blocStatus;
  Map<String, Design> get designsById;
  Map<String, List<String>> get imageFileNamesByDesignId;
  Map<String, List<Piece>> get piecesByDesignId;

  /// Create a copy of DesignsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DesignsStateCopyWith<DesignsState> get copyWith =>
      _$DesignsStateCopyWithImpl<DesignsState>(
          this as DesignsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DesignsState &&
            (identical(other.blocStatus, blocStatus) ||
                other.blocStatus == blocStatus) &&
            const DeepCollectionEquality()
                .equals(other.designsById, designsById) &&
            const DeepCollectionEquality().equals(
                other.imageFileNamesByDesignId, imageFileNamesByDesignId) &&
            const DeepCollectionEquality()
                .equals(other.piecesByDesignId, piecesByDesignId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      blocStatus,
      const DeepCollectionEquality().hash(designsById),
      const DeepCollectionEquality().hash(imageFileNamesByDesignId),
      const DeepCollectionEquality().hash(piecesByDesignId));

  @override
  String toString() {
    return 'DesignsState(blocStatus: $blocStatus, designsById: $designsById, imageFileNamesByDesignId: $imageFileNamesByDesignId, piecesByDesignId: $piecesByDesignId)';
  }
}

/// @nodoc
abstract mixin class $DesignsStateCopyWith<$Res> {
  factory $DesignsStateCopyWith(
          DesignsState value, $Res Function(DesignsState) _then) =
      _$DesignsStateCopyWithImpl;
  @useResult
  $Res call(
      {BlocStatus blocStatus,
      Map<String, Design> designsById,
      Map<String, List<String>> imageFileNamesByDesignId,
      Map<String, List<Piece>> piecesByDesignId});
}

/// @nodoc
class _$DesignsStateCopyWithImpl<$Res> implements $DesignsStateCopyWith<$Res> {
  _$DesignsStateCopyWithImpl(this._self, this._then);

  final DesignsState _self;
  final $Res Function(DesignsState) _then;

  /// Create a copy of DesignsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blocStatus = null,
    Object? designsById = null,
    Object? imageFileNamesByDesignId = null,
    Object? piecesByDesignId = null,
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
      imageFileNamesByDesignId: null == imageFileNamesByDesignId
          ? _self.imageFileNamesByDesignId
          : imageFileNamesByDesignId // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      piecesByDesignId: null == piecesByDesignId
          ? _self.piecesByDesignId
          : piecesByDesignId // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Piece>>,
    ));
  }
}

/// Adds pattern-matching-related methods to [DesignsState].
extension DesignsStatePatterns on DesignsState {
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
    TResult Function(_DesignsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DesignsState() when $default != null:
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
    TResult Function(_DesignsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DesignsState():
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
    TResult? Function(_DesignsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DesignsState() when $default != null:
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
            Map<String, List<String>> imageFileNamesByDesignId,
            Map<String, List<Piece>> piecesByDesignId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DesignsState() when $default != null:
        return $default(_that.blocStatus, _that.designsById,
            _that.imageFileNamesByDesignId, _that.piecesByDesignId);
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
            Map<String, List<String>> imageFileNamesByDesignId,
            Map<String, List<Piece>> piecesByDesignId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DesignsState():
        return $default(_that.blocStatus, _that.designsById,
            _that.imageFileNamesByDesignId, _that.piecesByDesignId);
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
            Map<String, List<String>> imageFileNamesByDesignId,
            Map<String, List<Piece>> piecesByDesignId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DesignsState() when $default != null:
        return $default(_that.blocStatus, _that.designsById,
            _that.imageFileNamesByDesignId, _that.piecesByDesignId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DesignsState extends DesignsState {
  const _DesignsState(
      {this.blocStatus = const BlocStatus.ok(),
      final Map<String, Design> designsById = const {},
      final Map<String, List<String>> imageFileNamesByDesignId = const {},
      final Map<String, List<Piece>> piecesByDesignId = const {}})
      : _designsById = designsById,
        _imageFileNamesByDesignId = imageFileNamesByDesignId,
        _piecesByDesignId = piecesByDesignId,
        super._();

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

  final Map<String, List<String>> _imageFileNamesByDesignId;
  @override
  @JsonKey()
  Map<String, List<String>> get imageFileNamesByDesignId {
    if (_imageFileNamesByDesignId is EqualUnmodifiableMapView)
      return _imageFileNamesByDesignId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_imageFileNamesByDesignId);
  }

  final Map<String, List<Piece>> _piecesByDesignId;
  @override
  @JsonKey()
  Map<String, List<Piece>> get piecesByDesignId {
    if (_piecesByDesignId is EqualUnmodifiableMapView) return _piecesByDesignId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_piecesByDesignId);
  }

  /// Create a copy of DesignsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DesignsStateCopyWith<_DesignsState> get copyWith =>
      __$DesignsStateCopyWithImpl<_DesignsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DesignsState &&
            (identical(other.blocStatus, blocStatus) ||
                other.blocStatus == blocStatus) &&
            const DeepCollectionEquality()
                .equals(other._designsById, _designsById) &&
            const DeepCollectionEquality().equals(
                other._imageFileNamesByDesignId, _imageFileNamesByDesignId) &&
            const DeepCollectionEquality()
                .equals(other._piecesByDesignId, _piecesByDesignId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      blocStatus,
      const DeepCollectionEquality().hash(_designsById),
      const DeepCollectionEquality().hash(_imageFileNamesByDesignId),
      const DeepCollectionEquality().hash(_piecesByDesignId));

  @override
  String toString() {
    return 'DesignsState(blocStatus: $blocStatus, designsById: $designsById, imageFileNamesByDesignId: $imageFileNamesByDesignId, piecesByDesignId: $piecesByDesignId)';
  }
}

/// @nodoc
abstract mixin class _$DesignsStateCopyWith<$Res>
    implements $DesignsStateCopyWith<$Res> {
  factory _$DesignsStateCopyWith(
          _DesignsState value, $Res Function(_DesignsState) _then) =
      __$DesignsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {BlocStatus blocStatus,
      Map<String, Design> designsById,
      Map<String, List<String>> imageFileNamesByDesignId,
      Map<String, List<Piece>> piecesByDesignId});
}

/// @nodoc
class __$DesignsStateCopyWithImpl<$Res>
    implements _$DesignsStateCopyWith<$Res> {
  __$DesignsStateCopyWithImpl(this._self, this._then);

  final _DesignsState _self;
  final $Res Function(_DesignsState) _then;

  /// Create a copy of DesignsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? blocStatus = null,
    Object? designsById = null,
    Object? imageFileNamesByDesignId = null,
    Object? piecesByDesignId = null,
  }) {
    return _then(_DesignsState(
      blocStatus: null == blocStatus
          ? _self.blocStatus
          : blocStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      designsById: null == designsById
          ? _self._designsById
          : designsById // ignore: cast_nullable_to_non_nullable
              as Map<String, Design>,
      imageFileNamesByDesignId: null == imageFileNamesByDesignId
          ? _self._imageFileNamesByDesignId
          : imageFileNamesByDesignId // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      piecesByDesignId: null == piecesByDesignId
          ? _self._piecesByDesignId
          : piecesByDesignId // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Piece>>,
    ));
  }
}

// dart format on
