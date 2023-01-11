// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_search_dealer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserSearchDealerEvent {
  String? get search => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) getUserSearches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? getUserSearches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? getUserSearches,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserSearches value) getUserSearches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserSearches value)? getUserSearches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserSearches value)? getUserSearches,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserSearchDealerEventCopyWith<UserSearchDealerEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSearchDealerEventCopyWith<$Res> {
  factory $UserSearchDealerEventCopyWith(UserSearchDealerEvent value,
          $Res Function(UserSearchDealerEvent) then) =
      _$UserSearchDealerEventCopyWithImpl<$Res, UserSearchDealerEvent>;
  @useResult
  $Res call({String? search});
}

/// @nodoc
class _$UserSearchDealerEventCopyWithImpl<$Res,
        $Val extends UserSearchDealerEvent>
    implements $UserSearchDealerEventCopyWith<$Res> {
  _$UserSearchDealerEventCopyWithImpl(this._value, this._then);

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
abstract class _$$_GetUserSearchesCopyWith<$Res>
    implements $UserSearchDealerEventCopyWith<$Res> {
  factory _$$_GetUserSearchesCopyWith(
          _$_GetUserSearches value, $Res Function(_$_GetUserSearches) then) =
      __$$_GetUserSearchesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? search});
}

/// @nodoc
class __$$_GetUserSearchesCopyWithImpl<$Res>
    extends _$UserSearchDealerEventCopyWithImpl<$Res, _$_GetUserSearches>
    implements _$$_GetUserSearchesCopyWith<$Res> {
  __$$_GetUserSearchesCopyWithImpl(
      _$_GetUserSearches _value, $Res Function(_$_GetUserSearches) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
  }) {
    return _then(_$_GetUserSearches(
      search: freezed == search
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
    return 'UserSearchDealerEvent.getUserSearches(search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetUserSearches &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetUserSearchesCopyWith<_$_GetUserSearches> get copyWith =>
      __$$_GetUserSearchesCopyWithImpl<_$_GetUserSearches>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) getUserSearches,
  }) {
    return getUserSearches(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? getUserSearches,
  }) {
    return getUserSearches?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? getUserSearches,
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
  }) {
    return getUserSearches(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserSearches value)? getUserSearches,
  }) {
    return getUserSearches?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserSearches value)? getUserSearches,
    required TResult orElse(),
  }) {
    if (getUserSearches != null) {
      return getUserSearches(this);
    }
    return orElse();
  }
}

abstract class _GetUserSearches implements UserSearchDealerEvent {
  factory _GetUserSearches({final String? search}) = _$_GetUserSearches;

  @override
  String? get search;
  @override
  @JsonKey(ignore: true)
  _$$_GetUserSearchesCopyWith<_$_GetUserSearches> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserSearchDealerState {
  FormzStatus get status => throw _privateConstructorUsedError;
  List<UserSearchesDealerEntity> get userSearches =>
      throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserSearchDealerStateCopyWith<UserSearchDealerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSearchDealerStateCopyWith<$Res> {
  factory $UserSearchDealerStateCopyWith(UserSearchDealerState value,
          $Res Function(UserSearchDealerState) then) =
      _$UserSearchDealerStateCopyWithImpl<$Res, UserSearchDealerState>;
  @useResult
  $Res call(
      {FormzStatus status,
      List<UserSearchesDealerEntity> userSearches,
      String? next,
      String? previous,
      int count});
}

/// @nodoc
class _$UserSearchDealerStateCopyWithImpl<$Res,
        $Val extends UserSearchDealerState>
    implements $UserSearchDealerStateCopyWith<$Res> {
  _$UserSearchDealerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? userSearches = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      userSearches: null == userSearches
          ? _value.userSearches
          : userSearches // ignore: cast_nullable_to_non_nullable
              as List<UserSearchesDealerEntity>,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserSearchDealerStateCopyWith<$Res>
    implements $UserSearchDealerStateCopyWith<$Res> {
  factory _$$_UserSearchDealerStateCopyWith(_$_UserSearchDealerState value,
          $Res Function(_$_UserSearchDealerState) then) =
      __$$_UserSearchDealerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus status,
      List<UserSearchesDealerEntity> userSearches,
      String? next,
      String? previous,
      int count});
}

/// @nodoc
class __$$_UserSearchDealerStateCopyWithImpl<$Res>
    extends _$UserSearchDealerStateCopyWithImpl<$Res, _$_UserSearchDealerState>
    implements _$$_UserSearchDealerStateCopyWith<$Res> {
  __$$_UserSearchDealerStateCopyWithImpl(_$_UserSearchDealerState _value,
      $Res Function(_$_UserSearchDealerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? userSearches = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? count = null,
  }) {
    return _then(_$_UserSearchDealerState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      userSearches: null == userSearches
          ? _value._userSearches
          : userSearches // ignore: cast_nullable_to_non_nullable
              as List<UserSearchesDealerEntity>,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UserSearchDealerState implements _UserSearchDealerState {
  _$_UserSearchDealerState(
      {this.status = FormzStatus.pure,
      final List<UserSearchesDealerEntity> userSearches = const [],
      this.next = '',
      this.previous = '',
      this.count = 0})
      : _userSearches = userSearches;

  @override
  @JsonKey()
  final FormzStatus status;
  final List<UserSearchesDealerEntity> _userSearches;
  @override
  @JsonKey()
  List<UserSearchesDealerEntity> get userSearches {
    if (_userSearches is EqualUnmodifiableListView) return _userSearches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userSearches);
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
    return 'UserSearchDealerState(status: $status, userSearches: $userSearches, next: $next, previous: $previous, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserSearchDealerState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._userSearches, _userSearches) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_userSearches),
      next,
      previous,
      count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserSearchDealerStateCopyWith<_$_UserSearchDealerState> get copyWith =>
      __$$_UserSearchDealerStateCopyWithImpl<_$_UserSearchDealerState>(
          this, _$identity);
}

abstract class _UserSearchDealerState implements UserSearchDealerState {
  factory _UserSearchDealerState(
      {final FormzStatus status,
      final List<UserSearchesDealerEntity> userSearches,
      final String? next,
      final String? previous,
      final int count}) = _$_UserSearchDealerState;

  @override
  FormzStatus get status;
  @override
  List<UserSearchesDealerEntity> get userSearches;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_UserSearchDealerStateCopyWith<_$_UserSearchDealerState> get copyWith =>
      throw _privateConstructorUsedError;
}
