// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comparison_add_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ComparisonAddEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) postComparisonCars,
    required TResult Function(int id) deleteComparison,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? postComparisonCars,
    TResult? Function(int id)? deleteComparison,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? postComparisonCars,
    TResult Function(int id)? deleteComparison,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PostComparisonCars value) postComparisonCars,
    required TResult Function(_DeleteComparison value) deleteComparison,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostComparisonCars value)? postComparisonCars,
    TResult? Function(_DeleteComparison value)? deleteComparison,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostComparisonCars value)? postComparisonCars,
    TResult Function(_DeleteComparison value)? deleteComparison,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComparisonAddEventCopyWith<ComparisonAddEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComparisonAddEventCopyWith<$Res> {
  factory $ComparisonAddEventCopyWith(
          ComparisonAddEvent value, $Res Function(ComparisonAddEvent) then) =
      _$ComparisonAddEventCopyWithImpl<$Res, ComparisonAddEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$ComparisonAddEventCopyWithImpl<$Res, $Val extends ComparisonAddEvent>
    implements $ComparisonAddEventCopyWith<$Res> {
  _$ComparisonAddEventCopyWithImpl(this._value, this._then);

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
abstract class _$$_PostComparisonCarsCopyWith<$Res>
    implements $ComparisonAddEventCopyWith<$Res> {
  factory _$$_PostComparisonCarsCopyWith(_$_PostComparisonCars value,
          $Res Function(_$_PostComparisonCars) then) =
      __$$_PostComparisonCarsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_PostComparisonCarsCopyWithImpl<$Res>
    extends _$ComparisonAddEventCopyWithImpl<$Res, _$_PostComparisonCars>
    implements _$$_PostComparisonCarsCopyWith<$Res> {
  __$$_PostComparisonCarsCopyWithImpl(
      _$_PostComparisonCars _value, $Res Function(_$_PostComparisonCars) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_PostComparisonCars(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PostComparisonCars implements _PostComparisonCars {
  _$_PostComparisonCars(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'ComparisonAddEvent.postComparisonCars(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostComparisonCars &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostComparisonCarsCopyWith<_$_PostComparisonCars> get copyWith =>
      __$$_PostComparisonCarsCopyWithImpl<_$_PostComparisonCars>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) postComparisonCars,
    required TResult Function(int id) deleteComparison,
  }) {
    return postComparisonCars(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? postComparisonCars,
    TResult? Function(int id)? deleteComparison,
  }) {
    return postComparisonCars?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? postComparisonCars,
    TResult Function(int id)? deleteComparison,
    required TResult orElse(),
  }) {
    if (postComparisonCars != null) {
      return postComparisonCars(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PostComparisonCars value) postComparisonCars,
    required TResult Function(_DeleteComparison value) deleteComparison,
  }) {
    return postComparisonCars(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostComparisonCars value)? postComparisonCars,
    TResult? Function(_DeleteComparison value)? deleteComparison,
  }) {
    return postComparisonCars?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostComparisonCars value)? postComparisonCars,
    TResult Function(_DeleteComparison value)? deleteComparison,
    required TResult orElse(),
  }) {
    if (postComparisonCars != null) {
      return postComparisonCars(this);
    }
    return orElse();
  }
}

abstract class _PostComparisonCars implements ComparisonAddEvent {
  factory _PostComparisonCars(final int id) = _$_PostComparisonCars;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_PostComparisonCarsCopyWith<_$_PostComparisonCars> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteComparisonCopyWith<$Res>
    implements $ComparisonAddEventCopyWith<$Res> {
  factory _$$_DeleteComparisonCopyWith(
          _$_DeleteComparison value, $Res Function(_$_DeleteComparison) then) =
      __$$_DeleteComparisonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_DeleteComparisonCopyWithImpl<$Res>
    extends _$ComparisonAddEventCopyWithImpl<$Res, _$_DeleteComparison>
    implements _$$_DeleteComparisonCopyWith<$Res> {
  __$$_DeleteComparisonCopyWithImpl(
      _$_DeleteComparison _value, $Res Function(_$_DeleteComparison) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_DeleteComparison(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DeleteComparison implements _DeleteComparison {
  _$_DeleteComparison(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'ComparisonAddEvent.deleteComparison(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteComparison &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteComparisonCopyWith<_$_DeleteComparison> get copyWith =>
      __$$_DeleteComparisonCopyWithImpl<_$_DeleteComparison>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) postComparisonCars,
    required TResult Function(int id) deleteComparison,
  }) {
    return deleteComparison(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? postComparisonCars,
    TResult? Function(int id)? deleteComparison,
  }) {
    return deleteComparison?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? postComparisonCars,
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
    required TResult Function(_PostComparisonCars value) postComparisonCars,
    required TResult Function(_DeleteComparison value) deleteComparison,
  }) {
    return deleteComparison(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostComparisonCars value)? postComparisonCars,
    TResult? Function(_DeleteComparison value)? deleteComparison,
  }) {
    return deleteComparison?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostComparisonCars value)? postComparisonCars,
    TResult Function(_DeleteComparison value)? deleteComparison,
    required TResult orElse(),
  }) {
    if (deleteComparison != null) {
      return deleteComparison(this);
    }
    return orElse();
  }
}

