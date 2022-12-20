// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad_manipulation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdManipulationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int bodyTypeId) setBodyType,
    required TResult Function(int carModelId) setCarModel,
    required TResult Function(int driveTypeId) setDriveType,
    required TResult Function(int generationId) setGeneration,
    required TResult Function(int year) setYear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int bodyTypeId)? setBodyType,
    TResult? Function(int carModelId)? setCarModel,
    TResult? Function(int driveTypeId)? setDriveType,
    TResult? Function(int generationId)? setGeneration,
    TResult? Function(int year)? setYear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int bodyTypeId)? setBodyType,
    TResult Function(int carModelId)? setCarModel,
    TResult Function(int driveTypeId)? setDriveType,
    TResult Function(int generationId)? setGeneration,
    TResult Function(int year)? setYear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetBodyType value) setBodyType,
    required TResult Function(_SetCarModel value) setCarModel,
    required TResult Function(_SetDriveType value) setDriveType,
    required TResult Function(_SetGeneration value) setGeneration,
    required TResult Function(_SetYear value) setYear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetBodyType value)? setBodyType,
    TResult? Function(_SetCarModel value)? setCarModel,
    TResult? Function(_SetDriveType value)? setDriveType,
    TResult? Function(_SetGeneration value)? setGeneration,
    TResult? Function(_SetYear value)? setYear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetBodyType value)? setBodyType,
    TResult Function(_SetCarModel value)? setCarModel,
    TResult Function(_SetDriveType value)? setDriveType,
    TResult Function(_SetGeneration value)? setGeneration,
    TResult Function(_SetYear value)? setYear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdManipulationEventCopyWith<$Res> {
  factory $AdManipulationEventCopyWith(
          AdManipulationEvent value, $Res Function(AdManipulationEvent) then) =
      _$AdManipulationEventCopyWithImpl<$Res, AdManipulationEvent>;
}

/// @nodoc
class _$AdManipulationEventCopyWithImpl<$Res, $Val extends AdManipulationEvent>
    implements $AdManipulationEventCopyWith<$Res> {
  _$AdManipulationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SetBodyTypeCopyWith<$Res> {
  factory _$$_SetBodyTypeCopyWith(
          _$_SetBodyType value, $Res Function(_$_SetBodyType) then) =
      __$$_SetBodyTypeCopyWithImpl<$Res>;
  @useResult
  $Res call({int bodyTypeId});
}

/// @nodoc
class __$$_SetBodyTypeCopyWithImpl<$Res>
    extends _$AdManipulationEventCopyWithImpl<$Res, _$_SetBodyType>
    implements _$$_SetBodyTypeCopyWith<$Res> {
  __$$_SetBodyTypeCopyWithImpl(
      _$_SetBodyType _value, $Res Function(_$_SetBodyType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bodyTypeId = null,
  }) {
    return _then(_$_SetBodyType(
      bodyTypeId: null == bodyTypeId
          ? _value.bodyTypeId
          : bodyTypeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SetBodyType implements _SetBodyType {
  const _$_SetBodyType({required this.bodyTypeId});

  @override
  final int bodyTypeId;

  @override
  String toString() {
    return 'AdManipulationEvent.setBodyType(bodyTypeId: $bodyTypeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetBodyType &&
            (identical(other.bodyTypeId, bodyTypeId) ||
                other.bodyTypeId == bodyTypeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bodyTypeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetBodyTypeCopyWith<_$_SetBodyType> get copyWith =>
      __$$_SetBodyTypeCopyWithImpl<_$_SetBodyType>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int bodyTypeId) setBodyType,
    required TResult Function(int carModelId) setCarModel,
    required TResult Function(int driveTypeId) setDriveType,
    required TResult Function(int generationId) setGeneration,
    required TResult Function(int year) setYear,
  }) {
    return setBodyType(bodyTypeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int bodyTypeId)? setBodyType,
    TResult? Function(int carModelId)? setCarModel,
    TResult? Function(int driveTypeId)? setDriveType,
    TResult? Function(int generationId)? setGeneration,
    TResult? Function(int year)? setYear,
  }) {
    return setBodyType?.call(bodyTypeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int bodyTypeId)? setBodyType,
    TResult Function(int carModelId)? setCarModel,
    TResult Function(int driveTypeId)? setDriveType,
    TResult Function(int generationId)? setGeneration,
    TResult Function(int year)? setYear,
    required TResult orElse(),
  }) {
    if (setBodyType != null) {
      return setBodyType(bodyTypeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetBodyType value) setBodyType,
    required TResult Function(_SetCarModel value) setCarModel,
    required TResult Function(_SetDriveType value) setDriveType,
    required TResult Function(_SetGeneration value) setGeneration,
    required TResult Function(_SetYear value) setYear,
  }) {
    return setBodyType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetBodyType value)? setBodyType,
    TResult? Function(_SetCarModel value)? setCarModel,
    TResult? Function(_SetDriveType value)? setDriveType,
    TResult? Function(_SetGeneration value)? setGeneration,
    TResult? Function(_SetYear value)? setYear,
  }) {
    return setBodyType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetBodyType value)? setBodyType,
    TResult Function(_SetCarModel value)? setCarModel,
    TResult Function(_SetDriveType value)? setDriveType,
    TResult Function(_SetGeneration value)? setGeneration,
    TResult Function(_SetYear value)? setYear,
    required TResult orElse(),
  }) {
    if (setBodyType != null) {
      return setBodyType(this);
    }
    return orElse();
  }
}

