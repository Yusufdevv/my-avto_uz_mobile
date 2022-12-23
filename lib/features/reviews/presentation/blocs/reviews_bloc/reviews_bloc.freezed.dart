// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reviews_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReviewsEvent {
  ReviewsModel get model => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReviewsModel model) getReviews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReviewsModel model)? getReviews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReviewsModel model)? getReviews,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetReviews value) getReviews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetReviews value)? getReviews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetReviews value)? getReviews,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewsEventCopyWith<ReviewsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewsEventCopyWith<$Res> {
  factory $ReviewsEventCopyWith(
          ReviewsEvent value, $Res Function(ReviewsEvent) then) =
      _$ReviewsEventCopyWithImpl<$Res, ReviewsEvent>;
  @useResult
  $Res call({ReviewsModel model});
}

/// @nodoc
class _$ReviewsEventCopyWithImpl<$Res, $Val extends ReviewsEvent>
    implements $ReviewsEventCopyWith<$Res> {
  _$ReviewsEventCopyWithImpl(this._value, this._then);

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
              as ReviewsModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetReviewsCopyWith<$Res>
    implements $ReviewsEventCopyWith<$Res> {
  factory _$$_GetReviewsCopyWith(
          _$_GetReviews value, $Res Function(_$_GetReviews) then) =
      __$$_GetReviewsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ReviewsModel model});
}

/// @nodoc
class __$$_GetReviewsCopyWithImpl<$Res>
    extends _$ReviewsEventCopyWithImpl<$Res, _$_GetReviews>
    implements _$$_GetReviewsCopyWith<$Res> {
  __$$_GetReviewsCopyWithImpl(
      _$_GetReviews _value, $Res Function(_$_GetReviews) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$_GetReviews(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ReviewsModel,
    ));
  }
}

/// @nodoc

class _$_GetReviews implements _GetReviews {
  _$_GetReviews(this.model);

  @override
  final ReviewsModel model;

  @override
  String toString() {
    return 'ReviewsEvent.getReviews(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetReviews &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetReviewsCopyWith<_$_GetReviews> get copyWith =>
      __$$_GetReviewsCopyWithImpl<_$_GetReviews>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReviewsModel model) getReviews,
  }) {
    return getReviews(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReviewsModel model)? getReviews,
  }) {
    return getReviews?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReviewsModel model)? getReviews,
    required TResult orElse(),
  }) {
    if (getReviews != null) {
      return getReviews(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetReviews value) getReviews,
  }) {
    return getReviews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetReviews value)? getReviews,
  }) {
    return getReviews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetReviews value)? getReviews,
    required TResult orElse(),
  }) {
    if (getReviews != null) {
      return getReviews(this);
    }
    return orElse();
  }
}

abstract class _GetReviews implements ReviewsEvent {
  factory _GetReviews(final ReviewsModel model) = _$_GetReviews;

  @override
  ReviewsModel get model;
  @override
  @JsonKey(ignore: true)
  _$$_GetReviewsCopyWith<_$_GetReviews> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReviewsState {
  FormzStatus get status => throw _privateConstructorUsedError;
  List<AutoReviewModel> get entity => throw _privateConstructorUsedError;
  String get next => throw _privateConstructorUsedError;
  String get previous => throw _privateConstructorUsedError;
  bool get fetchMore => throw _privateConstructorUsedError;
  dynamic get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewsStateCopyWith<ReviewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewsStateCopyWith<$Res> {
  factory $ReviewsStateCopyWith(
          ReviewsState value, $Res Function(ReviewsState) then) =
      _$ReviewsStateCopyWithImpl<$Res, ReviewsState>;
  @useResult
  $Res call(
      {FormzStatus status,
      List<AutoReviewModel> entity,
      String next,
      String previous,
      bool fetchMore,
      dynamic count});
}

/// @nodoc
class _$ReviewsStateCopyWithImpl<$Res, $Val extends ReviewsState>
    implements $ReviewsStateCopyWith<$Res> {
  _$ReviewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? entity = null,
    Object? next = null,
    Object? previous = null,
    Object? fetchMore = null,
    Object? count = freezed,
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
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String,
      fetchMore: null == fetchMore
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewsStateCopyWith<$Res>
    implements $ReviewsStateCopyWith<$Res> {
  factory _$$_ReviewsStateCopyWith(
          _$_ReviewsState value, $Res Function(_$_ReviewsState) then) =
      __$$_ReviewsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus status,
      List<AutoReviewModel> entity,
      String next,
      String previous,
      bool fetchMore,
      dynamic count});
}

/// @nodoc
class __$$_ReviewsStateCopyWithImpl<$Res>
    extends _$ReviewsStateCopyWithImpl<$Res, _$_ReviewsState>
    implements _$$_ReviewsStateCopyWith<$Res> {
  __$$_ReviewsStateCopyWithImpl(
      _$_ReviewsState _value, $Res Function(_$_ReviewsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? entity = null,
    Object? next = null,
    Object? previous = null,
    Object? fetchMore = null,
    Object? count = freezed,
  }) {
    return _then(_$_ReviewsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      entity: null == entity
          ? _value._entity
          : entity // ignore: cast_nullable_to_non_nullable
              as List<AutoReviewModel>,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String,
      fetchMore: null == fetchMore
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      count: freezed == count ? _value.count! : count,
    ));
  }
}

/// @nodoc

class _$_ReviewsState implements _ReviewsState {
  _$_ReviewsState(
      {this.status = FormzStatus.pure,
      final List<AutoReviewModel> entity = const [],
      this.next = '',
      this.previous = '',
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
  final String next;
  @override
  @JsonKey()
  final String previous;
  @override
  @JsonKey()
  final bool fetchMore;
  @override
  @JsonKey()
  final dynamic count;

  @override
  String toString() {
    return 'ReviewsState(status: $status, entity: $entity, next: $next, previous: $previous, fetchMore: $fetchMore, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewsState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._entity, _entity) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            (identical(other.fetchMore, fetchMore) ||
                other.fetchMore == fetchMore) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_entity),
      next,
      previous,
      fetchMore,
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewsStateCopyWith<_$_ReviewsState> get copyWith =>
      __$$_ReviewsStateCopyWithImpl<_$_ReviewsState>(this, _$identity);
}

abstract class _ReviewsState implements ReviewsState {
  factory _ReviewsState(
      {final FormzStatus status,
      final List<AutoReviewModel> entity,
      final String next,
      final String previous,
      final bool fetchMore,
      final dynamic count}) = _$_ReviewsState;

  @override
  FormzStatus get status;
  @override
  List<AutoReviewModel> get entity;
  @override
  String get next;
  @override
  String get previous;
  @override
  bool get fetchMore;
  @override
  dynamic get count;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewsStateCopyWith<_$_ReviewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
