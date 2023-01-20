// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_single_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CarSingleEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getSingle,
    required TResult Function(int id) getOtherAds,
    required TResult Function(int id, dynamic Function(String) onSucc,
            dynamic Function(String) onError)
        soldAds,
    required TResult Function(int id) callCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getSingle,
    TResult? Function(int id)? getOtherAds,
    TResult? Function(int id, dynamic Function(String) onSucc,
            dynamic Function(String) onError)?
        soldAds,
    TResult? Function(int id)? callCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getSingle,
    TResult Function(int id)? getOtherAds,
    TResult Function(int id, dynamic Function(String) onSucc,
            dynamic Function(String) onError)?
        soldAds,
    TResult Function(int id)? callCount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSingle value) getSingle,
    required TResult Function(_GetAds value) getOtherAds,
    required TResult Function(_SoldAds value) soldAds,
    required TResult Function(_CallCount value) callCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSingle value)? getSingle,
    TResult? Function(_GetAds value)? getOtherAds,
    TResult? Function(_SoldAds value)? soldAds,
    TResult? Function(_CallCount value)? callCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSingle value)? getSingle,
    TResult Function(_GetAds value)? getOtherAds,
    TResult Function(_SoldAds value)? soldAds,
    TResult Function(_CallCount value)? callCount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CarSingleEventCopyWith<CarSingleEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarSingleEventCopyWith<$Res> {
  factory $CarSingleEventCopyWith(
          CarSingleEvent value, $Res Function(CarSingleEvent) then) =
      _$CarSingleEventCopyWithImpl<$Res, CarSingleEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$CarSingleEventCopyWithImpl<$Res, $Val extends CarSingleEvent>
    implements $CarSingleEventCopyWith<$Res> {
  _$CarSingleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetSingleCopyWith<$Res>
    implements $CarSingleEventCopyWith<$Res> {
  factory _$$_GetSingleCopyWith(
          _$_GetSingle value, $Res Function(_$_GetSingle) then) =
      __$$_GetSingleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_GetSingleCopyWithImpl<$Res>
    extends _$CarSingleEventCopyWithImpl<$Res, _$_GetSingle>
    implements _$$_GetSingleCopyWith<$Res> {
  __$$_GetSingleCopyWithImpl(
      _$_GetSingle _value, $Res Function(_$_GetSingle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_GetSingle(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetSingle implements _GetSingle {
  _$_GetSingle(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'CarSingleEvent.getSingle(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetSingle &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetSingleCopyWith<_$_GetSingle> get copyWith =>
      __$$_GetSingleCopyWithImpl<_$_GetSingle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getSingle,
    required TResult Function(int id) getOtherAds,
    required TResult Function(int id, dynamic Function(String) onSucc,
            dynamic Function(String) onError)
        soldAds,
    required TResult Function(int id) callCount,
  }) {
    return getSingle(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getSingle,
    TResult? Function(int id)? getOtherAds,
    TResult? Function(int id, dynamic Function(String) onSucc,
            dynamic Function(String) onError)?
        soldAds,
    TResult? Function(int id)? callCount,
  }) {
    return getSingle?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getSingle,
    TResult Function(int id)? getOtherAds,
    TResult Function(int id, dynamic Function(String) onSucc,
            dynamic Function(String) onError)?
        soldAds,
    TResult Function(int id)? callCount,
    required TResult orElse(),
  }) {
    if (getSingle != null) {
      return getSingle(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSingle value) getSingle,
    required TResult Function(_GetAds value) getOtherAds,
    required TResult Function(_SoldAds value) soldAds,
    required TResult Function(_CallCount value) callCount,
  }) {
    return getSingle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSingle value)? getSingle,
    TResult? Function(_GetAds value)? getOtherAds,
    TResult? Function(_SoldAds value)? soldAds,
    TResult? Function(_CallCount value)? callCount,
  }) {
    return getSingle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSingle value)? getSingle,
    TResult Function(_GetAds value)? getOtherAds,
    TResult Function(_SoldAds value)? soldAds,
    TResult Function(_CallCount value)? callCount,
    required TResult orElse(),
  }) {
    if (getSingle != null) {
      return getSingle(this);
    }
    return orElse();
  }
}

abstract class _GetSingle implements CarSingleEvent {
  factory _GetSingle(final int id) = _$_GetSingle;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_GetSingleCopyWith<_$_GetSingle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetAdsCopyWith<$Res>
    implements $CarSingleEventCopyWith<$Res> {
  factory _$$_GetAdsCopyWith(_$_GetAds value, $Res Function(_$_GetAds) then) =
      __$$_GetAdsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_GetAdsCopyWithImpl<$Res>
    extends _$CarSingleEventCopyWithImpl<$Res, _$_GetAds>
    implements _$$_GetAdsCopyWith<$Res> {
  __$$_GetAdsCopyWithImpl(_$_GetAds _value, $Res Function(_$_GetAds) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_GetAds(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetAds implements _GetAds {
  _$_GetAds(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'CarSingleEvent.getOtherAds(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetAds &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetAdsCopyWith<_$_GetAds> get copyWith =>
      __$$_GetAdsCopyWithImpl<_$_GetAds>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getSingle,
    required TResult Function(int id) getOtherAds,
    required TResult Function(int id, dynamic Function(String) onSucc,
            dynamic Function(String) onError)
        soldAds,
    required TResult Function(int id) callCount,
  }) {
    return getOtherAds(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getSingle,
    TResult? Function(int id)? getOtherAds,
    TResult? Function(int id, dynamic Function(String) onSucc,
            dynamic Function(String) onError)?
        soldAds,
    TResult? Function(int id)? callCount,
  }) {
    return getOtherAds?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getSingle,
    TResult Function(int id)? getOtherAds,
    TResult Function(int id, dynamic Function(String) onSucc,
            dynamic Function(String) onError)?
        soldAds,
    TResult Function(int id)? callCount,
    required TResult orElse(),
  }) {
    if (getOtherAds != null) {
      return getOtherAds(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSingle value) getSingle,
    required TResult Function(_GetAds value) getOtherAds,
    required TResult Function(_SoldAds value) soldAds,
    required TResult Function(_CallCount value) callCount,
  }) {
    return getOtherAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSingle value)? getSingle,
    TResult? Function(_GetAds value)? getOtherAds,
    TResult? Function(_SoldAds value)? soldAds,
    TResult? Function(_CallCount value)? callCount,
  }) {
    return getOtherAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSingle value)? getSingle,
    TResult Function(_GetAds value)? getOtherAds,
    TResult Function(_SoldAds value)? soldAds,
    TResult Function(_CallCount value)? callCount,
    required TResult orElse(),
  }) {
    if (getOtherAds != null) {
      return getOtherAds(this);
    }
    return orElse();
  }
}