abstract class _SetBodyType implements AdManipulationEvent {
  const factory _SetBodyType({required final int bodyTypeId}) = _$_SetBodyType;

  int get bodyTypeId;
  @JsonKey(ignore: true)
  _$$_SetBodyTypeCopyWith<_$_SetBodyType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetCarModelCopyWith<$Res> {
  factory _$$_SetCarModelCopyWith(
          _$_SetCarModel value, $Res Function(_$_SetCarModel) then) =
      __$$_SetCarModelCopyWithImpl<$Res>;
  @useResult
  $Res call({int carModelId});
}

/// @nodoc
class __$$_SetCarModelCopyWithImpl<$Res>
    extends _$AdManipulationEventCopyWithImpl<$Res, _$_SetCarModel>
    implements _$$_SetCarModelCopyWith<$Res> {
  __$$_SetCarModelCopyWithImpl(
      _$_SetCarModel _value, $Res Function(_$_SetCarModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carModelId = null,
  }) {
    return _then(_$_SetCarModel(
      carModelId: null == carModelId
          ? _value.carModelId
          : carModelId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SetCarModel implements _SetCarModel {
  const _$_SetCarModel({required this.carModelId});

  @override
  final int carModelId;

  @override
  String toString() {
    return 'AdManipulationEvent.setCarModel(carModelId: $carModelId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetCarModel &&
            (identical(other.carModelId, carModelId) ||
                other.carModelId == carModelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, carModelId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetCarModelCopyWith<_$_SetCarModel> get copyWith =>
      __$$_SetCarModelCopyWithImpl<_$_SetCarModel>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int bodyTypeId) setBodyType,
    required TResult Function(int carModelId) setCarModel,
    required TResult Function(int driveTypeId) setDriveType,
    required TResult Function(int generationId) setGeneration,
    required TResult Function(int year) setYear,
  }) {
    return setCarModel(carModelId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int bodyTypeId)? setBodyType,
    TResult? Function(int carModelId)? setCarModel,
    TResult? Function(int driveTypeId)? setDriveType,
    TResult? Function(int generationId)? setGeneration,
    TResult? Function(int year)? setYear,
  }) {
    return setCarModel?.call(carModelId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int bodyTypeId)? setBodyType,
    TResult Function(int carModelId)? setCarModel,
    TResult Function(int driveTypeId)? setDriveType,
    TResult Function(int generationId)? setGeneration,
    TResult Function(int year)? setYear,
    required TResult orElse(),
  }) {
    if (setCarModel != null) {
      return setCarModel(carModelId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetBodyType value) setBodyType,
    required TResult Function(_SetCarModel value) setCarModel,
    required TResult Function(_SetDriveType value) setDriveType,
    required TResult Function(_SetGeneration value) setGeneration,
    required TResult Function(_SetYear value) setYear,
  }) {
    return setCarModel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetBodyType value)? setBodyType,
    TResult? Function(_SetCarModel value)? setCarModel,
    TResult? Function(_SetDriveType value)? setDriveType,
    TResult? Function(_SetGeneration value)? setGeneration,
    TResult? Function(_SetYear value)? setYear,
  }) {
    return setCarModel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetBodyType value)? setBodyType,
    TResult Function(_SetCarModel value)? setCarModel,
    TResult Function(_SetDriveType value)? setDriveType,
    TResult Function(_SetGeneration value)? setGeneration,
    TResult Function(_SetYear value)? setYear,
    required TResult orElse(),
  }) {
    if (setCarModel != null) {
      return setCarModel(this);
    }
    return orElse();
  }
}

abstract class _SetCarModel implements AdManipulationEvent {
  const factory _SetCarModel({required final int carModelId}) = _$_SetCarModel;

