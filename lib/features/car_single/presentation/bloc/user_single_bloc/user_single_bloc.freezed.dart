// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_single_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserSingleEvent {
  int get userId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int userId, int announcementId) getUserSingle,
    required TResult Function(int userId) getUserAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int userId, int announcementId)? getUserSingle,
    TResult? Function(int userId)? getUserAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int userId, int announcementId)? getUserSingle,
    TResult Function(int userId)? getUserAds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserSingle value) getUserSingle,
    required TResult Function(_GetUserAds value) getUserAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserSingle value)? getUserSingle,
    TResult? Function(_GetUserAds value)? getUserAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserSingle value)? getUserSingle,
    TResult Function(_GetUserAds value)? getUserAds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserSingleEventCopyWith<UserSingleEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSingleEventCopyWith<$Res> {
  factory $UserSingleEventCopyWith(
          UserSingleEvent value, $Res Function(UserSingleEvent) then) =
      _$UserSingleEventCopyWithImpl<$Res, UserSingleEvent>;
  @useResult
  $Res call({int userId});
}

/// @nodoc
class _$UserSingleEventCopyWithImpl<$Res, $Val extends UserSingleEvent>
    implements $UserSingleEventCopyWith<$Res> {
  _$UserSingleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetUserSingleCopyWith<$Res>
    implements $UserSingleEventCopyWith<$Res> {
  factory _$$_GetUserSingleCopyWith(
          _$_GetUserSingle value, $Res Function(_$_GetUserSingle) then) =
      __$$_GetUserSingleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, int announcementId});
}

/// @nodoc
class __$$_GetUserSingleCopyWithImpl<$Res>
    extends _$UserSingleEventCopyWithImpl<$Res, _$_GetUserSingle>
    implements _$$_GetUserSingleCopyWith<$Res> {
  __$$_GetUserSingleCopyWithImpl(
      _$_GetUserSingle _value, $Res Function(_$_GetUserSingle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? announcementId = null,
  }) {
    return _then(_$_GetUserSingle(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      announcementId: null == announcementId
          ? _value.announcementId
          : announcementId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetUserSingle implements _GetUserSingle {
  _$_GetUserSingle({required this.userId, required this.announcementId});

  @override
  final int userId;
  @override
  final int announcementId;

  @override
  String toString() {
    return 'UserSingleEvent.getUserSingle(userId: $userId, announcementId: $announcementId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetUserSingle &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.announcementId, announcementId) ||
                other.announcementId == announcementId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, announcementId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetUserSingleCopyWith<_$_GetUserSingle> get copyWith =>
      __$$_GetUserSingleCopyWithImpl<_$_GetUserSingle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int userId, int announcementId) getUserSingle,
    required TResult Function(int userId) getUserAds,
  }) {
    return getUserSingle(userId, announcementId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int userId, int announcementId)? getUserSingle,
    TResult? Function(int userId)? getUserAds,
  }) {
    return getUserSingle?.call(userId, announcementId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int userId, int announcementId)? getUserSingle,
    TResult Function(int userId)? getUserAds,
    required TResult orElse(),
  }) {
    if (getUserSingle != null) {
      return getUserSingle(userId, announcementId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserSingle value) getUserSingle,
    required TResult Function(_GetUserAds value) getUserAds,
  }) {
    return getUserSingle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserSingle value)? getUserSingle,
    TResult? Function(_GetUserAds value)? getUserAds,
  }) {
    return getUserSingle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserSingle value)? getUserSingle,
    TResult Function(_GetUserAds value)? getUserAds,
    required TResult orElse(),
  }) {
    if (getUserSingle != null) {
      return getUserSingle(this);
    }
    return orElse();
  }
}

abstract class _GetUserSingle implements UserSingleEvent {
  factory _GetUserSingle(
      {required final int userId,
      required final int announcementId}) = _$_GetUserSingle;

  @override
  int get userId;
  int get announcementId;
  @override
  @JsonKey(ignore: true)
  _$$_GetUserSingleCopyWith<_$_GetUserSingle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetUserAdsCopyWith<$Res>
    implements $UserSingleEventCopyWith<$Res> {
  factory _$$_GetUserAdsCopyWith(
          _$_GetUserAds value, $Res Function(_$_GetUserAds) then) =
      __$$_GetUserAdsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId});
}

