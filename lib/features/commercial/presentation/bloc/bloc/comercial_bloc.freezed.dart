// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comercial_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ComercialEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComercialEventCopyWith<$Res> {
  factory $ComercialEventCopyWith(
          ComercialEvent value, $Res Function(ComercialEvent) then) =
      _$ComercialEventCopyWithImpl<$Res, ComercialEvent>;
}

/// @nodoc
class _$ComercialEventCopyWithImpl<$Res, $Val extends ComercialEvent>
    implements $ComercialEventCopyWith<$Res> {
  _$ComercialEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$ComercialEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  _$_Started();

  @override
  String toString() {
    return 'ComercialEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ComercialEvent {
  factory _Started() = _$_Started;
}

/// @nodoc
mixin _$ComercialState {
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComercialStateCopyWith<ComercialState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComercialStateCopyWith<$Res> {
  factory $ComercialStateCopyWith(
          ComercialState value, $Res Function(ComercialState) then) =
      _$ComercialStateCopyWithImpl<$Res, ComercialState>;
  @useResult
  $Res call({FormzStatus status});
}

/// @nodoc
class _$ComercialStateCopyWithImpl<$Res, $Val extends ComercialState>
    implements $ComercialStateCopyWith<$Res> {
  _$ComercialStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ComercialStateCopyWith<$Res>
    implements $ComercialStateCopyWith<$Res> {
  factory _$$_ComercialStateCopyWith(
          _$_ComercialState value, $Res Function(_$_ComercialState) then) =
      __$$_ComercialStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormzStatus status});
}

/// @nodoc
class __$$_ComercialStateCopyWithImpl<$Res>
    extends _$ComercialStateCopyWithImpl<$Res, _$_ComercialState>
    implements _$$_ComercialStateCopyWith<$Res> {
  __$$_ComercialStateCopyWithImpl(
      _$_ComercialState _value, $Res Function(_$_ComercialState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$_ComercialState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_ComercialState implements _ComercialState {
  _$_ComercialState({this.status = FormzStatus.pure});

  @override
  @JsonKey()
  final FormzStatus status;

  @override
  String toString() {
    return 'ComercialState(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ComercialState &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ComercialStateCopyWith<_$_ComercialState> get copyWith =>
      __$$_ComercialStateCopyWithImpl<_$_ComercialState>(this, _$identity);
}

abstract class _ComercialState implements ComercialState {
  factory _ComercialState({final FormzStatus status}) = _$_ComercialState;

  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_ComercialStateCopyWith<_$_ComercialState> get copyWith =>
      throw _privateConstructorUsedError;
}