  int get carModelId;
  @JsonKey(ignore: true)
  _$$_SetCarModelCopyWith<_$_SetCarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetDriveTypeCopyWith<$Res> {
  factory _$$_SetDriveTypeCopyWith(
          _$_SetDriveType value, $Res Function(_$_SetDriveType) then) =
      __$$_SetDriveTypeCopyWithImpl<$Res>;
  @useResult
  $Res call({int driveTypeId});
}

/// @nodoc
class __$$_SetDriveTypeCopyWithImpl<$Res>
    extends _$AdManipulationEventCopyWithImpl<$Res, _$_SetDriveType>
    implements _$$_SetDriveTypeCopyWith<$Res> {
  __$$_SetDriveTypeCopyWithImpl(
      _$_SetDriveType _value, $Res Function(_$_SetDriveType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driveTypeId = null,
  }) {
    return _then(_$_SetDriveType(
      driveTypeId: null == driveTypeId
          ? _value.driveTypeId
          : driveTypeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SetDriveType implements _SetDriveType {
  const _$_SetDriveType({required this.driveTypeId});

  @override
  final int driveTypeId;

  @override
  String toString() {
    return 'AdManipulationEvent.setDriveType(driveTypeId: $driveTypeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetDriveType &&
            (identical(other.driveTypeId, driveTypeId) ||
                other.driveTypeId == driveTypeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, driveTypeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetDriveTypeCopyWith<_$_SetDriveType> get copyWith =>
      __$$_SetDriveTypeCopyWithImpl<_$_SetDriveType>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int bodyTypeId) setBodyType,
    required TResult Function(int carModelId) setCarModel,
    required TResult Function(int driveTypeId) setDriveType,
    required TResult Function(int generationId) setGeneration,
    required TResult Function(int year) setYear,
  }) {
    return setDriveType(driveTypeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int bodyTypeId)? setBodyType,
    TResult? Function(int carModelId)? setCarModel,
    TResult? Function(int driveTypeId)? setDriveType,
    TResult? Function(int generationId)? setGeneration,
    TResult? Function(int year)? setYear,
  }) {
    return setDriveType?.call(driveTypeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int bodyTypeId)? setBodyType,
    TResult Function(int carModelId)? setCarModel,
    TResult Function(int driveTypeId)? setDriveType,
    TResult Function(int generationId)? setGeneration,
    TResult Function(int year)? setYear,
    required TResult orElse(),
  }) {
    if (setDriveType != null) {
      return setDriveType(driveTypeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetBodyType value) setBodyType,
    required TResult Function(_SetCarModel value) setCarModel,
    required TResult Function(_SetDriveType value) setDriveType,
    required TResult Function(_SetGeneration value) setGeneration,
    required TResult Function(_SetYear value) setYear,
  }) {
    return setDriveType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetBodyType value)? setBodyType,
    TResult? Function(_SetCarModel value)? setCarModel,
    TResult? Function(_SetDriveType value)? setDriveType,
    TResult? Function(_SetGeneration value)? setGeneration,
    TResult? Function(_SetYear value)? setYear,
  }) {
    return setDriveType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetBodyType value)? setBodyType,
    TResult Function(_SetCarModel value)? setCarModel,
    TResult Function(_SetDriveType value)? setDriveType,
    TResult Function(_SetGeneration value)? setGeneration,
    TResult Function(_SetYear value)? setYear,
    required TResult orElse(),
  }) {
    if (setDriveType != null) {
      return setDriveType(this);
    }
    return orElse();
  }
}

abstract class _SetDriveType implements AdManipulationEvent {
  const factory _SetDriveType({required final int driveTypeId}) =
      _$_SetDriveType;

  int get driveTypeId;
  @JsonKey(ignore: true)
  _$$_SetDriveTypeCopyWith<_$_SetDriveType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetGenerationCopyWith<$Res> {
  factory _$$_SetGenerationCopyWith(
          _$_SetGeneration value, $Res Function(_$_SetGeneration) then) =
      __$$_SetGenerationCopyWithImpl<$Res>;
  @useResult
  $Res call({int generationId});
}

/// @nodoc
class __$$_SetGenerationCopyWithImpl<$Res>
    extends _$AdManipulationEventCopyWithImpl<$Res, _$_SetGeneration>
    implements _$$_SetGenerationCopyWith<$Res> {
  __$$_SetGenerationCopyWithImpl(
      _$_SetGeneration _value, $Res Function(_$_SetGeneration) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generationId = null,
  }) {
    return _then(_$_SetGeneration(
      generationId: null == generationId
          ? _value.generationId
          : generationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SetGeneration implements _SetGeneration {
  const _$_SetGeneration({required this.generationId});

  @override
  final int generationId;

  @override
  String toString() {
    return 'AdManipulationEvent.setGeneration(generationId: $generationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetGeneration &&
            (identical(other.generationId, generationId) ||
                other.generationId == generationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, generationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetGenerationCopyWith<_$_SetGeneration> get copyWith =>
      __$$_SetGenerationCopyWithImpl<_$_SetGeneration>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int bodyTypeId) setBodyType,
    required TResult Function(int carModelId) setCarModel,
    required TResult Function(int driveTypeId) setDriveType,
    required TResult Function(int generationId) setGeneration,
    required TResult Function(int year) setYear,
  }) {
    return setGeneration(generationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int bodyTypeId)? setBodyType,
    TResult? Function(int carModelId)? setCarModel,
    TResult? Function(int driveTypeId)? setDriveType,
    TResult? Function(int generationId)? setGeneration,
    TResult? Function(int year)? setYear,
  }) {
    return setGeneration?.call(generationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int bodyTypeId)? setBodyType,
    TResult Function(int carModelId)? setCarModel,
    TResult Function(int driveTypeId)? setDriveType,
    TResult Function(int generationId)? setGeneration,
    TResult Function(int year)? setYear,
    required TResult orElse(),
  }) {
    if (setGeneration != null) {
      return setGeneration(generationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetBodyType value) setBodyType,
    required TResult Function(_SetCarModel value) setCarModel,
    required TResult Function(_SetDriveType value) setDriveType,
    required TResult Function(_SetGeneration value) setGeneration,
    required TResult Function(_SetYear value) setYear,
  }) {
    return setGeneration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetBodyType value)? setBodyType,
    TResult? Function(_SetCarModel value)? setCarModel,
    TResult? Function(_SetDriveType value)? setDriveType,
    TResult? Function(_SetGeneration value)? setGeneration,
    TResult? Function(_SetYear value)? setYear,
  }) {
    return setGeneration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetBodyType value)? setBodyType,
    TResult Function(_SetCarModel value)? setCarModel,
    TResult Function(_SetDriveType value)? setDriveType,
    TResult Function(_SetGeneration value)? setGeneration,
    TResult Function(_SetYear value)? setYear,
    required TResult orElse(),
  }) {
    if (setGeneration != null) {
      return setGeneration(this);
    }
    return orElse();
  }
}

