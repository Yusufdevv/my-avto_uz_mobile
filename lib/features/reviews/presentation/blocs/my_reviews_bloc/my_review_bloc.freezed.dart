// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
    TResult Function(String? search)? getMyReviews,
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
    TResult Function(_GetMyReviews value)? getMyReviews,
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
      _$MyReviewsEventCopyWithImpl<$Res>;
  $Res call({String? search});
}

/// @nodoc
class _$MyReviewsEventCopyWithImpl<$Res>
    implements $MyReviewsEventCopyWith<$Res> {
  _$MyReviewsEventCopyWithImpl(this._value, this._then);

  final MyReviewsEvent _value;
  // ignore: unused_field
  final $Res Function(MyReviewsEvent) _then;

  @override
  $Res call({
    Object? search = freezed,
  }) {
    return _then(_value.copyWith(
      search: search == freezed
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_GetMyReviewsCopyWith<$Res>
    implements $MyReviewsEventCopyWith<$Res> {
  factory _$$_GetMyReviewsCopyWith(
          _$_GetMyReviews value, $Res Function(_$_GetMyReviews) then) =
      __$$_GetMyReviewsCopyWithImpl<$Res>;
  @override
  $Res call({String? search});
}

/// @nodoc
class __$$_GetMyReviewsCopyWithImpl<$Res>
    extends _$MyReviewsEventCopyWithImpl<$Res>
    implements _$$_GetMyReviewsCopyWith<$Res> {
  __$$_GetMyReviewsCopyWithImpl(
      _$_GetMyReviews _value, $Res Function(_$_GetMyReviews) _then)
      : super(_value, (v) => _then(v as _$_GetMyReviews));

  @override
  _$_GetMyReviews get _value => super._value as _$_GetMyReviews;

  @override
  $Res call({
    Object? search = freezed,
  }) {
    return _then(_$_GetMyReviews(
      search: search == freezed
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
            const DeepCollectionEquality().equals(other.search, search));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(search));

  @JsonKey(ignore: true)
  @override
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
    TResult Function(String? search)? getMyReviews,
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
    TResult Function(_GetMyReviews value)? getMyReviews,
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
      _$MyReviewsStateCopyWithImpl<$Res>;
  $Res call(
      {FormzStatus status,
      List<AutoReviewModel> entity,
      String previous,
      String next,
      bool fetchMore,
      int count});
}

/// @nodoc
class _$MyReviewsStateCopyWithImpl<$Res>
    implements $MyReviewsStateCopyWith<$Res> {
  _$MyReviewsStateCopyWithImpl(this._value, this._then);

  final MyReviewsState _value;
  // ignore: unused_field
  final $Res Function(MyReviewsState) _then;

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
              as List<AutoReviewModel>,
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
abstract class _$$_MyReviewsStateCopyWith<$Res>
    implements $MyReviewsStateCopyWith<$Res> {
  factory _$$_MyReviewsStateCopyWith(
          _$_MyReviewsState value, $Res Function(_$_MyReviewsState) then) =
      __$$_MyReviewsStateCopyWithImpl<$Res>;
  @override
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
    extends _$MyReviewsStateCopyWithImpl<$Res>
    implements _$$_MyReviewsStateCopyWith<$Res> {
  __$$_MyReviewsStateCopyWithImpl(
      _$_MyReviewsState _value, $Res Function(_$_MyReviewsState) _then)
      : super(_value, (v) => _then(v as _$_MyReviewsState));

  @override
  _$_MyReviewsState get _value => super._value as _$_MyReviewsState;

  @override
  $Res call({
    Object? status = freezed,
    Object? entity = freezed,
    Object? previous = freezed,
    Object? next = freezed,
    Object? fetchMore = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_MyReviewsState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      entity: entity == freezed
          ? _value._entity
          : entity // ignore: cast_nullable_to_non_nullable
              as List<AutoReviewModel>,
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
