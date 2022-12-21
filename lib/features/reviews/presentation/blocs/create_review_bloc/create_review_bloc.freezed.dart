// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_review_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateReviewEvent {
  AutoModel get model => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AutoModel model) createReview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AutoModel model)? createReview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AutoModel model)? createReview,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateReview value) createReview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreateReview value)? createReview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateReview value)? createReview,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateReviewEventCopyWith<CreateReviewEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReviewEventCopyWith<$Res> {
  factory $CreateReviewEventCopyWith(
          CreateReviewEvent value, $Res Function(CreateReviewEvent) then) =
      _$CreateReviewEventCopyWithImpl<$Res>;
  $Res call({AutoModel model});
}

/// @nodoc
class _$CreateReviewEventCopyWithImpl<$Res>
    implements $CreateReviewEventCopyWith<$Res> {
  _$CreateReviewEventCopyWithImpl(this._value, this._then);

  final CreateReviewEvent _value;
  // ignore: unused_field
  final $Res Function(CreateReviewEvent) _then;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_value.copyWith(
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as AutoModel,
    ));
  }
}

/// @nodoc
abstract class _$$_CreateReviewCopyWith<$Res>
    implements $CreateReviewEventCopyWith<$Res> {
  factory _$$_CreateReviewCopyWith(
          _$_CreateReview value, $Res Function(_$_CreateReview) then) =
      __$$_CreateReviewCopyWithImpl<$Res>;
  @override
  $Res call({AutoModel model});
}

/// @nodoc
class __$$_CreateReviewCopyWithImpl<$Res>
    extends _$CreateReviewEventCopyWithImpl<$Res>
    implements _$$_CreateReviewCopyWith<$Res> {
  __$$_CreateReviewCopyWithImpl(
      _$_CreateReview _value, $Res Function(_$_CreateReview) _then)
      : super(_value, (v) => _then(v as _$_CreateReview));

  @override
  _$_CreateReview get _value => super._value as _$_CreateReview;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$_CreateReview(
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as AutoModel,
    ));
  }
}

/// @nodoc

class _$_CreateReview implements _CreateReview {
  _$_CreateReview({required this.model});

  @override
  final AutoModel model;

  @override
  String toString() {
    return 'CreateReviewEvent.createReview(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateReview &&
            const DeepCollectionEquality().equals(other.model, model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(model));

  @JsonKey(ignore: true)
  @override
  _$$_CreateReviewCopyWith<_$_CreateReview> get copyWith =>
      __$$_CreateReviewCopyWithImpl<_$_CreateReview>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AutoModel model) createReview,
  }) {
    return createReview(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AutoModel model)? createReview,
  }) {
    return createReview?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AutoModel model)? createReview,
    required TResult orElse(),
  }) {
    if (createReview != null) {
      return createReview(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateReview value) createReview,
  }) {
    return createReview(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreateReview value)? createReview,
  }) {
    return createReview?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateReview value)? createReview,
    required TResult orElse(),
  }) {
    if (createReview != null) {
      return createReview(this);
    }
    return orElse();
  }
}

abstract class _CreateReview implements CreateReviewEvent {
  factory _CreateReview({required final AutoModel model}) = _$_CreateReview;

  @override
  AutoModel get model;
  @override
  @JsonKey(ignore: true)
  _$$_CreateReviewCopyWith<_$_CreateReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateReviewState {
  FormzStatus get status => throw _privateConstructorUsedError;
  List<AutoModel> get entity => throw _privateConstructorUsedError;
  String get previous => throw _privateConstructorUsedError;
  String get next => throw _privateConstructorUsedError;
  bool get fetchMore => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateReviewStateCopyWith<CreateReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReviewStateCopyWith<$Res> {
  factory $CreateReviewStateCopyWith(
          CreateReviewState value, $Res Function(CreateReviewState) then) =
      _$CreateReviewStateCopyWithImpl<$Res>;
  $Res call(
      {FormzStatus status,
      List<AutoModel> entity,
      String previous,
      String next,
      bool fetchMore,
      int count});
}

/// @nodoc
class _$CreateReviewStateCopyWithImpl<$Res>
    implements $CreateReviewStateCopyWith<$Res> {
  _$CreateReviewStateCopyWithImpl(this._value, this._then);

  final CreateReviewState _value;
  // ignore: unused_field
  final $Res Function(CreateReviewState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? entity = freezed,
    Object? previous = freezed,
    Object? next = freezed,
    Object? fetchMore = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as List<AutoModel>,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
      fetchMore: fetchMore == freezed
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_CreateReviewStateCopyWith<$Res>
    implements $CreateReviewStateCopyWith<$Res> {
  factory _$$_CreateReviewStateCopyWith(_$_CreateReviewState value,
          $Res Function(_$_CreateReviewState) then) =
      __$$_CreateReviewStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {FormzStatus status,
      List<AutoModel> entity,
      String previous,
      String next,
      bool fetchMore,
      int count});
}

/// @nodoc
class __$$_CreateReviewStateCopyWithImpl<$Res>
    extends _$CreateReviewStateCopyWithImpl<$Res>
    implements _$$_CreateReviewStateCopyWith<$Res> {
  __$$_CreateReviewStateCopyWithImpl(
      _$_CreateReviewState _value, $Res Function(_$_CreateReviewState) _then)
      : super(_value, (v) => _then(v as _$_CreateReviewState));

  @override
  _$_CreateReviewState get _value => super._value as _$_CreateReviewState;

  @override
  $Res call({
    Object? status = freezed,
    Object? entity = freezed,
    Object? previous = freezed,
    Object? next = freezed,
    Object? fetchMore = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_CreateReviewState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      entity: entity == freezed
          ? _value._entity
          : entity // ignore: cast_nullable_to_non_nullable
              as List<AutoModel>,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
      fetchMore: fetchMore == freezed
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CreateReviewState implements _CreateReviewState {
  _$_CreateReviewState(
      {this.status = FormzStatus.pure,
      final List<AutoModel> entity = const [],
      this.previous = '',
      this.next = '',
      this.fetchMore = false,
      this.count = 0})
      : _entity = entity;

  @override
  @JsonKey()
  final FormzStatus status;
  final List<AutoModel> _entity;
  @override
  @JsonKey()
  List<AutoModel> get entity {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entity);
  }

  @override
  @JsonKey()
  final String previous;
  @override
  @JsonKey()
  final String next;
  @override
  @JsonKey()
  final bool fetchMore;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'CreateReviewState(status: $status, entity: $entity, previous: $previous, next: $next, fetchMore: $fetchMore, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateReviewState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._entity, _entity) &&
            const DeepCollectionEquality().equals(other.previous, previous) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.fetchMore, fetchMore) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_entity),
      const DeepCollectionEquality().hash(previous),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(fetchMore),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$$_CreateReviewStateCopyWith<_$_CreateReviewState> get copyWith =>
      __$$_CreateReviewStateCopyWithImpl<_$_CreateReviewState>(
          this, _$identity);
}

abstract class _CreateReviewState implements CreateReviewState {
  factory _CreateReviewState(
      {final FormzStatus status,
      final List<AutoModel> entity,
      final String previous,
      final String next,
      final bool fetchMore,
      final int count}) = _$_CreateReviewState;

  @override
  FormzStatus get status;
  @override
  List<AutoModel> get entity;
  @override
  String get previous;
  @override
  String get next;
  @override
  bool get fetchMore;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_CreateReviewStateCopyWith<_$_CreateReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}