abstract class _SetGeneration implements AdManipulationEvent {
  const factory _SetGeneration({required final int generationId}) =
      _$_SetGeneration;

  int get generationId;
  @JsonKey(ignore: true)
  _$$_SetGenerationCopyWith<_$_SetGeneration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetYearCopyWith<$Res> {
  factory _$$_SetYearCopyWith(
          _$_SetYear value, $Res Function(_$_SetYear) then) =
      __$$_SetYearCopyWithImpl<$Res>;
  @useResult
  $Res call({int year});
}

/// @nodoc
class __$$_SetYearCopyWithImpl<$Res>
    extends _$AdManipulationEventCopyWithImpl<$Res, _$_SetYear>
    implements _$$_SetYearCopyWith<$Res> {
  __$$_SetYearCopyWithImpl(_$_SetYear _value, $Res Function(_$_SetYear) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
  }) {
    return _then(_$_SetYear(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SetYear implements _SetYear {
  const _$_SetYear({required this.year});

  @override
  final int year;

  @override
  String toString() {
    return 'AdManipulationEvent.setYear(year: $year)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetYear &&
            (identical(other.year, year) || other.year == year));
  }

  @override
  int get hashCode => Object.hash(runtimeType, year);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetYearCopyWith<_$_SetYear> get copyWith =>
      __$$_SetYearCopyWithImpl<_$_SetYear>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int bodyTypeId) setBodyType,
    required TResult Function(int carModelId) setCarModel,
    required TResult Function(int driveTypeId) setDriveType,
    required TResult Function(int generationId) setGeneration,
    required TResult Function(int year) setYear,
  }) {
    return setYear(year);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int bodyTypeId)? setBodyType,
    TResult? Function(int carModelId)? setCarModel,
    TResult? Function(int driveTypeId)? setDriveType,
    TResult? Function(int generationId)? setGeneration,
    TResult? Function(int year)? setYear,
  }) {
    return setYear?.call(year);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int bodyTypeId)? setBodyType,
    TResult Function(int carModelId)? setCarModel,
    TResult Function(int driveTypeId)? setDriveType,
    TResult Function(int generationId)? setGeneration,
    TResult Function(int year)? setYear,
    required TResult orElse(),
  }) {
    if (setYear != null) {
      return setYear(year);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetBodyType value) setBodyType,
    required TResult Function(_SetCarModel value) setCarModel,
    required TResult Function(_SetDriveType value) setDriveType,
    required TResult Function(_SetGeneration value) setGeneration,
    required TResult Function(_SetYear value) setYear,
  }) {
    return setYear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetBodyType value)? setBodyType,
    TResult? Function(_SetCarModel value)? setCarModel,
    TResult? Function(_SetDriveType value)? setDriveType,
    TResult? Function(_SetGeneration value)? setGeneration,
    TResult? Function(_SetYear value)? setYear,
  }) {
    return setYear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetBodyType value)? setBodyType,
    TResult Function(_SetCarModel value)? setCarModel,
    TResult Function(_SetDriveType value)? setDriveType,
    TResult Function(_SetGeneration value)? setGeneration,
    TResult Function(_SetYear value)? setYear,
    required TResult orElse(),
  }) {
    if (setYear != null) {
      return setYear(this);
    }
    return orElse();
  }
}

abstract class _SetYear implements AdManipulationEvent {
  const factory _SetYear({required final int year}) = _$_SetYear;

