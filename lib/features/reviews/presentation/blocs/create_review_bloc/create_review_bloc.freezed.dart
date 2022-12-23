// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_review_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateReviewEvent {
  AutoReviewModel get model => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AutoReviewModel model) createReview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AutoReviewModel model)? createReview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AutoReviewModel model)? createReview,
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
    TResult? Function(_CreateReview value)? createReview,
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
      _$CreateReviewEventCopyWithImpl<$Res, CreateReviewEvent>;
  @useResult
  $Res call({AutoReviewModel model});
}

/// @nodoc
class _$CreateReviewEventCopyWithImpl<$Res, $Val extends CreateReviewEvent>
    implements $CreateReviewEventCopyWith<$Res> {
  _$CreateReviewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as AutoReviewModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateReviewCopyWith<$Res>
    implements $CreateReviewEventCopyWith<$Res> {
  factory _$$_CreateReviewCopyWith(
          _$_CreateReview value, $Res Function(_$_CreateReview) then) =
      __$$_CreateReviewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AutoReviewModel model});
}

/// @nodoc
class __$$_CreateReviewCopyWithImpl<$Res>
    extends _$CreateReviewEventCopyWithImpl<$Res, _$_CreateReview>
    implements _$$_CreateReviewCopyWith<$Res> {
  __$$_CreateReviewCopyWithImpl(
      _$_CreateReview _value, $Res Function(_$_CreateReview) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$_CreateReview(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as AutoReviewModel,
    ));
  }
}

/// @nodoc

class _$_CreateReview implements _CreateReview {
  _$_CreateReview({required this.model});

  @override
  final AutoReviewModel model;

  @override
  String toString() {
    return 'CreateReviewEvent.createReview(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateReview &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateReviewCopyWith<_$_CreateReview> get copyWith =>
      __$$_CreateReviewCopyWithImpl<_$_CreateReview>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AutoReviewModel model) createReview,
  }) {
    return createReview(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AutoReviewModel model)? createReview,
  }) {
    return createReview?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AutoReviewModel model)? createReview,
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
    TResult? Function(_CreateReview value)? createReview,
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
  factory _CreateReview({required final AutoReviewModel model}) =
      _$_CreateReview;

  @override
  AutoReviewModel get model;
  @override
  @JsonKey(ignore: true)
  _$$_CreateReviewCopyWith<_$_CreateReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateReviewState {
  FormzStatus get status => throw _privateConstructorUsedError;
  List<AutoReviewModel> get entity => throw _privateConstructorUsedError;
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
      _$CreateReviewStateCopyWithImpl<$Res, CreateReviewState>;
  @useResult
  $Res call(
      {FormzStatus status,
      List<AutoReviewModel> entity,
      String previous,
      String next,
      bool fetchMore,
      int count});
}

/// @nodoc
class _$CreateReviewStateCopyWithImpl<$Res, $Val extends CreateReviewState>
    implements $CreateReviewStateCopyWith<$Res> {
  _$CreateReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? entity = null,
    Object? previous = null,
    Object? next = null,
    Object? fetchMore = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      entity: null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as List<AutoReviewModel>,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
      fetchMore: null == fetchMore
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateReviewStateCopyWith<$Res>
    implements $CreateReviewStateCopyWith<$Res> {
  factory _$$_CreateReviewStateCopyWith(_$_CreateReviewState value,
          $Res Function(_$_CreateReviewState) then) =
      __$$_CreateReviewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus status,
      List<AutoReviewModel> entity,
      String previous,
      String next,
      bool fetchMore,
      int count});
}

/// @nodoc
class __$$_CreateReviewStateCopyWithImpl<$Res>
    extends _$CreateReviewStateCopyWithImpl<$Res, _$_CreateReviewState>
    implements _$$_CreateReviewStateCopyWith<$Res> {
  __$$_CreateReviewStateCopyWithImpl(
      _$_CreateReviewState _value, $Res Function(_$_CreateReviewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? entity = null,
    Object? previous = null,
    Object? next = null,
    Object? fetchMore = null,
    Object? count = null,
  }) {
    return _then(_$_CreateReviewState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      entity: null == entity
          ? _value._entity
          : entity // ignore: cast_nullable_to_non_nullable
              as List<AutoReviewModel>,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
      fetchMore: null == fetchMore
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      count: null == count
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
      final List<AutoReviewModel> entity = const [],
      this.previous = '',
      this.next = '',
      this.fetchMore = false,
      this.count = 0})
      : _entity = entity;

  @override
  @JsonKey()
  final FormzStatus status;
  final List<AutoReviewModel> _entity;
  @override
  @JsonKey()
  List<AutoReviewModel> get entity {
    if (_entity is EqualUnmodifiableListView) return _entity;
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
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._entity, _entity) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.fetchMore, fetchMore) ||
                other.fetchMore == fetchMore) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_entity),
      previous,
      next,
      fetchMore,
      count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateReviewStateCopyWith<_$_CreateReviewState> get copyWith =>
      __$$_CreateReviewStateCopyWithImpl<_$_CreateReviewState>(
          this, _$identity);
}

abstract class _CreateReviewState implements CreateReviewState {
  factory _CreateReviewState(
      {final FormzStatus status,
      final List<AutoReviewModel> entity,
      final String previous,
      final String next,
      final bool fetchMore,
      final int count}) = _$_CreateReviewState;

  @override
  FormzStatus get status;
  @override
  List<AutoReviewModel> get entity;
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
