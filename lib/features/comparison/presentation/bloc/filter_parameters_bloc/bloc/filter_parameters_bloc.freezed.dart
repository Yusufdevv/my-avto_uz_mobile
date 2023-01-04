// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_parameters_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterParametersEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getIdVal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getIdVal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getIdVal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetIdVal value) getIdVal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetIdVal value)? getIdVal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetIdVal value)? getIdVal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterParametersEventCopyWith<FilterParametersEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterParametersEventCopyWith<$Res> {
  factory $FilterParametersEventCopyWith(FilterParametersEvent value,
          $Res Function(FilterParametersEvent) then) =
      _$FilterParametersEventCopyWithImpl<$Res, FilterParametersEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$FilterParametersEventCopyWithImpl<$Res,
        $Val extends FilterParametersEvent>
    implements $FilterParametersEventCopyWith<$Res> {
  _$FilterParametersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetIdValCopyWith<$Res>
    implements $FilterParametersEventCopyWith<$Res> {
  factory _$$_GetIdValCopyWith(
          _$_GetIdVal value, $Res Function(_$_GetIdVal) then) =
      __$$_GetIdValCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_GetIdValCopyWithImpl<$Res>
    extends _$FilterParametersEventCopyWithImpl<$Res, _$_GetIdVal>
    implements _$$_GetIdValCopyWith<$Res> {
  __$$_GetIdValCopyWithImpl(
      _$_GetIdVal _value, $Res Function(_$_GetIdVal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_GetIdVal(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetIdVal implements _GetIdVal {
  _$_GetIdVal(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'FilterParametersEvent.getIdVal(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetIdVal &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetIdValCopyWith<_$_GetIdVal> get copyWith =>
      __$$_GetIdValCopyWithImpl<_$_GetIdVal>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getIdVal,
  }) {
    return getIdVal(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getIdVal,
  }) {
    return getIdVal?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getIdVal,
    required TResult orElse(),
  }) {
    if (getIdVal != null) {
      return getIdVal(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetIdVal value) getIdVal,
  }) {
    return getIdVal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetIdVal value)? getIdVal,
  }) {
    return getIdVal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetIdVal value)? getIdVal,
    required TResult orElse(),
  }) {
    if (getIdVal != null) {
      return getIdVal(this);
    }
    return orElse();
  }
}

abstract class _GetIdVal implements FilterParametersEvent {
  factory _GetIdVal(final int id) = _$_GetIdVal;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_GetIdValCopyWith<_$_GetIdVal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FilterParametersState {
  int get idVal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterParametersStateCopyWith<FilterParametersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterParametersStateCopyWith<$Res> {
  factory $FilterParametersStateCopyWith(FilterParametersState value,
          $Res Function(FilterParametersState) then) =
      _$FilterParametersStateCopyWithImpl<$Res, FilterParametersState>;
  @useResult
  $Res call({int idVal});
}

/// @nodoc
class _$FilterParametersStateCopyWithImpl<$Res,
        $Val extends FilterParametersState>
    implements $FilterParametersStateCopyWith<$Res> {
  _$FilterParametersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idVal = null,
  }) {
    return _then(_value.copyWith(
      idVal: null == idVal
          ? _value.idVal
          : idVal // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterParametersStateCopyWith<$Res>
    implements $FilterParametersStateCopyWith<$Res> {
  factory _$$_FilterParametersStateCopyWith(_$_FilterParametersState value,
          $Res Function(_$_FilterParametersState) then) =
      __$$_FilterParametersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int idVal});
}

/// @nodoc
class __$$_FilterParametersStateCopyWithImpl<$Res>
    extends _$FilterParametersStateCopyWithImpl<$Res, _$_FilterParametersState>
    implements _$$_FilterParametersStateCopyWith<$Res> {
  __$$_FilterParametersStateCopyWithImpl(_$_FilterParametersState _value,
      $Res Function(_$_FilterParametersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idVal = null,
  }) {
    return _then(_$_FilterParametersState(
      idVal: null == idVal
          ? _value.idVal
          : idVal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FilterParametersState implements _FilterParametersState {
  const _$_FilterParametersState({this.idVal = 0});

  @override
  @JsonKey()
  final int idVal;

  @override
  String toString() {
    return 'FilterParametersState(idVal: $idVal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterParametersState &&
            (identical(other.idVal, idVal) || other.idVal == idVal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idVal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterParametersStateCopyWith<_$_FilterParametersState> get copyWith =>
      __$$_FilterParametersStateCopyWithImpl<_$_FilterParametersState>(
          this, _$identity);
}

abstract class _FilterParametersState implements FilterParametersState {
  const factory _FilterParametersState({final int idVal}) =
      _$_FilterParametersState;

  @override
  int get idVal;
  @override
  @JsonKey(ignore: true)
  _$$_FilterParametersStateCopyWith<_$_FilterParametersState> get copyWith =>
      throw _privateConstructorUsedError;
}
