// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Collection {
  String get id;
  Map<Language, String> get names;
  Map<Language, String> get description;

  /// Create a copy of Collection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CollectionCopyWith<Collection> get copyWith =>
      _$CollectionCopyWithImpl<Collection>(this as Collection, _$identity);

  /// Serializes this Collection to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Collection &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.names, names) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(names),
      const DeepCollectionEquality().hash(description));

  @override
  String toString() {
    return 'Collection(id: $id, names: $names, description: $description)';
  }
}

/// @nodoc
abstract mixin class $CollectionCopyWith<$Res> {
  factory $CollectionCopyWith(
          Collection value, $Res Function(Collection) _then) =
      _$CollectionCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      Map<Language, String> names,
      Map<Language, String> description});
}

/// @nodoc
class _$CollectionCopyWithImpl<$Res> implements $CollectionCopyWith<$Res> {
  _$CollectionCopyWithImpl(this._self, this._then);

  final Collection _self;
  final $Res Function(Collection) _then;

  /// Create a copy of Collection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? names = null,
    Object? description = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      names: null == names
          ? _self.names
          : names // ignore: cast_nullable_to_non_nullable
              as Map<Language, String>,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as Map<Language, String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Collection].
extension CollectionPatterns on Collection {
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
    TResult Function(_Collection value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Collection() when $default != null:
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
    TResult Function(_Collection value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Collection():
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
    TResult? Function(_Collection value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Collection() when $default != null:
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
    TResult Function(String id, Map<Language, String> names,
            Map<Language, String> description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Collection() when $default != null:
        return $default(_that.id, _that.names, _that.description);
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
    TResult Function(String id, Map<Language, String> names,
            Map<Language, String> description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Collection():
        return $default(_that.id, _that.names, _that.description);
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
    TResult? Function(String id, Map<Language, String> names,
            Map<Language, String> description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Collection() when $default != null:
        return $default(_that.id, _that.names, _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Collection implements Collection {
  const _Collection(
      {required this.id,
      required final Map<Language, String> names,
      required final Map<Language, String> description})
      : _names = names,
        _description = description;
  factory _Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);

  @override
  final String id;
  final Map<Language, String> _names;
  @override
  Map<Language, String> get names {
    if (_names is EqualUnmodifiableMapView) return _names;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_names);
  }

  final Map<Language, String> _description;
  @override
  Map<Language, String> get description {
    if (_description is EqualUnmodifiableMapView) return _description;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_description);
  }

  /// Create a copy of Collection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CollectionCopyWith<_Collection> get copyWith =>
      __$CollectionCopyWithImpl<_Collection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CollectionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Collection &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._names, _names) &&
            const DeepCollectionEquality()
                .equals(other._description, _description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_names),
      const DeepCollectionEquality().hash(_description));

  @override
  String toString() {
    return 'Collection(id: $id, names: $names, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$CollectionCopyWith<$Res>
    implements $CollectionCopyWith<$Res> {
  factory _$CollectionCopyWith(
          _Collection value, $Res Function(_Collection) _then) =
      __$CollectionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      Map<Language, String> names,
      Map<Language, String> description});
}

/// @nodoc
class __$CollectionCopyWithImpl<$Res> implements _$CollectionCopyWith<$Res> {
  __$CollectionCopyWithImpl(this._self, this._then);

  final _Collection _self;
  final $Res Function(_Collection) _then;

  /// Create a copy of Collection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? names = null,
    Object? description = null,
  }) {
    return _then(_Collection(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      names: null == names
          ? _self._names
          : names // ignore: cast_nullable_to_non_nullable
              as Map<Language, String>,
      description: null == description
          ? _self._description
          : description // ignore: cast_nullable_to_non_nullable
              as Map<Language, String>,
    ));
  }
}

// dart format on
