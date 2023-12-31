// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'regions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegionsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getRegions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getRegions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getRegions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetRegions value) getRegions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetRegions value)? getRegions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetRegions value)? getRegions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionsEventCopyWith<$Res> {
  factory $RegionsEventCopyWith(
          RegionsEvent value, $Res Function(RegionsEvent) then) =
      _$RegionsEventCopyWithImpl<$Res, RegionsEvent>;
}

/// @nodoc
class _$RegionsEventCopyWithImpl<$Res, $Val extends RegionsEvent>
    implements $RegionsEventCopyWith<$Res> {
  _$RegionsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetRegionsCopyWith<$Res> {
  factory _$$_GetRegionsCopyWith(
          _$_GetRegions value, $Res Function(_$_GetRegions) then) =
      __$$_GetRegionsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetRegionsCopyWithImpl<$Res>
    extends _$RegionsEventCopyWithImpl<$Res, _$_GetRegions>
    implements _$$_GetRegionsCopyWith<$Res> {
  __$$_GetRegionsCopyWithImpl(
      _$_GetRegions _value, $Res Function(_$_GetRegions) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetRegions implements _GetRegions {
  _$_GetRegions();

  @override
  String toString() {
    return 'RegionsEvent.getRegions()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetRegions);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getRegions,
  }) {
    return getRegions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getRegions,
  }) {
    return getRegions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getRegions,
    required TResult orElse(),
  }) {
    if (getRegions != null) {
      return getRegions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetRegions value) getRegions,
  }) {
    return getRegions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetRegions value)? getRegions,
  }) {
    return getRegions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetRegions value)? getRegions,
    required TResult orElse(),
  }) {
    if (getRegions != null) {
      return getRegions(this);
    }
    return orElse();
  }
}

abstract class _GetRegions implements RegionsEvent {
  factory _GetRegions() = _$_GetRegions;
}

/// @nodoc
mixin _$RegionsState {
  FormzStatus get status => throw _privateConstructorUsedError;
  List<RegionEntity> get regions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegionsStateCopyWith<RegionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionsStateCopyWith<$Res> {
  factory $RegionsStateCopyWith(
          RegionsState value, $Res Function(RegionsState) then) =
      _$RegionsStateCopyWithImpl<$Res, RegionsState>;
  @useResult
  $Res call({FormzStatus status, List<RegionEntity> regions});
}

/// @nodoc
class _$RegionsStateCopyWithImpl<$Res, $Val extends RegionsState>
    implements $RegionsStateCopyWith<$Res> {
  _$RegionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? regions = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      regions: null == regions
          ? _value.regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<RegionEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegionsStateCopyWith<$Res>
    implements $RegionsStateCopyWith<$Res> {
  factory _$$_RegionsStateCopyWith(
          _$_RegionsState value, $Res Function(_$_RegionsState) then) =
      __$$_RegionsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormzStatus status, List<RegionEntity> regions});
}

/// @nodoc
class __$$_RegionsStateCopyWithImpl<$Res>
    extends _$RegionsStateCopyWithImpl<$Res, _$_RegionsState>
    implements _$$_RegionsStateCopyWith<$Res> {
  __$$_RegionsStateCopyWithImpl(
      _$_RegionsState _value, $Res Function(_$_RegionsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? regions = null,
  }) {
    return _then(_$_RegionsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      regions: null == regions
          ? _value._regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<RegionEntity>,
    ));
  }
}

/// @nodoc

class _$_RegionsState implements _RegionsState {
  _$_RegionsState(
      {this.status = FormzStatus.pure,
      final List<RegionEntity> regions = const []})
      : _regions = regions;

  @override
  @JsonKey()
  final FormzStatus status;
  final List<RegionEntity> _regions;
  @override
  @JsonKey()
  List<RegionEntity> get regions {
    if (_regions is EqualUnmodifiableListView) return _regions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regions);
  }

  @override
  String toString() {
    return 'RegionsState(status: $status, regions: $regions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegionsState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._regions, _regions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_regions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegionsStateCopyWith<_$_RegionsState> get copyWith =>
      __$$_RegionsStateCopyWithImpl<_$_RegionsState>(this, _$identity);
}

abstract class _RegionsState implements RegionsState {
  factory _RegionsState(
      {final FormzStatus status,
      final List<RegionEntity> regions}) = _$_RegionsState;

  @override
  FormzStatus get status;
  @override
  List<RegionEntity> get regions;
  @override
  @JsonKey(ignore: true)
  _$$_RegionsStateCopyWith<_$_RegionsState> get copyWith =>
      throw _privateConstructorUsedError;
}