  int get year;
  @JsonKey(ignore: true)
  _$$_SetYearCopyWith<_$_SetYear> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AdManipulationState {
  int get make => throw _privateConstructorUsedError;
  int get model => throw _privateConstructorUsedError;
  int get bodyType => throw _privateConstructorUsedError;
  int get generation => throw _privateConstructorUsedError;
  int get driveType => throw _privateConstructorUsedError;
  int get engineType => throw _privateConstructorUsedError;
  int get gearboxType => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  int get modificationType => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get licenceType => throw _privateConstructorUsedError;
  String get ownership => throw _privateConstructorUsedError;
  String get purchaseDate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isRegisteredLocally => throw _privateConstructorUsedError;
  String get contactName => throw _privateConstructorUsedError;
  String get contactEmail => throw _privateConstructorUsedError;
  String get contactPhone => throw _privateConstructorUsedError;
  String get contactAvailableFrom => throw _privateConstructorUsedError;
  String get contactAvailableTo => throw _privateConstructorUsedError;
  int get region => throw _privateConstructorUsedError;
  int get district => throw _privateConstructorUsedError;
  String get locationUrl => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  int get distanceTraveled => throw _privateConstructorUsedError;
  String get registrationVin => throw _privateConstructorUsedError;
  String get registrationPlate => throw _privateConstructorUsedError;
  String get registrationCertificate => throw _privateConstructorUsedError;
  String get registrationSerialNumber => throw _privateConstructorUsedError;
  dynamic get registeredInUzbekistan => throw _privateConstructorUsedError;
  dynamic get isNew => throw _privateConstructorUsedError;
  List<String> get gallery => throw _privateConstructorUsedError;
  List<DamagedPartsModel> get damagedParts =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdManipulationStateCopyWith<AdManipulationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdManipulationStateCopyWith<$Res> {
  factory $AdManipulationStateCopyWith(
          AdManipulationState value, $Res Function(AdManipulationState) then) =
      _$AdManipulationStateCopyWithImpl<$Res, AdManipulationState>;
  @useResult
  $Res call(
      {int make,
      int model,
      int bodyType,
      int generation,
      int driveType,
      int engineType,
      int gearboxType,
      int year,
      int modificationType,
      String color,
      String licenceType,
      String ownership,
      String purchaseDate,
      String description,
      bool isRegisteredLocally,
      String contactName,
      String contactEmail,
      String contactPhone,
      String contactAvailableFrom,
      String contactAvailableTo,
      int region,
      int district,
      String locationUrl,
      String price,
      String currency,
      int distanceTraveled,
      String registrationVin,
      String registrationPlate,
      String registrationCertificate,
      String registrationSerialNumber,
      dynamic registeredInUzbekistan,
      dynamic isNew,
      List<String> gallery,
      List<DamagedPartsModel> damagedParts});
}

/// @nodoc
class _$AdManipulationStateCopyWithImpl<$Res, $Val extends AdManipulationState>
    implements $AdManipulationStateCopyWith<$Res> {
  _$AdManipulationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? make = null,
    Object? model = null,
    Object? bodyType = null,
    Object? generation = null,
    Object? driveType = null,
    Object? engineType = null,
    Object? gearboxType = null,
    Object? year = null,
    Object? modificationType = null,
    Object? color = null,
    Object? licenceType = null,
    Object? ownership = null,
    Object? purchaseDate = null,
    Object? description = null,
    Object? isRegisteredLocally = null,
    Object? contactName = null,
    Object? contactEmail = null,
    Object? contactPhone = null,
    Object? contactAvailableFrom = null,
    Object? contactAvailableTo = null,
    Object? region = null,
    Object? district = null,
    Object? locationUrl = null,
    Object? price = null,
    Object? currency = null,
    Object? distanceTraveled = null,
    Object? registrationVin = null,
    Object? registrationPlate = null,
    Object? registrationCertificate = null,
    Object? registrationSerialNumber = null,
    Object? registeredInUzbekistan = freezed,
    Object? isNew = freezed,
    Object? gallery = null,
    Object? damagedParts = null,
  }) {
    return _then(_value.copyWith(
      make: null == make
          ? _value.make
          : make // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as int,
      bodyType: null == bodyType
          ? _value.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as int,
      generation: null == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as int,
      driveType: null == driveType
          ? _value.driveType
          : driveType // ignore: cast_nullable_to_non_nullable
              as int,
      engineType: null == engineType
          ? _value.engineType
          : engineType // ignore: cast_nullable_to_non_nullable
              as int,
      gearboxType: null == gearboxType
          ? _value.gearboxType
          : gearboxType // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      modificationType: null == modificationType
          ? _value.modificationType
          : modificationType // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      licenceType: null == licenceType
          ? _value.licenceType
          : licenceType // ignore: cast_nullable_to_non_nullable
              as String,
      ownership: null == ownership
          ? _value.ownership
          : ownership // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isRegisteredLocally: null == isRegisteredLocally
          ? _value.isRegisteredLocally
          : isRegisteredLocally // ignore: cast_nullable_to_non_nullable
              as bool,
      contactName: null == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String,
      contactEmail: null == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String,
      contactPhone: null == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String,
      contactAvailableFrom: null == contactAvailableFrom
          ? _value.contactAvailableFrom
          : contactAvailableFrom // ignore: cast_nullable_to_non_nullable
              as String,
      contactAvailableTo: null == contactAvailableTo
          ? _value.contactAvailableTo
          : contactAvailableTo // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as int,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as int,
      locationUrl: null == locationUrl
          ? _value.locationUrl
          : locationUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      distanceTraveled: null == distanceTraveled
          ? _value.distanceTraveled
          : distanceTraveled // ignore: cast_nullable_to_non_nullable
              as int,
      registrationVin: null == registrationVin
          ? _value.registrationVin
          : registrationVin // ignore: cast_nullable_to_non_nullable
              as String,
      registrationPlate: null == registrationPlate
          ? _value.registrationPlate
          : registrationPlate // ignore: cast_nullable_to_non_nullable
              as String,
      registrationCertificate: null == registrationCertificate
          ? _value.registrationCertificate
          : registrationCertificate // ignore: cast_nullable_to_non_nullable
              as String,
      registrationSerialNumber: null == registrationSerialNumber
          ? _value.registrationSerialNumber
          : registrationSerialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      registeredInUzbekistan: freezed == registeredInUzbekistan
          ? _value.registeredInUzbekistan
          : registeredInUzbekistan // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isNew: freezed == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gallery: null == gallery
          ? _value.gallery
          : gallery // ignore: cast_nullable_to_non_nullable
              as List<String>,
      damagedParts: null == damagedParts
          ? _value.damagedParts
          : damagedParts // ignore: cast_nullable_to_non_nullable
              as List<DamagedPartsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArticleSingleStateCopyWith<$Res>
    implements $AdManipulationStateCopyWith<$Res> {
  factory _$$_ArticleSingleStateCopyWith(_$_ArticleSingleState value,
          $Res Function(_$_ArticleSingleState) then) =
      __$$_ArticleSingleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int make,
      int model,
      int bodyType,
      int generation,
      int driveType,
      int engineType,
      int gearboxType,
      int year,
      int modificationType,
      String color,
      String licenceType,
      String ownership,
      String purchaseDate,
      String description,
      bool isRegisteredLocally,
      String contactName,
      String contactEmail,
      String contactPhone,
      String contactAvailableFrom,
      String contactAvailableTo,
      int region,
      int district,
      String locationUrl,
      String price,
      String currency,
      int distanceTraveled,
      String registrationVin,
      String registrationPlate,
      String registrationCertificate,
      String registrationSerialNumber,
      dynamic registeredInUzbekistan,
      dynamic isNew,
      List<String> gallery,
      List<DamagedPartsModel> damagedParts});
}

/// @nodoc
class __$$_ArticleSingleStateCopyWithImpl<$Res>
    extends _$AdManipulationStateCopyWithImpl<$Res, _$_ArticleSingleState>
    implements _$$_ArticleSingleStateCopyWith<$Res> {
  __$$_ArticleSingleStateCopyWithImpl(
      _$_ArticleSingleState _value, $Res Function(_$_ArticleSingleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? make = null,
    Object? model = null,
    Object? bodyType = null,
    Object? generation = null,
    Object? driveType = null,
    Object? engineType = null,
    Object? gearboxType = null,
    Object? year = null,
    Object? modificationType = null,
    Object? color = null,
    Object? licenceType = null,
    Object? ownership = null,
    Object? purchaseDate = null,
    Object? description = null,
    Object? isRegisteredLocally = null,
    Object? contactName = null,
    Object? contactEmail = null,
    Object? contactPhone = null,
    Object? contactAvailableFrom = null,
    Object? contactAvailableTo = null,
    Object? region = null,
    Object? district = null,
    Object? locationUrl = null,
    Object? price = null,
    Object? currency = null,
    Object? distanceTraveled = null,
    Object? registrationVin = null,
    Object? registrationPlate = null,
    Object? registrationCertificate = null,
    Object? registrationSerialNumber = null,
    Object? registeredInUzbekistan = freezed,
    Object? isNew = freezed,
    Object? gallery = null,
    Object? damagedParts = null,
  }) {
    return _then(_$_ArticleSingleState(
      make: null == make
          ? _value.make
          : make // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as int,
      bodyType: null == bodyType
          ? _value.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as int,
      generation: null == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as int,
      driveType: null == driveType
          ? _value.driveType
          : driveType // ignore: cast_nullable_to_non_nullable
              as int,
      engineType: null == engineType
          ? _value.engineType
          : engineType // ignore: cast_nullable_to_non_nullable
              as int,
      gearboxType: null == gearboxType
          ? _value.gearboxType
          : gearboxType // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      modificationType: null == modificationType
          ? _value.modificationType
          : modificationType // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      licenceType: null == licenceType
          ? _value.licenceType
          : licenceType // ignore: cast_nullable_to_non_nullable
              as String,
      ownership: null == ownership
          ? _value.ownership
          : ownership // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isRegisteredLocally: null == isRegisteredLocally
          ? _value.isRegisteredLocally
          : isRegisteredLocally // ignore: cast_nullable_to_non_nullable
              as bool,
      contactName: null == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String,
      contactEmail: null == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String,
      contactPhone: null == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String,
      contactAvailableFrom: null == contactAvailableFrom
          ? _value.contactAvailableFrom
          : contactAvailableFrom // ignore: cast_nullable_to_non_nullable
              as String,
      contactAvailableTo: null == contactAvailableTo
          ? _value.contactAvailableTo
          : contactAvailableTo // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as int,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as int,
      locationUrl: null == locationUrl
          ? _value.locationUrl
          : locationUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      distanceTraveled: null == distanceTraveled
          ? _value.distanceTraveled
          : distanceTraveled // ignore: cast_nullable_to_non_nullable
              as int,
      registrationVin: null == registrationVin
          ? _value.registrationVin
          : registrationVin // ignore: cast_nullable_to_non_nullable
              as String,
      registrationPlate: null == registrationPlate
          ? _value.registrationPlate
          : registrationPlate // ignore: cast_nullable_to_non_nullable
              as String,
      registrationCertificate: null == registrationCertificate
          ? _value.registrationCertificate
          : registrationCertificate // ignore: cast_nullable_to_non_nullable
              as String,
      registrationSerialNumber: null == registrationSerialNumber
          ? _value.registrationSerialNumber
          : registrationSerialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      registeredInUzbekistan: freezed == registeredInUzbekistan
          ? _value.registeredInUzbekistan!
          : registeredInUzbekistan,
      isNew: freezed == isNew ? _value.isNew! : isNew,
      gallery: null == gallery
          ? _value._gallery
          : gallery // ignore: cast_nullable_to_non_nullable
              as List<String>,
      damagedParts: null == damagedParts
          ? _value._damagedParts
          : damagedParts // ignore: cast_nullable_to_non_nullable
              as List<DamagedPartsModel>,
    ));
  }
}

/// @nodoc

class _$_ArticleSingleState implements _ArticleSingleState {
  _$_ArticleSingleState(
      {this.make = 0,
      this.model = 0,
      this.bodyType = 0,
      this.generation = 0,
      this.driveType = 0,
      this.engineType = 0,
      this.gearboxType = 0,
      this.year = 0,
      this.modificationType = 0,
      this.color = '',
      this.licenceType = '',
      this.ownership = '',
      this.purchaseDate = '',
      this.description = '',
      this.isRegisteredLocally = false,
      this.contactName = '',
      this.contactEmail = '',
      this.contactPhone = '',
      this.contactAvailableFrom = '',
      this.contactAvailableTo = '',
      this.region = 0,
      this.district = 0,
      this.locationUrl = '',
      this.price = '',
      this.currency = '',
      this.distanceTraveled = 0,
      this.registrationVin = '',
      this.registrationPlate = '',
      this.registrationCertificate = '',
      this.registrationSerialNumber = '',
      this.registeredInUzbekistan = false,
      this.isNew = false,
      final List<String> gallery = const [],
      final List<DamagedPartsModel> damagedParts = const []})
      : _gallery = gallery,
        _damagedParts = damagedParts;

  @override
  @JsonKey()
  final int make;
  @override
  @JsonKey()
  final int model;
  @override
  @JsonKey()
  final int bodyType;
  @override
  @JsonKey()
  final int generation;
  @override
  @JsonKey()
  final int driveType;
  @override
  @JsonKey()
  final int engineType;
  @override
  @JsonKey()
  final int gearboxType;
  @override
  @JsonKey()
  final int year;
  @override
  @JsonKey()
  final int modificationType;
  @override
  @JsonKey()
  final String color;
  @override
  @JsonKey()
  final String licenceType;
  @override
  @JsonKey()
  final String ownership;
  @override
  @JsonKey()
  final String purchaseDate;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final bool isRegisteredLocally;
  @override
  @JsonKey()
  final String contactName;
  @override
  @JsonKey()
  final String contactEmail;
  @override
  @JsonKey()
  final String contactPhone;
  @override
  @JsonKey()
  final String contactAvailableFrom;
  @override
  @JsonKey()
  final String contactAvailableTo;
  @override
  @JsonKey()
  final int region;
  @override
  @JsonKey()
  final int district;
  @override
  @JsonKey()
  final String locationUrl;
  @override
  @JsonKey()
  final String price;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final int distanceTraveled;
  @override
  @JsonKey()
  final String registrationVin;
  @override
  @JsonKey()
  final String registrationPlate;
  @override
  @JsonKey()
  final String registrationCertificate;
  @override
  @JsonKey()
  final String registrationSerialNumber;
  @override
  @JsonKey()
  final dynamic registeredInUzbekistan;
  @override
  @JsonKey()
  final dynamic isNew;
  final List<String> _gallery;
  @override
  @JsonKey()
  List<String> get gallery {
    if (_gallery is EqualUnmodifiableListView) return _gallery;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gallery);
  }

  final List<DamagedPartsModel> _damagedParts;
  @override
  @JsonKey()
  List<DamagedPartsModel> get damagedParts {
    if (_damagedParts is EqualUnmodifiableListView) return _damagedParts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_damagedParts);
  }

