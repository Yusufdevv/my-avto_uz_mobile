// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cars_in_dealer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CarsInDealerEvent {
  String get slug => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String slug) getResults,
    required TResult Function(String slug) getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String slug)? getResults,
    TResult? Function(String slug)? getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String slug)? getResults,
    TResult Function(String slug)? getMoreResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetMoreResults value) getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetMoreResults value)? getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CarsInDealerEventCopyWith<CarsInDealerEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarsInDealerEventCopyWith<$Res> {
  factory $CarsInDealerEventCopyWith(
          CarsInDealerEvent value, $Res Function(CarsInDealerEvent) then) =
      _$CarsInDealerEventCopyWithImpl<$Res, CarsInDealerEvent>;
  @useResult
  $Res call({String slug});
}

/// @nodoc
class _$CarsInDealerEventCopyWithImpl<$Res, $Val extends CarsInDealerEvent>
    implements $CarsInDealerEventCopyWith<$Res> {
  _$CarsInDealerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
  }) {
    return _then(_value.copyWith(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetResultsCopyWith<$Res>
    implements $CarsInDealerEventCopyWith<$Res> {
  factory _$$_GetResultsCopyWith(
          _$_GetResults value, $Res Function(_$_GetResults) then) =
      __$$_GetResultsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String slug});
}

/// @nodoc
class __$$_GetResultsCopyWithImpl<$Res>
    extends _$CarsInDealerEventCopyWithImpl<$Res, _$_GetResults>
    implements _$$_GetResultsCopyWith<$Res> {
  __$$_GetResultsCopyWithImpl(
      _$_GetResults _value, $Res Function(_$_GetResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
  }) {
    return _then(_$_GetResults(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetResults implements _GetResults {
  _$_GetResults({required this.slug});

  @override
  final String slug;

  @override
  String toString() {
    return 'CarsInDealerEvent.getResults(slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetResults &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetResultsCopyWith<_$_GetResults> get copyWith =>
      __$$_GetResultsCopyWithImpl<_$_GetResults>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String slug) getResults,
    required TResult Function(String slug) getMoreResults,
  }) {
    return getResults(slug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String slug)? getResults,
    TResult? Function(String slug)? getMoreResults,
  }) {
    return getResults?.call(slug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String slug)? getResults,
    TResult Function(String slug)? getMoreResults,
    required TResult orElse(),
  }) {
    if (getResults != null) {
      return getResults(slug);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetMoreResults value) getMoreResults,
  }) {
    return getResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetMoreResults value)? getMoreResults,
  }) {
    return getResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    required TResult orElse(),
  }) {
    if (getResults != null) {
      return getResults(this);
    }
    return orElse();
  }
}

abstract class _GetResults implements CarsInDealerEvent {
  factory _GetResults({required final String slug}) = _$_GetResults;

  @override
  String get slug;
  @override
  @JsonKey(ignore: true)
  _$$_GetResultsCopyWith<_$_GetResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMoreResultsCopyWith<$Res>
    implements $CarsInDealerEventCopyWith<$Res> {
  factory _$$_GetMoreResultsCopyWith(
          _$_GetMoreResults value, $Res Function(_$_GetMoreResults) then) =
      __$$_GetMoreResultsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String slug});
}

/// @nodoc
class __$$_GetMoreResultsCopyWithImpl<$Res>
    extends _$CarsInDealerEventCopyWithImpl<$Res, _$_GetMoreResults>
    implements _$$_GetMoreResultsCopyWith<$Res> {
  __$$_GetMoreResultsCopyWithImpl(
      _$_GetMoreResults _value, $Res Function(_$_GetMoreResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
  }) {
    return _then(_$_GetMoreResults(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetMoreResults implements _GetMoreResults {
  _$_GetMoreResults({required this.slug});

  @override
  final String slug;

  @override
  String toString() {
    return 'CarsInDealerEvent.getMoreResults(slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetMoreResults &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetMoreResultsCopyWith<_$_GetMoreResults> get copyWith =>
      __$$_GetMoreResultsCopyWithImpl<_$_GetMoreResults>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String slug) getResults,
    required TResult Function(String slug) getMoreResults,
  }) {
    return getMoreResults(slug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String slug)? getResults,
    TResult? Function(String slug)? getMoreResults,
  }) {
    return getMoreResults?.call(slug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String slug)? getResults,
    TResult Function(String slug)? getMoreResults,
    required TResult orElse(),
  }) {
    if (getMoreResults != null) {
      return getMoreResults(slug);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetMoreResults value) getMoreResults,
  }) {
    return getMoreResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetMoreResults value)? getMoreResults,
  }) {
    return getMoreResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    required TResult orElse(),
  }) {
    if (getMoreResults != null) {
      return getMoreResults(this);
    }
    return orElse();
  }
}

