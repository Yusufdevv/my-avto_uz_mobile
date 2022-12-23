// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_searches_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserSearchesEvent {
  String? get search => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) getUserSearches,
    required TResult Function(String? search) getPopularSearches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? search)? getUserSearches,
    TResult Function(String? search)? getPopularSearches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? getUserSearches,
    TResult Function(String? search)? getPopularSearches,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserSearches value) getUserSearches,
    required TResult Function(_GetPopularSearches value) getPopularSearches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUserSearches value)? getUserSearches,
    TResult Function(_GetPopularSearches value)? getPopularSearches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserSearches value)? getUserSearches,
    TResult Function(_GetPopularSearches value)? getPopularSearches,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserSearchesEventCopyWith<UserSearchesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSearchesEventCopyWith<$Res> {
  factory $UserSearchesEventCopyWith(
          UserSearchesEvent value, $Res Function(UserSearchesEvent) then) =
      _$UserSearchesEventCopyWithImpl<$Res>;
  $Res call({String? search});
}

/// @nodoc
class _$UserSearchesEventCopyWithImpl<$Res>
    implements $UserSearchesEventCopyWith<$Res> {
  _$UserSearchesEventCopyWithImpl(this._value, this._then);

  final UserSearchesEvent _value;
  // ignore: unused_field
  final $Res Function(UserSearchesEvent) _then;

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
abstract class _$$_GetUserSearchesCopyWith<$Res>
    implements $UserSearchesEventCopyWith<$Res> {
  factory _$$_GetUserSearchesCopyWith(
          _$_GetUserSearches value, $Res Function(_$_GetUserSearches) then) =
      __$$_GetUserSearchesCopyWithImpl<$Res>;
  @override
  $Res call({String? search});
}

/// @nodoc
class __$$_GetUserSearchesCopyWithImpl<$Res>
    extends _$UserSearchesEventCopyWithImpl<$Res>
    implements _$$_GetUserSearchesCopyWith<$Res> {
  __$$_GetUserSearchesCopyWithImpl(
      _$_GetUserSearches _value, $Res Function(_$_GetUserSearches) _then)
      : super(_value, (v) => _then(v as _$_GetUserSearches));

  @override
  _$_GetUserSearches get _value => super._value as _$_GetUserSearches;

  @override
  $Res call({
    Object? search = freezed,
  }) {
    return _then(_$_GetUserSearches(
      search: search == freezed
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GetUserSearches implements _GetUserSearches {
  _$_GetUserSearches({this.search});

  @override
  final String? search;

  @override
  String toString() {
    return 'UserSearchesEvent.getUserSearches(search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetUserSearches &&
            const DeepCollectionEquality().equals(other.search, search));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(search));

  @JsonKey(ignore: true)
  @override
  _$$_GetUserSearchesCopyWith<_$_GetUserSearches> get copyWith =>
      __$$_GetUserSearchesCopyWithImpl<_$_GetUserSearches>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) getUserSearches,
    required TResult Function(String? search) getPopularSearches,
  }) {
    return getUserSearches(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? search)? getUserSearches,
    TResult Function(String? search)? getPopularSearches,
  }) {
    return getUserSearches?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? getUserSearches,
    TResult Function(String? search)? getPopularSearches,
    required TResult orElse(),
  }) {
    if (getUserSearches != null) {
      return getUserSearches(search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserSearches value) getUserSearches,
    required TResult Function(_GetPopularSearches value) getPopularSearches,
  }) {
    return getUserSearches(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUserSearches value)? getUserSearches,
    TResult Function(_GetPopularSearches value)? getPopularSearches,
  }) {
    return getUserSearches?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserSearches value)? getUserSearches,
    TResult Function(_GetPopularSearches value)? getPopularSearches,
    required TResult orElse(),
  }) {
    if (getUserSearches != null) {
      return getUserSearches(this);
    }
    return orElse();
  }
}

abstract class _GetUserSearches implements UserSearchesEvent {
  factory _GetUserSearches({final String? search}) = _$_GetUserSearches;