abstract class _DeleteComparison implements ComparisonAddEvent {
  factory _DeleteComparison(final int id) = _$_DeleteComparison;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteComparisonCopyWith<_$_DeleteComparison> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ComparisonAddState {
  FormzStatus get addStatus => throw _privateConstructorUsedError;
  FormzStatus get removeStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComparisonAddStateCopyWith<ComparisonAddState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComparisonAddStateCopyWith<$Res> {
  factory $ComparisonAddStateCopyWith(
          ComparisonAddState value, $Res Function(ComparisonAddState) then) =
      _$ComparisonAddStateCopyWithImpl<$Res, ComparisonAddState>;
  @useResult
  $Res call({FormzStatus addStatus, FormzStatus removeStatus});
}

/// @nodoc
class _$ComparisonAddStateCopyWithImpl<$Res, $Val extends ComparisonAddState>
    implements $ComparisonAddStateCopyWith<$Res> {
  _$ComparisonAddStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addStatus = null,
    Object? removeStatus = null,
  }) {
    return _then(_value.copyWith(
      addStatus: null == addStatus
          ? _value.addStatus
          : addStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      removeStatus: null == removeStatus
          ? _value.removeStatus
          : removeStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ComparisonAddStateCopyWith<$Res>
    implements $ComparisonAddStateCopyWith<$Res> {
  factory _$$_ComparisonAddStateCopyWith(_$_ComparisonAddState value,
          $Res Function(_$_ComparisonAddState) then) =
      __$$_ComparisonAddStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormzStatus addStatus, FormzStatus removeStatus});
}

/// @nodoc
class __$$_ComparisonAddStateCopyWithImpl<$Res>
    extends _$ComparisonAddStateCopyWithImpl<$Res, _$_ComparisonAddState>
    implements _$$_ComparisonAddStateCopyWith<$Res> {
  __$$_ComparisonAddStateCopyWithImpl(
      _$_ComparisonAddState _value, $Res Function(_$_ComparisonAddState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addStatus = null,
    Object? removeStatus = null,
  }) {
    return _then(_$_ComparisonAddState(
      addStatus: null == addStatus
          ? _value.addStatus
          : addStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      removeStatus: null == removeStatus
          ? _value.removeStatus
          : removeStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_ComparisonAddState implements _ComparisonAddState {
  _$_ComparisonAddState(
      {this.addStatus = FormzStatus.pure,
      this.removeStatus = FormzStatus.pure});

  @override
  @JsonKey()
  final FormzStatus addStatus;
  @override
  @JsonKey()
  final FormzStatus removeStatus;

  @override
  String toString() {
    return 'ComparisonAddState(addStatus: $addStatus, removeStatus: $removeStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ComparisonAddState &&
            (identical(other.addStatus, addStatus) ||
                other.addStatus == addStatus) &&
            (identical(other.removeStatus, removeStatus) ||
                other.removeStatus == removeStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addStatus, removeStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ComparisonAddStateCopyWith<_$_ComparisonAddState> get copyWith =>
      __$$_ComparisonAddStateCopyWithImpl<_$_ComparisonAddState>(
          this, _$identity);
}

abstract class _ComparisonAddState implements ComparisonAddState {
  factory _ComparisonAddState(
      {final FormzStatus addStatus,
      final FormzStatus removeStatus}) = _$_ComparisonAddState;

  @override
  FormzStatus get addStatus;
  @override
  FormzStatus get removeStatus;
  @override
  @JsonKey(ignore: true)
  _$$_ComparisonAddStateCopyWith<_$_ComparisonAddState> get copyWith =>
      throw _privateConstructorUsedError;
}
