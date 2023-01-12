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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getSingle,
    TResult? Function(int id)? getOtherAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getSingle,
    TResult Function(int id)? getOtherAds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSingle value) getSingle,
    required TResult Function(_GetAds value) getOtherAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSingle value)? getSingle,
    TResult? Function(_GetAds value)? getOtherAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSingle value)? getSingle,
    TResult Function(_GetAds value)? getOtherAds,
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
  }) {
    return getSingle(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getSingle,
    TResult? Function(int id)? getOtherAds,
  }) {
    return getSingle?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getSingle,
    TResult Function(int id)? getOtherAds,
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
  }) {
    return getSingle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSingle value)? getSingle,
    TResult? Function(_GetAds value)? getOtherAds,
  }) {
    return getSingle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSingle value)? getSingle,
    TResult Function(_GetAds value)? getOtherAds,
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
  }) {
    return getOtherAds(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getSingle,
    TResult? Function(int id)? getOtherAds,
  }) {
    return getOtherAds?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getSingle,
    TResult Function(int id)? getOtherAds,
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
  }) {
    return getOtherAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSingle value)? getSingle,
    TResult? Function(_GetAds value)? getOtherAds,
  }) {
    return getOtherAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSingle value)? getSingle,
    TResult Function(_GetAds value)? getOtherAds,
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
mixin _$CarSingleState {
  FormzStatus get adsStatus => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
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
      FormzStatus status,
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
    Object? status = null,
    Object? singleEntity = null,
    Object? elasticSearchEntity = null,
    Object? fetchMore = freezed,
  }) {
    return _then(_value.copyWith(
      adsStatus: null == adsStatus
          ? _value.adsStatus
          : adsStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
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
      FormzStatus status,
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
    Object? status = null,
    Object? singleEntity = null,
    Object? elasticSearchEntity = null,
    Object? fetchMore = freezed,
  }) {
    return _then(_$_CarSingleState(
      adsStatus: null == adsStatus
          ? _value.adsStatus
          : adsStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
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
      this.status = FormzStatus.pure,
      this.singleEntity = const CarSingleEntity(),
      final List<ElasticSearchEntity> elasticSearchEntity = const [],
      this.fetchMore = false})
      : _elasticSearchEntity = elasticSearchEntity;

  @override
  @JsonKey()
  final FormzStatus adsStatus;
  @override
  @JsonKey()
  final FormzStatus status;
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
    return 'CarSingleState(adsStatus: $adsStatus, status: $status, singleEntity: $singleEntity, elasticSearchEntity: $elasticSearchEntity, fetchMore: $fetchMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CarSingleState &&
            (identical(other.adsStatus, adsStatus) ||
                other.adsStatus == adsStatus) &&
            (identical(other.status, status) || other.status == status) &&
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
      status,
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
      final FormzStatus status,
      final CarSingleEntity singleEntity,
      final List<ElasticSearchEntity> elasticSearchEntity,
      final dynamic fetchMore}) = _$_CarSingleState;

  @override
  FormzStatus get adsStatus;
  @override
  FormzStatus get status;
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