  @override
  String? get search;
  @override
  @JsonKey(ignore: true)
  _$$_GetUserSearchesCopyWith<_$_GetUserSearches> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetPopularSearchesCopyWith<$Res>
    implements $UserSearchesEventCopyWith<$Res> {
  factory _$$_GetPopularSearchesCopyWith(_$_GetPopularSearches value,
          $Res Function(_$_GetPopularSearches) then) =
      __$$_GetPopularSearchesCopyWithImpl<$Res>;
  @override
  $Res call({String? search});
}

/// @nodoc
class __$$_GetPopularSearchesCopyWithImpl<$Res>
    extends _$UserSearchesEventCopyWithImpl<$Res>
    implements _$$_GetPopularSearchesCopyWith<$Res> {
  __$$_GetPopularSearchesCopyWithImpl(
      _$_GetPopularSearches _value, $Res Function(_$_GetPopularSearches) _then)
      : super(_value, (v) => _then(v as _$_GetPopularSearches));

  @override
  _$_GetPopularSearches get _value => super._value as _$_GetPopularSearches;

  @override
  $Res call({
    Object? search = freezed,
  }) {
    return _then(_$_GetPopularSearches(
      search: search == freezed
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GetPopularSearches implements _GetPopularSearches {
  _$_GetPopularSearches({this.search});

  @override
  final String? search;

  @override
  String toString() {
    return 'UserSearchesEvent.getPopularSearches(search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetPopularSearches &&
            const DeepCollectionEquality().equals(other.search, search));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(search));

  @JsonKey(ignore: true)
  @override
  _$$_GetPopularSearchesCopyWith<_$_GetPopularSearches> get copyWith =>
      __$$_GetPopularSearchesCopyWithImpl<_$_GetPopularSearches>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) getUserSearches,
    required TResult Function(String? search) getPopularSearches,
  }) {
    return getPopularSearches(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? search)? getUserSearches,
    TResult Function(String? search)? getPopularSearches,
  }) {
    return getPopularSearches?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? getUserSearches,
    TResult Function(String? search)? getPopularSearches,
    required TResult orElse(),
  }) {
    if (getPopularSearches != null) {
      return getPopularSearches(search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserSearches value) getUserSearches,
    required TResult Function(_GetPopularSearches value) getPopularSearches,
  }) {
    return getPopularSearches(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUserSearches value)? getUserSearches,
    TResult Function(_GetPopularSearches value)? getPopularSearches,
  }) {
    return getPopularSearches?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserSearches value)? getUserSearches,
    TResult Function(_GetPopularSearches value)? getPopularSearches,
    required TResult orElse(),
  }) {
    if (getPopularSearches != null) {
      return getPopularSearches(this);
    }
    return orElse();
  }
}

abstract class _GetPopularSearches implements UserSearchesEvent {
  factory _GetPopularSearches({final String? search}) = _$_GetPopularSearches;

