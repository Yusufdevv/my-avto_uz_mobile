// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_parameters_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterParametersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getIdVal,
    required TResult Function(DriveTypeEntity entity) getDriveType,
    required TResult Function(BodyTypeEntity entity) getBodyType,
    required TResult Function(GearboxTypeEntity entity) getGearboxType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getIdVal,
    TResult? Function(DriveTypeEntity entity)? getDriveType,
    TResult? Function(BodyTypeEntity entity)? getBodyType,
    TResult? Function(GearboxTypeEntity entity)? getGearboxType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getIdVal,
    TResult Function(DriveTypeEntity entity)? getDriveType,
    TResult Function(BodyTypeEntity entity)? getBodyType,
    TResult Function(GearboxTypeEntity entity)? getGearboxType,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetIdVal value) getIdVal,
    required TResult Function(_GetDriveType value) getDriveType,
    required TResult Function(_GetBodyType value) getBodyType,
    required TResult Function(_GetGearboxType value) getGearboxType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetIdVal value)? getIdVal,
    TResult? Function(_GetDriveType value)? getDriveType,
    TResult? Function(_GetBodyType value)? getBodyType,
    TResult? Function(_GetGearboxType value)? getGearboxType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetIdVal value)? getIdVal,
    TResult Function(_GetDriveType value)? getDriveType,
    TResult Function(_GetBodyType value)? getBodyType,
    TResult Function(_GetGearboxType value)? getGearboxType,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterParametersEventCopyWith<$Res> {
  factory $FilterParametersEventCopyWith(FilterParametersEvent value,
          $Res Function(FilterParametersEvent) then) =
      _$FilterParametersEventCopyWithImpl<$Res, FilterParametersEvent>;
}

/// @nodoc
class _$FilterParametersEventCopyWithImpl<$Res,
        $Val extends FilterParametersEvent>
    implements $FilterParametersEventCopyWith<$Res> {
  _$FilterParametersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetIdValCopyWith<$Res> {
  factory _$$_GetIdValCopyWith(
          _$_GetIdVal value, $Res Function(_$_GetIdVal) then) =
      __$$_GetIdValCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_GetIdValCopyWithImpl<$Res>
    extends _$FilterParametersEventCopyWithImpl<$Res, _$_GetIdVal>
    implements _$$_GetIdValCopyWith<$Res> {
  __$$_GetIdValCopyWithImpl(
      _$_GetIdVal _value, $Res Function(_$_GetIdVal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_GetIdVal(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetIdVal implements _GetIdVal {
  _$_GetIdVal(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'FilterParametersEvent.getIdVal(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetIdVal &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetIdValCopyWith<_$_GetIdVal> get copyWith =>
      __$$_GetIdValCopyWithImpl<_$_GetIdVal>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getIdVal,
    required TResult Function(DriveTypeEntity entity) getDriveType,
    required TResult Function(BodyTypeEntity entity) getBodyType,
    required TResult Function(GearboxTypeEntity entity) getGearboxType,
  }) {
    return getIdVal(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getIdVal,
    TResult? Function(DriveTypeEntity entity)? getDriveType,
    TResult? Function(BodyTypeEntity entity)? getBodyType,
    TResult? Function(GearboxTypeEntity entity)? getGearboxType,
  }) {
    return getIdVal?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getIdVal,
    TResult Function(DriveTypeEntity entity)? getDriveType,
    TResult Function(BodyTypeEntity entity)? getBodyType,
    TResult Function(GearboxTypeEntity entity)? getGearboxType,
    required TResult orElse(),
  }) {
    if (getIdVal != null) {
      return getIdVal(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetIdVal value) getIdVal,
    required TResult Function(_GetDriveType value) getDriveType,
    required TResult Function(_GetBodyType value) getBodyType,
    required TResult Function(_GetGearboxType value) getGearboxType,
  }) {
    return getIdVal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetIdVal value)? getIdVal,
    TResult? Function(_GetDriveType value)? getDriveType,
    TResult? Function(_GetBodyType value)? getBodyType,
    TResult? Function(_GetGearboxType value)? getGearboxType,
  }) {
    return getIdVal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetIdVal value)? getIdVal,
    TResult Function(_GetDriveType value)? getDriveType,
    TResult Function(_GetBodyType value)? getBodyType,
    TResult Function(_GetGearboxType value)? getGearboxType,
    required TResult orElse(),
  }) {
    if (getIdVal != null) {
      return getIdVal(this);
    }
    return orElse();
  }
}