abstract class _GetAds implements CarSingleEvent {
  factory _GetAds(final int id) = _$_GetAds;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_GetAdsCopyWith<_$_GetAds> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SoldAdsCopyWith<$Res>
    implements $CarSingleEventCopyWith<$Res> {
  factory _$$_SoldAdsCopyWith(
          _$_SoldAds value, $Res Function(_$_SoldAds) then) =
      __$$_SoldAdsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      dynamic Function(String) onSucc,
      dynamic Function(String) onError});
}

/// @nodoc
class __$$_SoldAdsCopyWithImpl<$Res>
    extends _$CarSingleEventCopyWithImpl<$Res, _$_SoldAds>
    implements _$$_SoldAdsCopyWith<$Res> {
  __$$_SoldAdsCopyWithImpl(_$_SoldAds _value, $Res Function(_$_SoldAds) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? onSucc = null,
    Object? onError = null,
  }) {
    return _then(_$_SoldAds(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == onSucc
          ? _value.onSucc
          : onSucc // ignore: cast_nullable_to_non_nullable
              as dynamic Function(String),
      null == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as dynamic Function(String),
    ));
  }
}

/// @nodoc

class _$_SoldAds implements _SoldAds {
  _$_SoldAds(this.id, this.onSucc, this.onError);

  @override
  final int id;
  @override
  final dynamic Function(String) onSucc;
  @override
  final dynamic Function(String) onError;