  @override
  String? get search;
  @override
  @JsonKey(ignore: true)
  _$$_GetPopularSearchesCopyWith<_$_GetPopularSearches> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserSearchesState {
  FormzStatus get status => throw _privateConstructorUsedError;
  List<UserSearchesEntity> get userSearches =>
      throw _privateConstructorUsedError;
  List<PopularSearchEntity> get popularSearches =>
      throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserSearchesStateCopyWith<UserSearchesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSearchesStateCopyWith<$Res> {
  factory $UserSearchesStateCopyWith(
          UserSearchesState value, $Res Function(UserSearchesState) then) =
      _$UserSearchesStateCopyWithImpl<$Res>;
  $Res call(
      {FormzStatus status,
      List<UserSearchesEntity> userSearches,
      List<PopularSearchEntity> popularSearches,
      String? next,
      String? previous,
      int count});
}

/// @nodoc
class _$UserSearchesStateCopyWithImpl<$Res>
    implements $UserSearchesStateCopyWith<$Res> {
  _$UserSearchesStateCopyWithImpl(this._value, this._then);

  final UserSearchesState _value;
  // ignore: unused_field
  final $Res Function(UserSearchesState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? userSearches = freezed,
    Object? popularSearches = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      userSearches: userSearches == freezed
          ? _value.userSearches
          : userSearches // ignore: cast_nullable_to_non_nullable
              as List<UserSearchesEntity>,
      popularSearches: popularSearches == freezed
          ? _value.popularSearches
          : popularSearches // ignore: cast_nullable_to_non_nullable
              as List<PopularSearchEntity>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_UserSearchesStateCopyWith<$Res>
    implements $UserSearchesStateCopyWith<$Res> {
  factory _$$_UserSearchesStateCopyWith(_$_UserSearchesState value,
          $Res Function(_$_UserSearchesState) then) =
      __$$_UserSearchesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {FormzStatus status,
      List<UserSearchesEntity> userSearches,
      List<PopularSearchEntity> popularSearches,
      String? next,
      String? previous,
      int count});
}

/// @nodoc
class __$$_UserSearchesStateCopyWithImpl<$Res>
    extends _$UserSearchesStateCopyWithImpl<$Res>
    implements _$$_UserSearchesStateCopyWith<$Res> {
  __$$_UserSearchesStateCopyWithImpl(
      _$_UserSearchesState _value, $Res Function(_$_UserSearchesState) _then)
      : super(_value, (v) => _then(v as _$_UserSearchesState));

  @override
  _$_UserSearchesState get _value => super._value as _$_UserSearchesState;

  @override
  $Res call({
    Object? status = freezed,
    Object? userSearches = freezed,
    Object? popularSearches = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_UserSearchesState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      userSearches: userSearches == freezed
          ? _value._userSearches
          : userSearches // ignore: cast_nullable_to_non_nullable
              as List<UserSearchesEntity>,
      popularSearches: popularSearches == freezed
          ? _value._popularSearches
          : popularSearches // ignore: cast_nullable_to_non_nullable
              as List<PopularSearchEntity>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UserSearchesState implements _UserSearchesState {
  _$_UserSearchesState(
      {this.status = FormzStatus.pure,
      final List<UserSearchesEntity> userSearches = const [],
      final List<PopularSearchEntity> popularSearches = const [],
      this.next = '',
      this.previous = '',
      this.count = 0})
      : _userSearches = userSearches,
        _popularSearches = popularSearches;

  @override
  @JsonKey()
  final FormzStatus status;
  final List<UserSearchesEntity> _userSearches;
  @override
  @JsonKey()
  List<UserSearchesEntity> get userSearches {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userSearches);
  }

  final List<PopularSearchEntity> _popularSearches;
  @override
  @JsonKey()
  List<PopularSearchEntity> get popularSearches {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularSearches);
  }

  @override
  @JsonKey()
  final String? next;
  @override
  @JsonKey()
  final String? previous;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'UserSearchesState(status: $status, userSearches: $userSearches, popularSearches: $popularSearches, next: $next, previous: $previous, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserSearchesState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other._userSearches, _userSearches) &&
            const DeepCollectionEquality()
                .equals(other._popularSearches, _popularSearches) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.previous, previous) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_userSearches),
      const DeepCollectionEquality().hash(_popularSearches),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(previous),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$$_UserSearchesStateCopyWith<_$_UserSearchesState> get copyWith =>
      __$$_UserSearchesStateCopyWithImpl<_$_UserSearchesState>(
          this, _$identity);
}

abstract class _UserSearchesState implements UserSearchesState {
  factory _UserSearchesState(
      {final FormzStatus status,
      final List<UserSearchesEntity> userSearches,
      final List<PopularSearchEntity> popularSearches,
      final String? next,
      final String? previous,
      final int count}) = _$_UserSearchesState;

  @override
  FormzStatus get status;
  @override
  List<UserSearchesEntity> get userSearches;
  @override
  List<PopularSearchEntity> get popularSearches;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_UserSearchesStateCopyWith<_$_UserSearchesState> get copyWith =>
      throw _privateConstructorUsedError;
}
