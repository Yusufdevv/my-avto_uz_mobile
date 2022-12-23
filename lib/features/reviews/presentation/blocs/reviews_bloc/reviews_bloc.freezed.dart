// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
    TResult Function(ReviewsModel model)? getReviews,
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
    TResult Function(_GetReviews value)? getReviews,
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
      _$ReviewsEventCopyWithImpl<$Res>;
  $Res call({ReviewsModel model});
}

/// @nodoc
class _$ReviewsEventCopyWithImpl<$Res> implements $ReviewsEventCopyWith<$Res> {
  _$ReviewsEventCopyWithImpl(this._value, this._then);

  final ReviewsEvent _value;
  // ignore: unused_field
  final $Res Function(ReviewsEvent) _then;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_value.copyWith(
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ReviewsModel,
    ));
  }
}

/// @nodoc
abstract class _$$_GetReviewsCopyWith<$Res>
    implements $ReviewsEventCopyWith<$Res> {
  factory _$$_GetReviewsCopyWith(
          _$_GetReviews value, $Res Function(_$_GetReviews) then) =
      __$$_GetReviewsCopyWithImpl<$Res>;
  @override
  $Res call({ReviewsModel model});
}

/// @nodoc
class __$$_GetReviewsCopyWithImpl<$Res> extends _$ReviewsEventCopyWithImpl<$Res>
    implements _$$_GetReviewsCopyWith<$Res> {
  __$$_GetReviewsCopyWithImpl(
      _$_GetReviews _value, $Res Function(_$_GetReviews) _then)
      : super(_value, (v) => _then(v as _$_GetReviews));

  @override
  _$_GetReviews get _value => super._value as _$_GetReviews;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$_GetReviews(
      model == freezed
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
            const DeepCollectionEquality().equals(other.model, model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(model));

  @JsonKey(ignore: true)
  @override
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
    TResult Function(ReviewsModel model)? getReviews,
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
    TResult Function(_GetReviews value)? getReviews,
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
      _$ReviewsStateCopyWithImpl<$Res>;
  $Res call(
      {FormzStatus status,
      List<AutoReviewModel> entity,
      String next,
      String previous,
      bool fetchMore,
      dynamic count});
}

/// @nodoc
class _$ReviewsStateCopyWithImpl<$Res> implements $ReviewsStateCopyWith<$Res> {
  _$ReviewsStateCopyWithImpl(this._value, this._then);

  final ReviewsState _value;
  // ignore: unused_field
  final $Res Function(ReviewsState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? entity = freezed,
    Object? next = freezed,
    Object? previous = freezed,
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
              as List<AutoReviewModel>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String,
      fetchMore: fetchMore == freezed
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_ReviewsStateCopyWith<$Res>
    implements $ReviewsStateCopyWith<$Res> {
  factory _$$_ReviewsStateCopyWith(
          _$_ReviewsState value, $Res Function(_$_ReviewsState) then) =
      __$$_ReviewsStateCopyWithImpl<$Res>;
  @override
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
    extends _$ReviewsStateCopyWithImpl<$Res>
    implements _$$_ReviewsStateCopyWith<$Res> {
  __$$_ReviewsStateCopyWithImpl(
      _$_ReviewsState _value, $Res Function(_$_ReviewsState) _then)
      : super(_value, (v) => _then(v as _$_ReviewsState));

  @override
  _$_ReviewsState get _value => super._value as _$_ReviewsState;

  @override
  $Res call({
    Object? status = freezed,
    Object? entity = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? fetchMore = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_ReviewsState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      entity: entity == freezed
          ? _value._entity
          : entity // ignore: cast_nullable_to_non_nullable
              as List<AutoReviewModel>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String,
      fetchMore: fetchMore == freezed
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      count: count == freezed ? _value.count : count,
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
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._entity, _entity) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.previous, previous) &&
            const DeepCollectionEquality().equals(other.fetchMore, fetchMore) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_entity),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(previous),
      const DeepCollectionEquality().hash(fetchMore),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
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