abstract class _GetIdVal implements FilterParametersEvent {
  factory _GetIdVal(final int id) = _$_GetIdVal;

  int get id;
  @JsonKey(ignore: true)
  _$$_GetIdValCopyWith<_$_GetIdVal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetDriveTypeCopyWith<$Res> {
  factory _$$_GetDriveTypeCopyWith(
          _$_GetDriveType value, $Res Function(_$_GetDriveType) then) =
      __$$_GetDriveTypeCopyWithImpl<$Res>;
  @useResult
  $Res call({DriveTypeEntity entity});
}

/// @nodoc
class __$$_GetDriveTypeCopyWithImpl<$Res>
    extends _$FilterParametersEventCopyWithImpl<$Res, _$_GetDriveType>
    implements _$$_GetDriveTypeCopyWith<$Res> {
  __$$_GetDriveTypeCopyWithImpl(
      _$_GetDriveType _value, $Res Function(_$_GetDriveType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = null,
  }) {
    return _then(_$_GetDriveType(
      null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as DriveTypeEntity,
    ));
  }
}

/// @nodoc

class _$_GetDriveType implements _GetDriveType {
  _$_GetDriveType(this.entity);

  @override
  final DriveTypeEntity entity;

  @override
  String toString() {
    return 'FilterParametersEvent.getDriveType(entity: $entity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetDriveType &&
            (identical(other.entity, entity) || other.entity == entity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetDriveTypeCopyWith<_$_GetDriveType> get copyWith =>
      __$$_GetDriveTypeCopyWithImpl<_$_GetDriveType>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getIdVal,
    required TResult Function(DriveTypeEntity entity) getDriveType,
    required TResult Function(BodyTypeEntity entity) getBodyType,
    required TResult Function(GearboxTypeEntity entity) getGearboxType,
  }) {
    return getDriveType(entity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getIdVal,
    TResult? Function(DriveTypeEntity entity)? getDriveType,
    TResult? Function(BodyTypeEntity entity)? getBodyType,
    TResult? Function(GearboxTypeEntity entity)? getGearboxType,
  }) {
    return getDriveType?.call(entity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getIdVal,
    TResult Function(DriveTypeEntity entity)? getDriveType,
    TResult Function(BodyTypeEntity entity)? getBodyType,
    TResult Function(GearboxTypeEntity entity)? getGearboxType,
    required TResult orElse(),
  }) {
    if (getDriveType != null) {
      return getDriveType(entity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetIdVal value) getIdVal,
    required TResult Function(_GetDriveType value) getDriveType,
    required TResult Function(_GetBodyType value) getBodyType,
    required TResult Function(_GetGearboxType value) getGearboxType,
  }) {
    return getDriveType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetIdVal value)? getIdVal,
    TResult? Function(_GetDriveType value)? getDriveType,
    TResult? Function(_GetBodyType value)? getBodyType,
    TResult? Function(_GetGearboxType value)? getGearboxType,
  }) {
    return getDriveType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetIdVal value)? getIdVal,
    TResult Function(_GetDriveType value)? getDriveType,
    TResult Function(_GetBodyType value)? getBodyType,
    TResult Function(_GetGearboxType value)? getGearboxType,
    required TResult orElse(),
  }) {
    if (getDriveType != null) {
      return getDriveType(this);
    }
    return orElse();
  }
}

abstract class _GetDriveType implements FilterParametersEvent {
  factory _GetDriveType(final DriveTypeEntity entity) = _$_GetDriveType;

  DriveTypeEntity get entity;
  @JsonKey(ignore: true)
  _$$_GetDriveTypeCopyWith<_$_GetDriveType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetBodyTypeCopyWith<$Res> {
  factory _$$_GetBodyTypeCopyWith(
          _$_GetBodyType value, $Res Function(_$_GetBodyType) then) =
      __$$_GetBodyTypeCopyWithImpl<$Res>;
  @useResult
  $Res call({BodyTypeEntity entity});
}

/// @nodoc
class __$$_GetBodyTypeCopyWithImpl<$Res>
    extends _$FilterParametersEventCopyWithImpl<$Res, _$_GetBodyType>
    implements _$$_GetBodyTypeCopyWith<$Res> {
  __$$_GetBodyTypeCopyWithImpl(
      _$_GetBodyType _value, $Res Function(_$_GetBodyType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = null,
  }) {
    return _then(_$_GetBodyType(
      null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as BodyTypeEntity,
    ));
  }
}

/// @nodoc

class _$_GetBodyType implements _GetBodyType {
  _$_GetBodyType(this.entity);