  @override
  String toString() {
    return 'CarSingleEvent.soldAds(id: $id, onSucc: $onSucc, onError: $onError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SoldAds &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.onSucc, onSucc) || other.onSucc == onSucc) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, onSucc, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SoldAdsCopyWith<_$_SoldAds> get copyWith =>
      __$$_SoldAdsCopyWithImpl<_$_SoldAds>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getSingle,
    required TResult Function(int id) getOtherAds,
    required TResult Function(int id, dynamic Function(String) onSucc,
            dynamic Function(String) onError)
        soldAds,
    required TResult Function(int id) callCount,
  }) {
    return soldAds(id, onSucc, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getSingle,
    TResult? Function(int id)? getOtherAds,
    TResult? Function(int id, dynamic Function(String) onSucc,
            dynamic Function(String) onError)?
        soldAds,
    TResult? Function(int id)? callCount,
  }) {
    return soldAds?.call(id, onSucc, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getSingle,
    TResult Function(int id)? getOtherAds,
    TResult Function(int id, dynamic Function(String) onSucc,
            dynamic Function(String) onError)?
        soldAds,
    TResult Function(int id)? callCount,
    required TResult orElse(),
  }) {
    if (soldAds != null) {
      return soldAds(id, onSucc, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSingle value) getSingle,
    required TResult Function(_GetAds value) getOtherAds,
    required TResult Function(_SoldAds value) soldAds,
    required TResult Function(_CallCount value) callCount,
  }) {
    return soldAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSingle value)? getSingle,
    TResult? Function(_GetAds value)? getOtherAds,
    TResult? Function(_SoldAds value)? soldAds,
    TResult? Function(_CallCount value)? callCount,
  }) {
    return soldAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSingle value)? getSingle,
    TResult Function(_GetAds value)? getOtherAds,
    TResult Function(_SoldAds value)? soldAds,
    TResult Function(_CallCount value)? callCount,
    required TResult orElse(),
  }) {
    if (soldAds != null) {
      return soldAds(this);
    }
    return orElse();
  }
}

abstract class _SoldAds implements CarSingleEvent {
  factory _SoldAds(final int id, final dynamic Function(String) onSucc,
      final dynamic Function(String) onError) = _$_SoldAds;

  @override
  int get id;
  dynamic Function(String) get onSucc;
  dynamic Function(String) get onError;
  @override
  @JsonKey(ignore: true)
  _$$_SoldAdsCopyWith<_$_SoldAds> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CallCountCopyWith<$Res>
    implements $CarSingleEventCopyWith<$Res> {
  factory _$$_CallCountCopyWith(
          _$_CallCount value, $Res Function(_$_CallCount) then) =
      __$$_CallCountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_CallCountCopyWithImpl<$Res>
    extends _$CarSingleEventCopyWithImpl<$Res, _$_CallCount>
    implements _$$_CallCountCopyWith<$Res> {
  __$$_CallCountCopyWithImpl(
      _$_CallCount _value, $Res Function(_$_CallCount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_CallCount(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CallCount implements _CallCount {
  _$_CallCount(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'CarSingleEvent.callCount(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CallCount &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CallCountCopyWith<_$_CallCount> get copyWith =>
      __$$_CallCountCopyWithImpl<_$_CallCount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getSingle,
    required TResult Function(int id) getOtherAds,
    required TResult Function(int id, dynamic Function(String) onSucc,
            dynamic Function(String) onError)
        soldAds,
    required TResult Function(int id) callCount,
  }) {
    return callCount(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getSingle,
    TResult? Function(int id)? getOtherAds,
    TResult? Function(int id, dynamic Function(String) onSucc,
            dynamic Function(String) onError)?
        soldAds,
    TResult? Function(int id)? callCount,
  }) {
    return callCount?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getSingle,
    TResult Function(int id)? getOtherAds,
    TResult Function(int id, dynamic Function(String) onSucc,
            dynamic Function(String) onError)?
        soldAds,
    TResult Function(int id)? callCount,
    required TResult orElse(),
  }) {
    if (callCount != null) {
      return callCount(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSingle value) getSingle,
    required TResult Function(_GetAds value) getOtherAds,
    required TResult Function(_SoldAds value) soldAds,
    required TResult Function(_CallCount value) callCount,
  }) {
    return callCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSingle value)? getSingle,
    TResult? Function(_GetAds value)? getOtherAds,
    TResult? Function(_SoldAds value)? soldAds,
    TResult? Function(_CallCount value)? callCount,
  }) {
    return callCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSingle value)? getSingle,
    TResult Function(_GetAds value)? getOtherAds,
    TResult Function(_SoldAds value)? soldAds,
    TResult Function(_CallCount value)? callCount,
    required TResult orElse(),
  }) {
    if (callCount != null) {
      return callCount(this);
    }
    return orElse();
  }
}

