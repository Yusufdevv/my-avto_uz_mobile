// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_comparison_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeleteComparisonEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) deleteComparison,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? deleteComparison,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? deleteComparison,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeleteComparisonE value) deleteComparison,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeleteComparisonE value)? deleteComparison,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeleteComparisonE value)? deleteComparison,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeleteComparisonEventCopyWith<DeleteComparisonEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteComparisonEventCopyWith<$Res> {
  factory $DeleteComparisonEventCopyWith(DeleteComparisonEvent value,
          $Res Function(DeleteComparisonEvent) then) =
      _$DeleteComparisonEventCopyWithImpl<$Res, DeleteComparisonEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DeleteComparisonEventCopyWithImpl<$Res,
        $Val extends DeleteComparisonEvent>
    implements $DeleteComparisonEventCopyWith<$Res> {
  _$DeleteComparisonEventCopyWithImpl(this._value, this._then);

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
abstract class _$$_DeleteComparisonECopyWith<$Res>
    implements $DeleteComparisonEventCopyWith<$Res> {
  factory _$$_DeleteComparisonECopyWith(_$_DeleteComparisonE value,
          $Res Function(_$_DeleteComparisonE) then) =
      __$$_DeleteComparisonECopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_DeleteComparisonECopyWithImpl<$Res>
    extends _$DeleteComparisonEventCopyWithImpl<$Res, _$_DeleteComparisonE>
    implements _$$_DeleteComparisonECopyWith<$Res> {
  __$$_DeleteComparisonECopyWithImpl(
      _$_DeleteComparisonE _value, $Res Function(_$_DeleteComparisonE) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_DeleteComparisonE(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DeleteComparisonE implements _DeleteComparisonE {
  _$_DeleteComparisonE(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'DeleteComparisonEvent.deleteComparison(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteComparisonE &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteComparisonECopyWith<_$_DeleteComparisonE> get copyWith =>
      __$$_DeleteComparisonECopyWithImpl<_$_DeleteComparisonE>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) deleteComparison,
  }) {
    return deleteComparison(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? deleteComparison,
  }) {
    return deleteComparison?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? deleteComparison,
    required TResult orElse(),
  }) {
    if (deleteComparison != null) {
      return deleteComparison(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeleteComparisonE value) deleteComparison,
  }) {
    return deleteComparison(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeleteComparisonE value)? deleteComparison,
  }) {
    return deleteComparison?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeleteComparisonE value)? deleteComparison,
    required TResult orElse(),
  }) {
    if (deleteComparison != null) {
      return deleteComparison(this);
    }
    return orElse();
  }
}

abstract class _DeleteComparisonE implements DeleteComparisonEvent {
  factory _DeleteComparisonE(final int id) = _$_DeleteComparisonE;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteComparisonECopyWith<_$_DeleteComparisonE> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeleteComparisonState {
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeleteComparisonStateCopyWith<DeleteComparisonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteComparisonStateCopyWith<$Res> {
  factory $DeleteComparisonStateCopyWith(DeleteComparisonState value,
          $Res Function(DeleteComparisonState) then) =
      _$DeleteComparisonStateCopyWithImpl<$Res, DeleteComparisonState>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DeleteComparisonStateCopyWithImpl<$Res,
        $Val extends DeleteComparisonState>
    implements $DeleteComparisonStateCopyWith<$Res> {
  _$DeleteComparisonStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_DeleteComparsionCopyWith<$Res>
    implements $DeleteComparisonStateCopyWith<$Res> {
  factory _$$_DeleteComparsionCopyWith(
          _$_DeleteComparsion value, $Res Function(_$_DeleteComparsion) then) =
      __$$_DeleteComparsionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_DeleteComparsionCopyWithImpl<$Res>
    extends _$DeleteComparisonStateCopyWithImpl<$Res, _$_DeleteComparsion>
    implements _$$_DeleteComparsionCopyWith<$Res> {
  __$$_DeleteComparsionCopyWithImpl(
      _$_DeleteComparsion _value, $Res Function(_$_DeleteComparsion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_DeleteComparsion(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DeleteComparsion implements _DeleteComparsion {
  const _$_DeleteComparsion({this.id = 0});

  @override
  @JsonKey()
  final int id;

  @override
  String toString() {
    return 'DeleteComparisonState(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteComparsion &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteComparsionCopyWith<_$_DeleteComparsion> get copyWith =>
      __$$_DeleteComparsionCopyWithImpl<_$_DeleteComparsion>(this, _$identity);
}

abstract class _DeleteComparsion implements DeleteComparisonState {
  const factory _DeleteComparsion({final int id}) = _$_DeleteComparsion;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteComparsionCopyWith<_$_DeleteComparsion> get copyWith =>
      throw _privateConstructorUsedError;
}
