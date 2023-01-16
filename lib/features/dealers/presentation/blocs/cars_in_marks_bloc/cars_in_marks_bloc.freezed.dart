// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cars_in_marks_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CarsInMarksEvent {
  CarMarkParams get params => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CarMarkParams params) getResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CarMarkParams params)? getResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CarMarkParams params)? getResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CarsInMarksEventCopyWith<CarsInMarksEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarsInMarksEventCopyWith<$Res> {
  factory $CarsInMarksEventCopyWith(
          CarsInMarksEvent value, $Res Function(CarsInMarksEvent) then) =
      _$CarsInMarksEventCopyWithImpl<$Res, CarsInMarksEvent>;
  @useResult
  $Res call({CarMarkParams params});
}

/// @nodoc
class _$CarsInMarksEventCopyWithImpl<$Res, $Val extends CarsInMarksEvent>
    implements $CarsInMarksEventCopyWith<$Res> {
  _$CarsInMarksEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
  }) {
    return _then(_value.copyWith(
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as CarMarkParams,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetResultsCopyWith<$Res>
    implements $CarsInMarksEventCopyWith<$Res> {
  factory _$$_GetResultsCopyWith(
          _$_GetResults value, $Res Function(_$_GetResults) then) =
      __$$_GetResultsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CarMarkParams params});
}

/// @nodoc
class __$$_GetResultsCopyWithImpl<$Res>
    extends _$CarsInMarksEventCopyWithImpl<$Res, _$_GetResults>
    implements _$$_GetResultsCopyWith<$Res> {
  __$$_GetResultsCopyWithImpl(
      _$_GetResults _value, $Res Function(_$_GetResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
  }) {
    return _then(_$_GetResults(
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as CarMarkParams,
    ));
  }
}

/// @nodoc

class _$_GetResults implements _GetResults {
  _$_GetResults({required this.params});

  @override
  final CarMarkParams params;

  @override
  String toString() {
    return 'CarsInMarksEvent.getResults(params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetResults &&
            (identical(other.params, params) || other.params == params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, params);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetResultsCopyWith<_$_GetResults> get copyWith =>
      __$$_GetResultsCopyWithImpl<_$_GetResults>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CarMarkParams params) getResults,
  }) {
    return getResults(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CarMarkParams params)? getResults,
  }) {
    return getResults?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CarMarkParams params)? getResults,
    required TResult orElse(),
  }) {
    if (getResults != null) {
      return getResults(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
  }) {
    return getResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
  }) {
    return getResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    required TResult orElse(),
  }) {
    if (getResults != null) {
      return getResults(this);
    }
    return orElse();
  }
}

abstract class _GetResults implements CarsInMarksEvent {
  factory _GetResults({required final CarMarkParams params}) = _$_GetResults;

  @override
  CarMarkParams get params;
  @override
  @JsonKey(ignore: true)
  _$$_GetResultsCopyWith<_$_GetResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CarsInMarksState {
  List<CarsInMarksEntity> get cars => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CarsInMarksStateCopyWith<CarsInMarksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarsInMarksStateCopyWith<$Res> {
  factory $CarsInMarksStateCopyWith(
          CarsInMarksState value, $Res Function(CarsInMarksState) then) =
      _$CarsInMarksStateCopyWithImpl<$Res, CarsInMarksState>;
  @useResult
  $Res call({List<CarsInMarksEntity> cars, FormzStatus status});
}

/// @nodoc
class _$CarsInMarksStateCopyWithImpl<$Res, $Val extends CarsInMarksState>
    implements $CarsInMarksStateCopyWith<$Res> {
  _$CarsInMarksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cars = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      cars: null == cars
          ? _value.cars
          : cars // ignore: cast_nullable_to_non_nullable
              as List<CarsInMarksEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CarsInMarksStateCopyWith<$Res>
    implements $CarsInMarksStateCopyWith<$Res> {
  factory _$$_CarsInMarksStateCopyWith(
          _$_CarsInMarksState value, $Res Function(_$_CarsInMarksState) then) =
      __$$_CarsInMarksStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CarsInMarksEntity> cars, FormzStatus status});
}

/// @nodoc
class __$$_CarsInMarksStateCopyWithImpl<$Res>
    extends _$CarsInMarksStateCopyWithImpl<$Res, _$_CarsInMarksState>
    implements _$$_CarsInMarksStateCopyWith<$Res> {
  __$$_CarsInMarksStateCopyWithImpl(
      _$_CarsInMarksState _value, $Res Function(_$_CarsInMarksState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cars = null,
    Object? status = null,
  }) {
    return _then(_$_CarsInMarksState(
      cars: null == cars
          ? _value._cars
          : cars // ignore: cast_nullable_to_non_nullable
              as List<CarsInMarksEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_CarsInMarksState implements _CarsInMarksState {
  _$_CarsInMarksState(
      {final List<CarsInMarksEntity> cars = const [],
      this.status = FormzStatus.pure})
      : _cars = cars;

  final List<CarsInMarksEntity> _cars;
  @override
  @JsonKey()
  List<CarsInMarksEntity> get cars {
    if (_cars is EqualUnmodifiableListView) return _cars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cars);
  }

  @override
  @JsonKey()
  final FormzStatus status;

  @override
  String toString() {
    return 'CarsInMarksState(cars: $cars, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CarsInMarksState &&
            const DeepCollectionEquality().equals(other._cars, _cars) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_cars), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CarsInMarksStateCopyWith<_$_CarsInMarksState> get copyWith =>
      __$$_CarsInMarksStateCopyWithImpl<_$_CarsInMarksState>(this, _$identity);
}

abstract class _CarsInMarksState implements CarsInMarksState {
  factory _CarsInMarksState(
      {final List<CarsInMarksEntity> cars,
      final FormzStatus status}) = _$_CarsInMarksState;

  @override
  List<CarsInMarksEntity> get cars;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_CarsInMarksStateCopyWith<_$_CarsInMarksState> get copyWith =>
      throw _privateConstructorUsedError;
}