  @override
  final BodyTypeEntity entity;

  @override
  String toString() {
    return 'FilterParametersEvent.getBodyType(entity: $entity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetBodyType &&
            (identical(other.entity, entity) || other.entity == entity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetBodyTypeCopyWith<_$_GetBodyType> get copyWith =>
      __$$_GetBodyTypeCopyWithImpl<_$_GetBodyType>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getIdVal,
    required TResult Function(DriveTypeEntity entity) getDriveType,
    required TResult Function(BodyTypeEntity entity) getBodyType,
    required TResult Function(GearboxTypeEntity entity) getGearboxType,
  }) {
    return getBodyType(entity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getIdVal,
    TResult? Function(DriveTypeEntity entity)? getDriveType,
    TResult? Function(BodyTypeEntity entity)? getBodyType,
    TResult? Function(GearboxTypeEntity entity)? getGearboxType,
  }) {
    return getBodyType?.call(entity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getIdVal,
    TResult Function(DriveTypeEntity entity)? getDriveType,
    TResult Function(BodyTypeEntity entity)? getBodyType,
    TResult Function(GearboxTypeEntity entity)? getGearboxType,
    required TResult orElse(),
  }) {
    if (getBodyType != null) {
      return getBodyType(entity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetIdVal value) getIdVal,
    required TResult Function(_GetDriveType value) getDriveType,
    required TResult Function(_GetBodyType value) getBodyType,
    required TResult Function(_GetGearboxType value) getGearboxType,
  }) {
    return getBodyType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetIdVal value)? getIdVal,
    TResult? Function(_GetDriveType value)? getDriveType,
    TResult? Function(_GetBodyType value)? getBodyType,
    TResult? Function(_GetGearboxType value)? getGearboxType,
  }) {
    return getBodyType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetIdVal value)? getIdVal,
    TResult Function(_GetDriveType value)? getDriveType,
    TResult Function(_GetBodyType value)? getBodyType,
    TResult Function(_GetGearboxType value)? getGearboxType,
    required TResult orElse(),
  }) {
    if (getBodyType != null) {
      return getBodyType(this);
    }
    return orElse();
  }
}

abstract class _GetBodyType implements FilterParametersEvent {
  factory _GetBodyType(final BodyTypeEntity entity) = _$_GetBodyType;

  BodyTypeEntity get entity;
  @JsonKey(ignore: true)
  _$$_GetBodyTypeCopyWith<_$_GetBodyType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetGearboxTypeCopyWith<$Res> {
  factory _$$_GetGearboxTypeCopyWith(
          _$_GetGearboxType value, $Res Function(_$_GetGearboxType) then) =
      __$$_GetGearboxTypeCopyWithImpl<$Res>;
  @useResult
  $Res call({GearboxTypeEntity entity});
}

/// @nodoc
class __$$_GetGearboxTypeCopyWithImpl<$Res>
    extends _$FilterParametersEventCopyWithImpl<$Res, _$_GetGearboxType>
    implements _$$_GetGearboxTypeCopyWith<$Res> {
  __$$_GetGearboxTypeCopyWithImpl(
      _$_GetGearboxType _value, $Res Function(_$_GetGearboxType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = null,
  }) {
    return _then(_$_GetGearboxType(
      null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as GearboxTypeEntity,
    ));
  }
}

/// @nodoc

class _$_GetGearboxType implements _GetGearboxType {
  _$_GetGearboxType(this.entity);

  @override
  final GearboxTypeEntity entity;

