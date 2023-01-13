// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dealer_single_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DealerSingleEvent {
  String get slug => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String slug) getResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String slug)? getResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String slug)? getResults,
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
  $DealerSingleEventCopyWith<DealerSingleEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DealerSingleEventCopyWith<$Res> {
  factory $DealerSingleEventCopyWith(
          DealerSingleEvent value, $Res Function(DealerSingleEvent) then) =
      _$DealerSingleEventCopyWithImpl<$Res, DealerSingleEvent>;
  @useResult
  $Res call({String slug});
}

/// @nodoc
class _$DealerSingleEventCopyWithImpl<$Res, $Val extends DealerSingleEvent>
    implements $DealerSingleEventCopyWith<$Res> {
  _$DealerSingleEventCopyWithImpl(this._value, this._then);

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
    implements $DealerSingleEventCopyWith<$Res> {
  factory _$$_GetResultsCopyWith(
          _$_GetResults value, $Res Function(_$_GetResults) then) =
      __$$_GetResultsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String slug});
}

/// @nodoc
class __$$_GetResultsCopyWithImpl<$Res>
    extends _$DealerSingleEventCopyWithImpl<$Res, _$_GetResults>
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
    return 'DealerSingleEvent.getResults(slug: $slug)';
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
  }) {
    return getResults(slug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String slug)? getResults,
  }) {
    return getResults?.call(slug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String slug)? getResults,
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

abstract class _GetResults implements DealerSingleEvent {
  factory _GetResults({required final String slug}) = _$_GetResults;

  @override
  String get slug;
  @override
  @JsonKey(ignore: true)
  _$$_GetResultsCopyWith<_$_GetResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DealerSingleState {
  DealerSingleEntity get dealerSingleEntity =>
      throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DealerSingleStateCopyWith<DealerSingleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DealerSingleStateCopyWith<$Res> {
  factory $DealerSingleStateCopyWith(
          DealerSingleState value, $Res Function(DealerSingleState) then) =
      _$DealerSingleStateCopyWithImpl<$Res, DealerSingleState>;
  @useResult
  $Res call({DealerSingleEntity dealerSingleEntity, FormzStatus status});
}

/// @nodoc
class _$DealerSingleStateCopyWithImpl<$Res, $Val extends DealerSingleState>
    implements $DealerSingleStateCopyWith<$Res> {
  _$DealerSingleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dealerSingleEntity = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      dealerSingleEntity: null == dealerSingleEntity
          ? _value.dealerSingleEntity
          : dealerSingleEntity // ignore: cast_nullable_to_non_nullable
              as DealerSingleEntity,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DealerSingleStateCopyWith<$Res>
    implements $DealerSingleStateCopyWith<$Res> {
  factory _$$_DealerSingleStateCopyWith(_$_DealerSingleState value,
          $Res Function(_$_DealerSingleState) then) =
      __$$_DealerSingleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DealerSingleEntity dealerSingleEntity, FormzStatus status});
}

/// @nodoc
class __$$_DealerSingleStateCopyWithImpl<$Res>
    extends _$DealerSingleStateCopyWithImpl<$Res, _$_DealerSingleState>
    implements _$$_DealerSingleStateCopyWith<$Res> {
  __$$_DealerSingleStateCopyWithImpl(
      _$_DealerSingleState _value, $Res Function(_$_DealerSingleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dealerSingleEntity = null,
    Object? status = null,
  }) {
    return _then(_$_DealerSingleState(
      dealerSingleEntity: null == dealerSingleEntity
          ? _value.dealerSingleEntity
          : dealerSingleEntity // ignore: cast_nullable_to_non_nullable
              as DealerSingleEntity,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_DealerSingleState implements _DealerSingleState {
  _$_DealerSingleState(
      {this.dealerSingleEntity = const DealerSingleEntity(),
      this.status = FormzStatus.pure});

  @override
  @JsonKey()
  final DealerSingleEntity dealerSingleEntity;
  @override
  @JsonKey()
  final FormzStatus status;

  @override
  String toString() {
    return 'DealerSingleState(dealerSingleEntity: $dealerSingleEntity, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DealerSingleState &&
            (identical(other.dealerSingleEntity, dealerSingleEntity) ||
                other.dealerSingleEntity == dealerSingleEntity) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dealerSingleEntity, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DealerSingleStateCopyWith<_$_DealerSingleState> get copyWith =>
      __$$_DealerSingleStateCopyWithImpl<_$_DealerSingleState>(
          this, _$identity);
}

abstract class _DealerSingleState implements DealerSingleState {
  factory _DealerSingleState(
      {final DealerSingleEntity dealerSingleEntity,
      final FormzStatus status}) = _$_DealerSingleState;

  @override
  DealerSingleEntity get dealerSingleEntity;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_DealerSingleStateCopyWith<_$_DealerSingleState> get copyWith =>
      throw _privateConstructorUsedError;
}