abstract class _CallCount implements CarSingleEvent {
  factory _CallCount(final int id) = _$_CallCount;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_CallCountCopyWith<_$_CallCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CarSingleState {
  FormzStatus get adsStatus => throw _privateConstructorUsedError;
  FormzStatus get soldStatus => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  String get succMessage => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  CarSingleEntity get singleEntity => throw _privateConstructorUsedError;
  List<ElasticSearchEntity> get elasticSearchEntity =>
      throw _privateConstructorUsedError;
  dynamic get fetchMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CarSingleStateCopyWith<CarSingleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarSingleStateCopyWith<$Res> {
  factory $CarSingleStateCopyWith(
          CarSingleState value, $Res Function(CarSingleState) then) =
      _$CarSingleStateCopyWithImpl<$Res, CarSingleState>;
  @useResult
  $Res call(
      {FormzStatus adsStatus,
      FormzStatus soldStatus,
      FormzStatus status,
      String succMessage,
      String errorMessage,
      CarSingleEntity singleEntity,
      List<ElasticSearchEntity> elasticSearchEntity,
      dynamic fetchMore});
}

/// @nodoc
class _$CarSingleStateCopyWithImpl<$Res, $Val extends CarSingleState>
    implements $CarSingleStateCopyWith<$Res> {
  _$CarSingleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adsStatus = null,
    Object? soldStatus = null,
    Object? status = null,
    Object? succMessage = null,
    Object? errorMessage = null,
    Object? singleEntity = null,
    Object? elasticSearchEntity = null,
    Object? fetchMore = freezed,
  }) {
    return _then(_value.copyWith(
      adsStatus: null == adsStatus
          ? _value.adsStatus
          : adsStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      soldStatus: null == soldStatus
          ? _value.soldStatus
          : soldStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      succMessage: null == succMessage
          ? _value.succMessage
          : succMessage // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      singleEntity: null == singleEntity
          ? _value.singleEntity
          : singleEntity // ignore: cast_nullable_to_non_nullable
              as CarSingleEntity,
      elasticSearchEntity: null == elasticSearchEntity
          ? _value.elasticSearchEntity
          : elasticSearchEntity // ignore: cast_nullable_to_non_nullable
              as List<ElasticSearchEntity>,
      fetchMore: freezed == fetchMore
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CarSingleStateCopyWith<$Res>
    implements $CarSingleStateCopyWith<$Res> {
  factory _$$_CarSingleStateCopyWith(
          _$_CarSingleState value, $Res Function(_$_CarSingleState) then) =
      __$$_CarSingleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus adsStatus,
      FormzStatus soldStatus,
      FormzStatus status,
      String succMessage,
      String errorMessage,
      CarSingleEntity singleEntity,
      List<ElasticSearchEntity> elasticSearchEntity,
      dynamic fetchMore});
}

/// @nodoc
class __$$_CarSingleStateCopyWithImpl<$Res>
    extends _$CarSingleStateCopyWithImpl<$Res, _$_CarSingleState>
    implements _$$_CarSingleStateCopyWith<$Res> {
  __$$_CarSingleStateCopyWithImpl(
      _$_CarSingleState _value, $Res Function(_$_CarSingleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adsStatus = null,
    Object? soldStatus = null,
    Object? status = null,
    Object? succMessage = null,
    Object? errorMessage = null,
    Object? singleEntity = null,
    Object? elasticSearchEntity = null,
    Object? fetchMore = freezed,
  }) {
    return _then(_$_CarSingleState(
      adsStatus: null == adsStatus
          ? _value.adsStatus
          : adsStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      soldStatus: null == soldStatus
          ? _value.soldStatus
          : soldStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      succMessage: null == succMessage
          ? _value.succMessage
          : succMessage // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      singleEntity: null == singleEntity
          ? _value.singleEntity
          : singleEntity // ignore: cast_nullable_to_non_nullable
              as CarSingleEntity,
      elasticSearchEntity: null == elasticSearchEntity
          ? _value._elasticSearchEntity
          : elasticSearchEntity // ignore: cast_nullable_to_non_nullable
              as List<ElasticSearchEntity>,
      fetchMore: freezed == fetchMore ? _value.fetchMore! : fetchMore,
    ));
  }
}

/// @nodoc

class _$_CarSingleState implements _CarSingleState {
  const _$_CarSingleState(
      {this.adsStatus = FormzStatus.pure,
      this.soldStatus = FormzStatus.pure,
      this.status = FormzStatus.pure,
      this.succMessage = '',
      this.errorMessage = '',
      this.singleEntity = const CarSingleEntity(),
      final List<ElasticSearchEntity> elasticSearchEntity = const [],
      this.fetchMore = false})
      : _elasticSearchEntity = elasticSearchEntity;

  @override
  @JsonKey()
  final FormzStatus adsStatus;
  @override
  @JsonKey()
  final FormzStatus soldStatus;
  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final String succMessage;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final CarSingleEntity singleEntity;
  final List<ElasticSearchEntity> _elasticSearchEntity;
  @override
  @JsonKey()
  List<ElasticSearchEntity> get elasticSearchEntity {
    if (_elasticSearchEntity is EqualUnmodifiableListView)
      return _elasticSearchEntity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_elasticSearchEntity);
  }

  @override
  @JsonKey()
  final dynamic fetchMore;

  @override
  String toString() {
    return 'CarSingleState(adsStatus: $adsStatus, soldStatus: $soldStatus, status: $status, succMessage: $succMessage, errorMessage: $errorMessage, singleEntity: $singleEntity, elasticSearchEntity: $elasticSearchEntity, fetchMore: $fetchMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CarSingleState &&
            (identical(other.adsStatus, adsStatus) ||
                other.adsStatus == adsStatus) &&
            (identical(other.soldStatus, soldStatus) ||
                other.soldStatus == soldStatus) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.succMessage, succMessage) ||
                other.succMessage == succMessage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.singleEntity, singleEntity) ||
                other.singleEntity == singleEntity) &&
            const DeepCollectionEquality()
                .equals(other._elasticSearchEntity, _elasticSearchEntity) &&
            const DeepCollectionEquality().equals(other.fetchMore, fetchMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      adsStatus,
      soldStatus,
      status,
      succMessage,
      errorMessage,
      singleEntity,
      const DeepCollectionEquality().hash(_elasticSearchEntity),
      const DeepCollectionEquality().hash(fetchMore));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CarSingleStateCopyWith<_$_CarSingleState> get copyWith =>
      __$$_CarSingleStateCopyWithImpl<_$_CarSingleState>(this, _$identity);
}

abstract class _CarSingleState implements CarSingleState {
  const factory _CarSingleState(
      {final FormzStatus adsStatus,
      final FormzStatus soldStatus,
      final FormzStatus status,
      final String succMessage,
      final String errorMessage,
      final CarSingleEntity singleEntity,
      final List<ElasticSearchEntity> elasticSearchEntity,
      final dynamic fetchMore}) = _$_CarSingleState;

  @override
  FormzStatus get adsStatus;
  @override
  FormzStatus get soldStatus;
  @override
  FormzStatus get status;
  @override
  String get succMessage;
  @override
  String get errorMessage;
  @override
  CarSingleEntity get singleEntity;
  @override
  List<ElasticSearchEntity> get elasticSearchEntity;
  @override
  dynamic get fetchMore;
  @override
  @JsonKey(ignore: true)
  _$$_CarSingleStateCopyWith<_$_CarSingleState> get copyWith =>
      throw _privateConstructorUsedError;
}