abstract class _GetMoreResults implements CarsInDealerEvent {
  factory _GetMoreResults({required final String slug}) = _$_GetMoreResults;

  @override
  String get slug;
  @override
  @JsonKey(ignore: true)
  _$$_GetMoreResultsCopyWith<_$_GetMoreResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CarsInDealerState {
  List<CarsInDealerEntity> get cars => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  bool? get moreFetch => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CarsInDealerStateCopyWith<CarsInDealerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarsInDealerStateCopyWith<$Res> {
  factory $CarsInDealerStateCopyWith(
          CarsInDealerState value, $Res Function(CarsInDealerState) then) =
      _$CarsInDealerStateCopyWithImpl<$Res, CarsInDealerState>;
  @useResult
  $Res call(
      {List<CarsInDealerEntity> cars,
      String? next,
      bool? moreFetch,
      FormzStatus status});
}

/// @nodoc
class _$CarsInDealerStateCopyWithImpl<$Res, $Val extends CarsInDealerState>
    implements $CarsInDealerStateCopyWith<$Res> {
  _$CarsInDealerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cars = null,
    Object? next = freezed,
    Object? moreFetch = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      cars: null == cars
          ? _value.cars
          : cars // ignore: cast_nullable_to_non_nullable
              as List<CarsInDealerEntity>,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      moreFetch: freezed == moreFetch
          ? _value.moreFetch
          : moreFetch // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CarsInDealerStateCopyWith<$Res>
    implements $CarsInDealerStateCopyWith<$Res> {
  factory _$$_CarsInDealerStateCopyWith(_$_CarsInDealerState value,
          $Res Function(_$_CarsInDealerState) then) =
      __$$_CarsInDealerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CarsInDealerEntity> cars,
      String? next,
      bool? moreFetch,
      FormzStatus status});
}

/// @nodoc
class __$$_CarsInDealerStateCopyWithImpl<$Res>
    extends _$CarsInDealerStateCopyWithImpl<$Res, _$_CarsInDealerState>
    implements _$$_CarsInDealerStateCopyWith<$Res> {
  __$$_CarsInDealerStateCopyWithImpl(
      _$_CarsInDealerState _value, $Res Function(_$_CarsInDealerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cars = null,
    Object? next = freezed,
    Object? moreFetch = freezed,
    Object? status = null,
  }) {
    return _then(_$_CarsInDealerState(
      cars: null == cars
          ? _value._cars
          : cars // ignore: cast_nullable_to_non_nullable
              as List<CarsInDealerEntity>,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      moreFetch: freezed == moreFetch
          ? _value.moreFetch
          : moreFetch // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_CarsInDealerState implements _CarsInDealerState {
  _$_CarsInDealerState(
      {final List<CarsInDealerEntity> cars = const [],
      this.next = '',
      this.moreFetch = false,
      this.status = FormzStatus.pure})
      : _cars = cars;

  final List<CarsInDealerEntity> _cars;
  @override
  @JsonKey()
  List<CarsInDealerEntity> get cars {
    if (_cars is EqualUnmodifiableListView) return _cars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cars);
  }

  @override
  @JsonKey()
  final String? next;
  @override
  @JsonKey()
  final bool? moreFetch;
  @override
  @JsonKey()
  final FormzStatus status;

  @override
  String toString() {
    return 'CarsInDealerState(cars: $cars, next: $next, moreFetch: $moreFetch, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CarsInDealerState &&
            const DeepCollectionEquality().equals(other._cars, _cars) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.moreFetch, moreFetch) ||
                other.moreFetch == moreFetch) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_cars), next, moreFetch, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CarsInDealerStateCopyWith<_$_CarsInDealerState> get copyWith =>
      __$$_CarsInDealerStateCopyWithImpl<_$_CarsInDealerState>(
          this, _$identity);
}

abstract class _CarsInDealerState implements CarsInDealerState {
  factory _CarsInDealerState(
      {final List<CarsInDealerEntity> cars,
      final String? next,
      final bool? moreFetch,
      final FormzStatus status}) = _$_CarsInDealerState;

  @override
  List<CarsInDealerEntity> get cars;
  @override
  String? get next;
  @override
  bool? get moreFetch;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_CarsInDealerStateCopyWith<_$_CarsInDealerState> get copyWith =>
      throw _privateConstructorUsedError;
}