/// @nodoc
class __$$_GetUserAdsCopyWithImpl<$Res>
    extends _$UserSingleEventCopyWithImpl<$Res, _$_GetUserAds>
    implements _$$_GetUserAdsCopyWith<$Res> {
  __$$_GetUserAdsCopyWithImpl(
      _$_GetUserAds _value, $Res Function(_$_GetUserAds) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$_GetUserAds(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetUserAds implements _GetUserAds {
  _$_GetUserAds({required this.userId});

  @override
  final int userId;

  @override
  String toString() {
    return 'UserSingleEvent.getUserAds(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetUserAds &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetUserAdsCopyWith<_$_GetUserAds> get copyWith =>
      __$$_GetUserAdsCopyWithImpl<_$_GetUserAds>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int userId, int announcementId) getUserSingle,
    required TResult Function(int userId) getUserAds,
  }) {
    return getUserAds(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int userId, int announcementId)? getUserSingle,
    TResult? Function(int userId)? getUserAds,
  }) {
    return getUserAds?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int userId, int announcementId)? getUserSingle,
    TResult Function(int userId)? getUserAds,
    required TResult orElse(),
  }) {
    if (getUserAds != null) {
      return getUserAds(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserSingle value) getUserSingle,
    required TResult Function(_GetUserAds value) getUserAds,
  }) {
    return getUserAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserSingle value)? getUserSingle,
    TResult? Function(_GetUserAds value)? getUserAds,
  }) {
    return getUserAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserSingle value)? getUserSingle,
    TResult Function(_GetUserAds value)? getUserAds,
    required TResult orElse(),
  }) {
    if (getUserAds != null) {
      return getUserAds(this);
    }
    return orElse();
  }
}

abstract class _GetUserAds implements UserSingleEvent {
  factory _GetUserAds({required final int userId}) = _$_GetUserAds;

  @override
  int get userId;
  @override
  @JsonKey(ignore: true)
  _$$_GetUserAdsCopyWith<_$_GetUserAds> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserSingleState {
  UserSingleEntity get userSingleEntity => throw _privateConstructorUsedError;
  List<AnnouncementListEntity> get userAds =>
      throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserSingleStateCopyWith<UserSingleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSingleStateCopyWith<$Res> {
  factory $UserSingleStateCopyWith(
          UserSingleState value, $Res Function(UserSingleState) then) =
      _$UserSingleStateCopyWithImpl<$Res, UserSingleState>;
  @useResult
  $Res call(
      {UserSingleEntity userSingleEntity,
      List<AnnouncementListEntity> userAds,
      FormzStatus status});
}

/// @nodoc
class _$UserSingleStateCopyWithImpl<$Res, $Val extends UserSingleState>
    implements $UserSingleStateCopyWith<$Res> {
  _$UserSingleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userSingleEntity = null,
    Object? userAds = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      userSingleEntity: null == userSingleEntity
          ? _value.userSingleEntity
          : userSingleEntity // ignore: cast_nullable_to_non_nullable
              as UserSingleEntity,
      userAds: null == userAds
          ? _value.userAds
          : userAds // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementListEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserSingleStateCopyWith<$Res>
    implements $UserSingleStateCopyWith<$Res> {
  factory _$$_UserSingleStateCopyWith(
          _$_UserSingleState value, $Res Function(_$_UserSingleState) then) =
      __$$_UserSingleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserSingleEntity userSingleEntity,
      List<AnnouncementListEntity> userAds,
      FormzStatus status});
}

/// @nodoc
class __$$_UserSingleStateCopyWithImpl<$Res>
    extends _$UserSingleStateCopyWithImpl<$Res, _$_UserSingleState>
    implements _$$_UserSingleStateCopyWith<$Res> {
  __$$_UserSingleStateCopyWithImpl(
      _$_UserSingleState _value, $Res Function(_$_UserSingleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userSingleEntity = null,
    Object? userAds = null,
    Object? status = null,
  }) {
    return _then(_$_UserSingleState(
      userSingleEntity: null == userSingleEntity
          ? _value.userSingleEntity
          : userSingleEntity // ignore: cast_nullable_to_non_nullable
              as UserSingleEntity,
      userAds: null == userAds
          ? _value._userAds
          : userAds // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementListEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_UserSingleState implements _UserSingleState {
  _$_UserSingleState(
      {this.userSingleEntity = const UserSingleEntity(),
      final List<AnnouncementListEntity> userAds = const [],
      this.status = FormzStatus.pure})
      : _userAds = userAds;

  @override
  @JsonKey()
  final UserSingleEntity userSingleEntity;
  final List<AnnouncementListEntity> _userAds;
  @override
  @JsonKey()
  List<AnnouncementListEntity> get userAds {
    if (_userAds is EqualUnmodifiableListView) return _userAds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userAds);
  }

  @override
  @JsonKey()
  final FormzStatus status;

  @override
  String toString() {
    return 'UserSingleState(userSingleEntity: $userSingleEntity, userAds: $userAds, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserSingleState &&
            (identical(other.userSingleEntity, userSingleEntity) ||
                other.userSingleEntity == userSingleEntity) &&
            const DeepCollectionEquality().equals(other._userAds, _userAds) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userSingleEntity,
      const DeepCollectionEquality().hash(_userAds), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserSingleStateCopyWith<_$_UserSingleState> get copyWith =>
      __$$_UserSingleStateCopyWithImpl<_$_UserSingleState>(this, _$identity);
}

abstract class _UserSingleState implements UserSingleState {
  factory _UserSingleState(
      {final UserSingleEntity userSingleEntity,
      final List<AnnouncementListEntity> userAds,
      final FormzStatus status}) = _$_UserSingleState;

  @override
  UserSingleEntity get userSingleEntity;
  @override
  List<AnnouncementListEntity> get userAds;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_UserSingleStateCopyWith<_$_UserSingleState> get copyWith =>
      throw _privateConstructorUsedError;
}
