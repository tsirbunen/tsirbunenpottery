// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'design.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Design {
  String get id;
  Map<Language, String> get names;
  List<String> get categoryIds;
  Map<Language, String> get description;
  Map<Language, Map<String, String>> get details;

  /// Create a copy of Design
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DesignCopyWith<Design> get copyWith =>
      _$DesignCopyWithImpl<Design>(this as Design, _$identity);

  /// Serializes this Design to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Design &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.names, names) &&
            const DeepCollectionEquality()
                .equals(other.categoryIds, categoryIds) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.details, details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(names),
      const DeepCollectionEquality().hash(categoryIds),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(details));

  @override
  String toString() {
    return 'Design(id: $id, names: $names, categoryIds: $categoryIds, description: $description, details: $details)';
  }
}

/// @nodoc
abstract mixin class $DesignCopyWith<$Res> {
  factory $DesignCopyWith(Design value, $Res Function(Design) _then) =
      _$DesignCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      Map<Language, String> names,
      List<String> categoryIds,
      Map<Language, String> description,
      Map<Language, Map<String, String>> details});
}

/// @nodoc
class _$DesignCopyWithImpl<$Res> implements $DesignCopyWith<$Res> {
  _$DesignCopyWithImpl(this._self, this._then);

  final Design _self;
  final $Res Function(Design) _then;

  /// Create a copy of Design
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? names = null,
    Object? categoryIds = null,
    Object? description = null,
    Object? details = null,
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
      categoryIds: null == categoryIds
          ? _self.categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as Map<Language, String>,
      details: null == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<Language, Map<String, String>>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Design].
extension DesignPatterns on Design {
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
    TResult Function(_Design value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Design() when $default != null:
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
    TResult Function(_Design value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Design():
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
    TResult? Function(_Design value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Design() when $default != null:
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
            String id,
            Map<Language, String> names,
            List<String> categoryIds,
            Map<Language, String> description,
            Map<Language, Map<String, String>> details)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Design() when $default != null:
        return $default(_that.id, _that.names, _that.categoryIds,
            _that.description, _that.details);
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
            String id,
            Map<Language, String> names,
            List<String> categoryIds,
            Map<Language, String> description,
            Map<Language, Map<String, String>> details)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Design():
        return $default(_that.id, _that.names, _that.categoryIds,
            _that.description, _that.details);
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
            String id,
            Map<Language, String> names,
            List<String> categoryIds,
            Map<Language, String> description,
            Map<Language, Map<String, String>> details)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Design() when $default != null:
        return $default(_that.id, _that.names, _that.categoryIds,
            _that.description, _that.details);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Design implements Design {
  const _Design(
      {required this.id,
      required final Map<Language, String> names,
      required final List<String> categoryIds,
      required final Map<Language, String> description,
      required final Map<Language, Map<String, String>> details})
      : _names = names,
        _categoryIds = categoryIds,
        _description = description,
        _details = details;
  factory _Design.fromJson(Map<String, dynamic> json) => _$DesignFromJson(json);

  @override
  final String id;
  final Map<Language, String> _names;
  @override
  Map<Language, String> get names {
    if (_names is EqualUnmodifiableMapView) return _names;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_names);
  }

  final List<String> _categoryIds;
  @override
  List<String> get categoryIds {
    if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryIds);
  }

  final Map<Language, String> _description;
  @override
  Map<Language, String> get description {
    if (_description is EqualUnmodifiableMapView) return _description;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_description);
  }

  final Map<Language, Map<String, String>> _details;
  @override
  Map<Language, Map<String, String>> get details {
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_details);
  }

  /// Create a copy of Design
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DesignCopyWith<_Design> get copyWith =>
      __$DesignCopyWithImpl<_Design>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DesignToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Design &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._names, _names) &&
            const DeepCollectionEquality()
                .equals(other._categoryIds, _categoryIds) &&
            const DeepCollectionEquality()
                .equals(other._description, _description) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_names),
      const DeepCollectionEquality().hash(_categoryIds),
      const DeepCollectionEquality().hash(_description),
      const DeepCollectionEquality().hash(_details));

  @override
  String toString() {
    return 'Design(id: $id, names: $names, categoryIds: $categoryIds, description: $description, details: $details)';
  }
}

/// @nodoc
abstract mixin class _$DesignCopyWith<$Res> implements $DesignCopyWith<$Res> {
  factory _$DesignCopyWith(_Design value, $Res Function(_Design) _then) =
      __$DesignCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      Map<Language, String> names,
      List<String> categoryIds,
      Map<Language, String> description,
      Map<Language, Map<String, String>> details});
}

/// @nodoc
class __$DesignCopyWithImpl<$Res> implements _$DesignCopyWith<$Res> {
  __$DesignCopyWithImpl(this._self, this._then);

  final _Design _self;
  final $Res Function(_Design) _then;

  /// Create a copy of Design
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? names = null,
    Object? categoryIds = null,
    Object? description = null,
    Object? details = null,
  }) {
    return _then(_Design(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      names: null == names
          ? _self._names
          : names // ignore: cast_nullable_to_non_nullable
              as Map<Language, String>,
      categoryIds: null == categoryIds
          ? _self._categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _self._description
          : description // ignore: cast_nullable_to_non_nullable
              as Map<Language, String>,
      details: null == details
          ? _self._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<Language, Map<String, String>>,
    ));
  }
}

// dart format on
