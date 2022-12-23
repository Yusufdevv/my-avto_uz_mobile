// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_review_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyReviewsEvent {
  String? get search => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) getMyReviews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? getMyReviews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? getMyReviews,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetMyReviews value) getMyReviews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetMyReviews value)? getMyReviews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetMyReviews value)? getMyReviews,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyReviewsEventCopyWith<MyReviewsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyReviewsEventCopyWith<$Res> {
  factory $MyReviewsEventCopyWith(
          MyReviewsEvent value, $Res Function(MyReviewsEvent) then) =
      _$MyReviewsEventCopyWithImpl<$Res, MyReviewsEvent>;
  @useResult
  $Res call({String? search});
}

/// @nodoc
class _$MyReviewsEventCopyWithImpl<$Res, $Val extends MyReviewsEvent>
    implements $MyReviewsEventCopyWith<$Res> {
  _$MyReviewsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
  }) {
    return _then(_value.copyWith(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetMyReviewsCopyWith<$Res>
    implements $MyReviewsEventCopyWith<$Res> {
  factory _$$_GetMyReviewsCopyWith(
          _$_GetMyReviews value, $Res Function(_$_GetMyReviews) then) =
      __$$_GetMyReviewsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? search});
}

/// @nodoc
class __$$_GetMyReviewsCopyWithImpl<$Res>
    extends _$MyReviewsEventCopyWithImpl<$Res, _$_GetMyReviews>
    implements _$$_GetMyReviewsCopyWith<$Res> {
  __$$_GetMyReviewsCopyWithImpl(
      _$_GetMyReviews _value, $Res Function(_$_GetMyReviews) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
  }) {
    return _then(_$_GetMyReviews(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GetMyReviews implements _GetMyReviews {
  _$_GetMyReviews({this.search});

  @override
  final String? search;

  @override
  String toString() {
    return 'MyReviewsEvent.getMyReviews(search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetMyReviews &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetMyReviewsCopyWith<_$_GetMyReviews> get copyWith =>
      __$$_GetMyReviewsCopyWithImpl<_$_GetMyReviews>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) getMyReviews,
  }) {
    return getMyReviews(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? getMyReviews,
  }) {
    return getMyReviews?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? getMyReviews,
    required TResult orElse(),
  }) {
    if (getMyReviews != null) {
      return getMyReviews(search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetMyReviews value) getMyReviews,
  }) {
    return getMyReviews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetMyReviews value)? getMyReviews,
  }) {
    return getMyReviews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetMyReviews value)? getMyReviews,
    required TResult orElse(),
  }) {
    if (getMyReviews != null) {
      return getMyReviews(this);
    }
    return orElse();
  }
}

abstract class _GetMyReviews implements MyReviewsEvent {
  factory _GetMyReviews({final String? search}) = _$_GetMyReviews;

  @override
  String? get search;
  @override
  @JsonKey(ignore: true)
  _$$_GetMyReviewsCopyWith<_$_GetMyReviews> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MyReviewsState {
  FormzStatus get status => throw _privateConstructorUsedError;
  List<AutoReviewModel> get entity => throw _privateConstructorUsedError;
  String get previous => throw _privateConstructorUsedError;
  String get next => throw _privateConstructorUsedError;
  bool get fetchMore => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyReviewsStateCopyWith<MyReviewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyReviewsStateCopyWith<$Res> {
  factory $MyReviewsStateCopyWith(
          MyReviewsState value, $Res Function(MyReviewsState) then) =
      _$MyReviewsStateCopyWithImpl<$Res, MyReviewsState>;
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
class _$MyReviewsStateCopyWithImpl<$Res, $Val extends MyReviewsState>
    implements $MyReviewsStateCopyWith<$Res> {
  _$MyReviewsStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_MyReviewsStateCopyWith<$Res>
    implements $MyReviewsStateCopyWith<$Res> {
  factory _$$_MyReviewsStateCopyWith(
          _$_MyReviewsState value, $Res Function(_$_MyReviewsState) then) =
      __$$_MyReviewsStateCopyWithImpl<$Res>;
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
class __$$_MyReviewsStateCopyWithImpl<$Res>
    extends _$MyReviewsStateCopyWithImpl<$Res, _$_MyReviewsState>
    implements _$$_MyReviewsStateCopyWith<$Res> {
  __$$_MyReviewsStateCopyWithImpl(
      _$_MyReviewsState _value, $Res Function(_$_MyReviewsState) _then)
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
    return _then(_$_MyReviewsState(
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

class _$_MyReviewsState implements _MyReviewsState {
  _$_MyReviewsState(
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
    return 'MyReviewsState(status: $status, entity: $entity, previous: $previous, next: $next, fetchMore: $fetchMore, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyReviewsState &&
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
  _$$_MyReviewsStateCopyWith<_$_MyReviewsState> get copyWith =>
      __$$_MyReviewsStateCopyWithImpl<_$_MyReviewsState>(this, _$identity);
}

abstract class _MyReviewsState implements MyReviewsState {
  factory _MyReviewsState(
      {final FormzStatus status,
      final List<AutoReviewModel> entity,
      final String previous,
      final String next,
      final bool fetchMore,
      final int count}) = _$_MyReviewsState;

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
  _$$_MyReviewsStateCopyWith<_$_MyReviewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
