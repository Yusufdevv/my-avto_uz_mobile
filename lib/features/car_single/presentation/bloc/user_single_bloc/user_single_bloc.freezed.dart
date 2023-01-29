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
  String get slug => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String slug) getUserSingle,
    required TResult Function(String slug) getUserAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String slug)? getUserSingle,
    TResult? Function(String slug)? getUserAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String slug)? getUserSingle,
    TResult Function(String slug)? getUserAds,
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
  $Res call({String slug});
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
abstract class _$$_GetUserSingleCopyWith<$Res>
    implements $UserSingleEventCopyWith<$Res> {
  factory _$$_GetUserSingleCopyWith(
          _$_GetUserSingle value, $Res Function(_$_GetUserSingle) then) =
      __$$_GetUserSingleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String slug});
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
    Object? slug = null,
  }) {
    return _then(_$_GetUserSingle(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetUserSingle implements _GetUserSingle {
  _$_GetUserSingle({required this.slug});

  @override
  final String slug;

  @override
  String toString() {
    return 'UserSingleEvent.getUserSingle(slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetUserSingle &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetUserSingleCopyWith<_$_GetUserSingle> get copyWith =>
      __$$_GetUserSingleCopyWithImpl<_$_GetUserSingle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String slug) getUserSingle,
    required TResult Function(String slug) getUserAds,
  }) {
    return getUserSingle(slug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String slug)? getUserSingle,
    TResult? Function(String slug)? getUserAds,
  }) {
    return getUserSingle?.call(slug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String slug)? getUserSingle,
    TResult Function(String slug)? getUserAds,
    required TResult orElse(),
  }) {
    if (getUserSingle != null) {
      return getUserSingle(slug);
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
  factory _GetUserSingle({required final String slug}) = _$_GetUserSingle;

  @override
  String get slug;
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
  $Res call({String slug});
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
    Object? slug = null,
  }) {
    return _then(_$_GetUserAds(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetUserAds implements _GetUserAds {
  _$_GetUserAds({required this.slug});

  @override
  final String slug;

  @override
  String toString() {
    return 'UserSingleEvent.getUserAds(slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetUserAds &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetUserAdsCopyWith<_$_GetUserAds> get copyWith =>
      __$$_GetUserAdsCopyWithImpl<_$_GetUserAds>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String slug) getUserSingle,
    required TResult Function(String slug) getUserAds,
  }) {
    return getUserAds(slug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String slug)? getUserSingle,
    TResult? Function(String slug)? getUserAds,
  }) {
    return getUserAds?.call(slug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String slug)? getUserSingle,
    TResult Function(String slug)? getUserAds,
    required TResult orElse(),
  }) {
    if (getUserAds != null) {
      return getUserAds(slug);
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
  factory _GetUserAds({required final String slug}) = _$_GetUserAds;

  @override
  String get slug;
  @override
  @JsonKey(ignore: true)
  _$$_GetUserAdsCopyWith<_$_GetUserAds> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserSingleState {
  DealerSingleEntity get dealerSingleEntity =>
      throw _privateConstructorUsedError;
  List<CarsInDealerEntity> get cars => throw _privateConstructorUsedError;
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
      {DealerSingleEntity dealerSingleEntity,
      List<CarsInDealerEntity> cars,
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
    Object? dealerSingleEntity = null,
    Object? cars = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      dealerSingleEntity: null == dealerSingleEntity
          ? _value.dealerSingleEntity
          : dealerSingleEntity // ignore: cast_nullable_to_non_nullable
              as DealerSingleEntity,
      cars: null == cars
          ? _value.cars
          : cars // ignore: cast_nullable_to_non_nullable
              as List<CarsInDealerEntity>,
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
      {DealerSingleEntity dealerSingleEntity,
      List<CarsInDealerEntity> cars,
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
    Object? dealerSingleEntity = null,
    Object? cars = null,
    Object? status = null,
  }) {
    return _then(_$_UserSingleState(
      dealerSingleEntity: null == dealerSingleEntity
          ? _value.dealerSingleEntity
          : dealerSingleEntity // ignore: cast_nullable_to_non_nullable
              as DealerSingleEntity,
      cars: null == cars
          ? _value._cars
          : cars // ignore: cast_nullable_to_non_nullable
              as List<CarsInDealerEntity>,
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
      {this.dealerSingleEntity = const DealerSingleEntity(),
      final List<CarsInDealerEntity> cars = const [],
      this.status = FormzStatus.pure})
      : _cars = cars;

  @override
  @JsonKey()
  final DealerSingleEntity dealerSingleEntity;
  final List<CarsInDealerEntity> _cars;
  @override
  @JsonKey()
  List<CarsInDealerEntity> get cars {
    if (_cars is EqualUnmodifiableListView) return _cars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cars);
  }

  @override
  @JsonKey()
  final FormzStatus status;

  @override
  String toString() {
    return 'UserSingleState(dealerSingleEntity: $dealerSingleEntity, cars: $cars, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserSingleState &&
            (identical(other.dealerSingleEntity, dealerSingleEntity) ||
                other.dealerSingleEntity == dealerSingleEntity) &&
            const DeepCollectionEquality().equals(other._cars, _cars) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dealerSingleEntity,
      const DeepCollectionEquality().hash(_cars), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserSingleStateCopyWith<_$_UserSingleState> get copyWith =>
      __$$_UserSingleStateCopyWithImpl<_$_UserSingleState>(this, _$identity);
}

abstract class _UserSingleState implements UserSingleState {
  factory _UserSingleState(
      {final DealerSingleEntity dealerSingleEntity,
      final List<CarsInDealerEntity> cars,
      final FormzStatus status}) = _$_UserSingleState;

  @override
  DealerSingleEntity get dealerSingleEntity;
  @override
  List<CarsInDealerEntity> get cars;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_UserSingleStateCopyWith<_$_UserSingleState> get copyWith =>
      throw _privateConstructorUsedError;
}