  @override
  String toString() {
    return 'FilterParametersEvent.getGearboxType(entity: $entity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetGearboxType &&
            (identical(other.entity, entity) || other.entity == entity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetGearboxTypeCopyWith<_$_GetGearboxType> get copyWith =>
      __$$_GetGearboxTypeCopyWithImpl<_$_GetGearboxType>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getIdVal,
    required TResult Function(DriveTypeEntity entity) getDriveType,
    required TResult Function(BodyTypeEntity entity) getBodyType,
    required TResult Function(GearboxTypeEntity entity) getGearboxType,
  }) {
    return getGearboxType(entity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getIdVal,
    TResult? Function(DriveTypeEntity entity)? getDriveType,
    TResult? Function(BodyTypeEntity entity)? getBodyType,
    TResult? Function(GearboxTypeEntity entity)? getGearboxType,
  }) {
    return getGearboxType?.call(entity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getIdVal,
    TResult Function(DriveTypeEntity entity)? getDriveType,
    TResult Function(BodyTypeEntity entity)? getBodyType,
    TResult Function(GearboxTypeEntity entity)? getGearboxType,
    required TResult orElse(),
  }) {
    if (getGearboxType != null) {
      return getGearboxType(entity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetIdVal value) getIdVal,
    required TResult Function(_GetDriveType value) getDriveType,
    required TResult Function(_GetBodyType value) getBodyType,
    required TResult Function(_GetGearboxType value) getGearboxType,
  }) {
    return getGearboxType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetIdVal value)? getIdVal,
    TResult? Function(_GetDriveType value)? getDriveType,
    TResult? Function(_GetBodyType value)? getBodyType,
    TResult? Function(_GetGearboxType value)? getGearboxType,
  }) {
    return getGearboxType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetIdVal value)? getIdVal,
    TResult Function(_GetDriveType value)? getDriveType,
    TResult Function(_GetBodyType value)? getBodyType,
    TResult Function(_GetGearboxType value)? getGearboxType,
    required TResult orElse(),
  }) {
    if (getGearboxType != null) {
      return getGearboxType(this);
    }
    return orElse();
  }
}

abstract class _GetGearboxType implements FilterParametersEvent {
  factory _GetGearboxType(final GearboxTypeEntity entity) = _$_GetGearboxType;