  @override
  String toString() {
    return 'AdManipulationState(make: $make, model: $model, bodyType: $bodyType, generation: $generation, driveType: $driveType, engineType: $engineType, gearboxType: $gearboxType, year: $year, modificationType: $modificationType, color: $color, licenceType: $licenceType, ownership: $ownership, purchaseDate: $purchaseDate, description: $description, isRegisteredLocally: $isRegisteredLocally, contactName: $contactName, contactEmail: $contactEmail, contactPhone: $contactPhone, contactAvailableFrom: $contactAvailableFrom, contactAvailableTo: $contactAvailableTo, region: $region, district: $district, locationUrl: $locationUrl, price: $price, currency: $currency, distanceTraveled: $distanceTraveled, registrationVin: $registrationVin, registrationPlate: $registrationPlate, registrationCertificate: $registrationCertificate, registrationSerialNumber: $registrationSerialNumber, registeredInUzbekistan: $registeredInUzbekistan, isNew: $isNew, gallery: $gallery, damagedParts: $damagedParts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleSingleState &&
            (identical(other.make, make) || other.make == make) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.bodyType, bodyType) ||
                other.bodyType == bodyType) &&
            (identical(other.generation, generation) ||
                other.generation == generation) &&
            (identical(other.driveType, driveType) ||
                other.driveType == driveType) &&
            (identical(other.engineType, engineType) ||
                other.engineType == engineType) &&
            (identical(other.gearboxType, gearboxType) ||
                other.gearboxType == gearboxType) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.modificationType, modificationType) ||
                other.modificationType == modificationType) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.licenceType, licenceType) ||
                other.licenceType == licenceType) &&
            (identical(other.ownership, ownership) ||
                other.ownership == ownership) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isRegisteredLocally, isRegisteredLocally) ||
                other.isRegisteredLocally == isRegisteredLocally) &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.contactAvailableFrom, contactAvailableFrom) ||
                other.contactAvailableFrom == contactAvailableFrom) &&
            (identical(other.contactAvailableTo, contactAvailableTo) ||
                other.contactAvailableTo == contactAvailableTo) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.locationUrl, locationUrl) ||
                other.locationUrl == locationUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.distanceTraveled, distanceTraveled) ||
                other.distanceTraveled == distanceTraveled) &&
            (identical(other.registrationVin, registrationVin) ||
                other.registrationVin == registrationVin) &&
            (identical(other.registrationPlate, registrationPlate) ||
                other.registrationPlate == registrationPlate) &&
            (identical(
                    other.registrationCertificate, registrationCertificate) ||
                other.registrationCertificate == registrationCertificate) &&
            (identical(
                    other.registrationSerialNumber, registrationSerialNumber) ||
                other.registrationSerialNumber == registrationSerialNumber) &&
            const DeepCollectionEquality()
                .equals(other.registeredInUzbekistan, registeredInUzbekistan) &&
            const DeepCollectionEquality().equals(other.isNew, isNew) &&
            const DeepCollectionEquality().equals(other._gallery, _gallery) &&
            const DeepCollectionEquality()
                .equals(other._damagedParts, _damagedParts));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        make,
        model,
        bodyType,
        generation,
        driveType,
        engineType,
        gearboxType,
        year,
        modificationType,
        color,
        licenceType,
        ownership,
        purchaseDate,
        description,
        isRegisteredLocally,
        contactName,
        contactEmail,
        contactPhone,
        contactAvailableFrom,
        contactAvailableTo,
        region,
        district,
        locationUrl,
        price,
        currency,
        distanceTraveled,
        registrationVin,
        registrationPlate,
        registrationCertificate,
        registrationSerialNumber,
        const DeepCollectionEquality().hash(registeredInUzbekistan),
        const DeepCollectionEquality().hash(isNew),
        const DeepCollectionEquality().hash(_gallery),
        const DeepCollectionEquality().hash(_damagedParts)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleSingleStateCopyWith<_$_ArticleSingleState> get copyWith =>
      __$$_ArticleSingleStateCopyWithImpl<_$_ArticleSingleState>(
          this, _$identity);
}