  GearboxTypeEntity get entity;
  @JsonKey(ignore: true)
  _$$_GetGearboxTypeCopyWith<_$_GetGearboxType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FilterParametersState {
  int get idVal => throw _privateConstructorUsedError;
  GearboxTypeEntity get gearboxTypeEntity => throw _privateConstructorUsedError;
  BodyTypeEntity get bodyTypeEntity => throw _privateConstructorUsedError;
  DriveTypeEntity get driveTypeEntity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterParametersStateCopyWith<FilterParametersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterParametersStateCopyWith<$Res> {
  factory $FilterParametersStateCopyWith(FilterParametersState value,
          $Res Function(FilterParametersState) then) =
      _$FilterParametersStateCopyWithImpl<$Res, FilterParametersState>;
  @useResult
  $Res call(
      {int idVal,
      GearboxTypeEntity gearboxTypeEntity,
      BodyTypeEntity bodyTypeEntity,
      DriveTypeEntity driveTypeEntity});
}

/// @nodoc
class _$FilterParametersStateCopyWithImpl<$Res,
        $Val extends FilterParametersState>
    implements $FilterParametersStateCopyWith<$Res> {
  _$FilterParametersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idVal = null,
    Object? gearboxTypeEntity = null,
    Object? bodyTypeEntity = null,
    Object? driveTypeEntity = null,
  }) {
    return _then(_value.copyWith(
      idVal: null == idVal
          ? _value.idVal
          : idVal // ignore: cast_nullable_to_non_nullable
              as int,
      gearboxTypeEntity: null == gearboxTypeEntity
          ? _value.gearboxTypeEntity
          : gearboxTypeEntity // ignore: cast_nullable_to_non_nullable
              as GearboxTypeEntity,
      bodyTypeEntity: null == bodyTypeEntity
          ? _value.bodyTypeEntity
          : bodyTypeEntity // ignore: cast_nullable_to_non_nullable
              as BodyTypeEntity,
      driveTypeEntity: null == driveTypeEntity
          ? _value.driveTypeEntity
          : driveTypeEntity // ignore: cast_nullable_to_non_nullable
              as DriveTypeEntity,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterParametersStateCopyWith<$Res>
    implements $FilterParametersStateCopyWith<$Res> {
  factory _$$_FilterParametersStateCopyWith(_$_FilterParametersState value,
          $Res Function(_$_FilterParametersState) then) =
      __$$_FilterParametersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int idVal,
      GearboxTypeEntity gearboxTypeEntity,
      BodyTypeEntity bodyTypeEntity,
      DriveTypeEntity driveTypeEntity});
}

/// @nodoc
class __$$_FilterParametersStateCopyWithImpl<$Res>
    extends _$FilterParametersStateCopyWithImpl<$Res, _$_FilterParametersState>
    implements _$$_FilterParametersStateCopyWith<$Res> {
  __$$_FilterParametersStateCopyWithImpl(_$_FilterParametersState _value,
      $Res Function(_$_FilterParametersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idVal = null,
    Object? gearboxTypeEntity = null,
    Object? bodyTypeEntity = null,
    Object? driveTypeEntity = null,
  }) {
    return _then(_$_FilterParametersState(
      idVal: null == idVal
          ? _value.idVal
          : idVal // ignore: cast_nullable_to_non_nullable
              as int,
      gearboxTypeEntity: null == gearboxTypeEntity
          ? _value.gearboxTypeEntity
          : gearboxTypeEntity // ignore: cast_nullable_to_non_nullable
              as GearboxTypeEntity,
      bodyTypeEntity: null == bodyTypeEntity
          ? _value.bodyTypeEntity
          : bodyTypeEntity // ignore: cast_nullable_to_non_nullable
              as BodyTypeEntity,
      driveTypeEntity: null == driveTypeEntity
          ? _value.driveTypeEntity
          : driveTypeEntity // ignore: cast_nullable_to_non_nullable
              as DriveTypeEntity,
    ));
  }
}

/// @nodoc

class _$_FilterParametersState implements _FilterParametersState {
  _$_FilterParametersState(
      {this.idVal = 0,
      this.gearboxTypeEntity =
          const GearboxTypeEntity(id: -1, type: '', logo: ''),
      this.bodyTypeEntity = const BodyTypeEntity(id: -1, type: '', logo: ''),
      this.driveTypeEntity = const DriveTypeModel(id: -1, type: '', logo: '')});

  @override
  @JsonKey()
  final int idVal;
  @override
  @JsonKey()
  final GearboxTypeEntity gearboxTypeEntity;
  @override
  @JsonKey()
  final BodyTypeEntity bodyTypeEntity;
  @override
  @JsonKey()
  final DriveTypeEntity driveTypeEntity;

  @override
  String toString() {
    return 'FilterParametersState(idVal: $idVal, gearboxTypeEntity: $gearboxTypeEntity, bodyTypeEntity: $bodyTypeEntity, driveTypeEntity: $driveTypeEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterParametersState &&
            (identical(other.idVal, idVal) || other.idVal == idVal) &&
            (identical(other.gearboxTypeEntity, gearboxTypeEntity) ||
                other.gearboxTypeEntity == gearboxTypeEntity) &&
            (identical(other.bodyTypeEntity, bodyTypeEntity) ||
                other.bodyTypeEntity == bodyTypeEntity) &&
            (identical(other.driveTypeEntity, driveTypeEntity) ||
                other.driveTypeEntity == driveTypeEntity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, idVal, gearboxTypeEntity, bodyTypeEntity, driveTypeEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterParametersStateCopyWith<_$_FilterParametersState> get copyWith =>
      __$$_FilterParametersStateCopyWithImpl<_$_FilterParametersState>(
          this, _$identity);
}

abstract class _FilterParametersState implements FilterParametersState {
  factory _FilterParametersState(
      {final int idVal,
      final GearboxTypeEntity gearboxTypeEntity,
      final BodyTypeEntity bodyTypeEntity,
      final DriveTypeEntity driveTypeEntity}) = _$_FilterParametersState;

  @override
  int get idVal;
  @override
  GearboxTypeEntity get gearboxTypeEntity;
  @override
  BodyTypeEntity get bodyTypeEntity;
  @override
  DriveTypeEntity get driveTypeEntity;
  @override
  @JsonKey(ignore: true)
  _$$_FilterParametersStateCopyWith<_$_FilterParametersState> get copyWith =>
      throw _privateConstructorUsedError;
}