abstract class _ArticleSingleState implements AdManipulationState {
  factory _ArticleSingleState(
      {final int make,
      final int model,
      final int bodyType,
      final int generation,
      final int driveType,
      final int engineType,
      final int gearboxType,
      final int year,
      final int modificationType,
      final String color,
      final String licenceType,
      final String ownership,
      final String purchaseDate,
      final String description,
      final bool isRegisteredLocally,
      final String contactName,
      final String contactEmail,
      final String contactPhone,
      final String contactAvailableFrom,
      final String contactAvailableTo,
      final int region,
      final int district,
      final String locationUrl,
      final String price,
      final String currency,
      final int distanceTraveled,
      final String registrationVin,
      final String registrationPlate,
      final String registrationCertificate,
      final String registrationSerialNumber,
      final dynamic registeredInUzbekistan,
      final dynamic isNew,
      final List<String> gallery,
      final List<DamagedPartsModel> damagedParts}) = _$_ArticleSingleState;

  @override
  int get make;
  @override
  int get model;
  @override
  int get bodyType;
  @override
  int get generation;
  @override
  int get driveType;
  @override
  int get engineType;
  @override
  int get gearboxType;
  @override
  int get year;
  @override
  int get modificationType;
  @override
  String get color;
  @override
  String get licenceType;
  @override
  String get ownership;
  @override
  String get purchaseDate;
  @override
  String get description;
  @override
  bool get isRegisteredLocally;
  @override
  String get contactName;
  @override
  String get contactEmail;
  @override
  String get contactPhone;
  @override
  String get contactAvailableFrom;
  @override
  String get contactAvailableTo;
  @override
  int get region;
  @override
  int get district;
  @override
  String get locationUrl;
  @override
  String get price;
  @override
  String get currency;
  @override
  int get distanceTraveled;
  @override
  String get registrationVin;
  @override
  String get registrationPlate;
  @override
  String get registrationCertificate;
  @override
  String get registrationSerialNumber;
  @override
  dynamic get registeredInUzbekistan;
  @override
  dynamic get isNew;
  @override
  List<String> get gallery;
  @override
  List<DamagedPartsModel> get damagedParts;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleSingleStateCopyWith<_$_ArticleSingleState> get copyWith =>
      throw _privateConstructorUsedError;
}
