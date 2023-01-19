// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_organization_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapOrganizationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double? latitude, double? longitude, double? radius)
        getDealers,
    required TResult Function(int radius) changeRadius,
    required TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult? Function(int radius)? changeRadius,
    TResult? Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult Function(int radius)? changeRadius,
    TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDealers value) getDealers,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDealers value)? getDealers,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDealers value)? getDealers,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapOrganizationEventCopyWith<$Res> {
  factory $MapOrganizationEventCopyWith(MapOrganizationEvent value,
          $Res Function(MapOrganizationEvent) then) =
      _$MapOrganizationEventCopyWithImpl<$Res, MapOrganizationEvent>;
}

/// @nodoc
class _$MapOrganizationEventCopyWithImpl<$Res,
        $Val extends MapOrganizationEvent>
    implements $MapOrganizationEventCopyWith<$Res> {
  _$MapOrganizationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetDealersCopyWith<$Res> {
  factory _$$_GetDealersCopyWith(
          _$_GetDealers value, $Res Function(_$_GetDealers) then) =
      __$$_GetDealersCopyWithImpl<$Res>;
  @useResult
  $Res call({double? latitude, double? longitude, double? radius});
}

/// @nodoc
class __$$_GetDealersCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_GetDealers>
    implements _$$_GetDealersCopyWith<$Res> {
  __$$_GetDealersCopyWithImpl(
      _$_GetDealers _value, $Res Function(_$_GetDealers) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? radius = freezed,
  }) {
    return _then(_$_GetDealers(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_GetDealers implements _GetDealers {
  _$_GetDealers({this.latitude, this.longitude, this.radius});

  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final double? radius;

  @override
  String toString() {
    return 'MapOrganizationEvent.getDealers(latitude: $latitude, longitude: $longitude, radius: $radius)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetDealers &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, radius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetDealersCopyWith<_$_GetDealers> get copyWith =>
      __$$_GetDealersCopyWithImpl<_$_GetDealers>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double? latitude, double? longitude, double? radius)
        getDealers,
    required TResult Function(int radius) changeRadius,
    required TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) {
    return getDealers(latitude, longitude, radius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult? Function(int radius)? changeRadius,
    TResult? Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) {
    return getDealers?.call(latitude, longitude, radius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult Function(int radius)? changeRadius,
    TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    required TResult orElse(),
  }) {
    if (getDealers != null) {
      return getDealers(latitude, longitude, radius);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDealers value) getDealers,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) {
    return getDealers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDealers value)? getDealers,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) {
    return getDealers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDealers value)? getDealers,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    required TResult orElse(),
  }) {
    if (getDealers != null) {
      return getDealers(this);
    }
    return orElse();
  }
}

abstract class _GetDealers implements MapOrganizationEvent {
  factory _GetDealers(
      {final double? latitude,
      final double? longitude,
      final double? radius}) = _$_GetDealers;

  double? get latitude;
  double? get longitude;
  double? get radius;
  @JsonKey(ignore: true)
  _$$_GetDealersCopyWith<_$_GetDealers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeRadiusCopyWith<$Res> {
  factory _$$_ChangeRadiusCopyWith(
          _$_ChangeRadius value, $Res Function(_$_ChangeRadius) then) =
      __$$_ChangeRadiusCopyWithImpl<$Res>;
  @useResult
  $Res call({int radius});
}

/// @nodoc
class __$$_ChangeRadiusCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_ChangeRadius>
    implements _$$_ChangeRadiusCopyWith<$Res> {
  __$$_ChangeRadiusCopyWithImpl(
      _$_ChangeRadius _value, $Res Function(_$_ChangeRadius) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? radius = null,
  }) {
    return _then(_$_ChangeRadius(
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChangeRadius implements _ChangeRadius {
  _$_ChangeRadius({required this.radius});

  @override
  final int radius;

  @override
  String toString() {
    return 'MapOrganizationEvent.changeRadius(radius: $radius)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeRadius &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @override
  int get hashCode => Object.hash(runtimeType, radius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeRadiusCopyWith<_$_ChangeRadius> get copyWith =>
      __$$_ChangeRadiusCopyWithImpl<_$_ChangeRadius>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double? latitude, double? longitude, double? radius)
        getDealers,
    required TResult Function(int radius) changeRadius,
    required TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) {
    return changeRadius(radius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult? Function(int radius)? changeRadius,
    TResult? Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) {
    return changeRadius?.call(radius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult Function(int radius)? changeRadius,
    TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    required TResult orElse(),
  }) {
    if (changeRadius != null) {
      return changeRadius(radius);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDealers value) getDealers,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) {
    return changeRadius(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDealers value)? getDealers,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) {
    return changeRadius?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDealers value)? getDealers,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    required TResult orElse(),
  }) {
    if (changeRadius != null) {
      return changeRadius(this);
    }
    return orElse();
  }
}

abstract class _ChangeRadius implements MapOrganizationEvent {
  factory _ChangeRadius({required final int radius}) = _$_ChangeRadius;

  int get radius;
  @JsonKey(ignore: true)
  _$$_ChangeRadiusCopyWith<_$_ChangeRadius> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetCurrentLocationCopyWith<$Res> {
  factory _$$_GetCurrentLocationCopyWith(_$_GetCurrentLocation value,
          $Res Function(_$_GetCurrentLocation) then) =
      __$$_GetCurrentLocationCopyWithImpl<$Res>;
  @useResult
  $Res call({ValueChanged<String> onError, ValueChanged<Position> onSuccess});
}

/// @nodoc
class __$$_GetCurrentLocationCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_GetCurrentLocation>
    implements _$$_GetCurrentLocationCopyWith<$Res> {
  __$$_GetCurrentLocationCopyWithImpl(
      _$_GetCurrentLocation _value, $Res Function(_$_GetCurrentLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onError = null,
    Object? onSuccess = null,
  }) {
    return _then(_$_GetCurrentLocation(
      onError: null == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as ValueChanged<String>,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as ValueChanged<Position>,
    ));
  }
}

/// @nodoc

class _$_GetCurrentLocation implements _GetCurrentLocation {
  _$_GetCurrentLocation({required this.onError, required this.onSuccess});

  @override
  final ValueChanged<String> onError;
  @override
  final ValueChanged<Position> onSuccess;

  @override
  String toString() {
    return 'MapOrganizationEvent.getCurrentLocation(onError: $onError, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetCurrentLocation &&
            (identical(other.onError, onError) || other.onError == onError) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onError, onSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetCurrentLocationCopyWith<_$_GetCurrentLocation> get copyWith =>
      __$$_GetCurrentLocationCopyWithImpl<_$_GetCurrentLocation>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double? latitude, double? longitude, double? radius)
        getDealers,
    required TResult Function(int radius) changeRadius,
    required TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) {
    return getCurrentLocation(onError, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult? Function(int radius)? changeRadius,
    TResult? Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) {
    return getCurrentLocation?.call(onError, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult Function(int radius)? changeRadius,
    TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    required TResult orElse(),
  }) {
    if (getCurrentLocation != null) {
      return getCurrentLocation(onError, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDealers value) getDealers,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) {
    return getCurrentLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDealers value)? getDealers,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) {
    return getCurrentLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDealers value)? getDealers,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    required TResult orElse(),
  }) {
    if (getCurrentLocation != null) {
      return getCurrentLocation(this);
    }
    return orElse();
  }
}

abstract class _GetCurrentLocation implements MapOrganizationEvent {
  factory _GetCurrentLocation(
      {required final ValueChanged<String> onError,
      required final ValueChanged<Position> onSuccess}) = _$_GetCurrentLocation;

  ValueChanged<String> get onError;
  ValueChanged<Position> get onSuccess;
  @JsonKey(ignore: true)
  _$$_GetCurrentLocationCopyWith<_$_GetCurrentLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeLatLongCopyWith<$Res> {
  factory _$$_ChangeLatLongCopyWith(
          _$_ChangeLatLong value, $Res Function(_$_ChangeLatLong) then) =
      __$$_ChangeLatLongCopyWithImpl<$Res>;
  @useResult
  $Res call({double lat, double long, int? radius});
}

/// @nodoc
class __$$_ChangeLatLongCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_ChangeLatLong>
    implements _$$_ChangeLatLongCopyWith<$Res> {
  __$$_ChangeLatLongCopyWithImpl(
      _$_ChangeLatLong _value, $Res Function(_$_ChangeLatLong) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? long = null,
    Object? radius = freezed,
  }) {
    return _then(_$_ChangeLatLong(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_ChangeLatLong implements _ChangeLatLong {
  _$_ChangeLatLong({required this.lat, required this.long, this.radius});

  @override
  final double lat;
  @override
  final double long;
  @override
  final int? radius;

  @override
  String toString() {
    return 'MapOrganizationEvent.changeLatLong(lat: $lat, long: $long, radius: $radius)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeLatLong &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, long, radius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeLatLongCopyWith<_$_ChangeLatLong> get copyWith =>
      __$$_ChangeLatLongCopyWithImpl<_$_ChangeLatLong>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double? latitude, double? longitude, double? radius)
        getDealers,
    required TResult Function(int radius) changeRadius,
    required TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) {
    return changeLatLong(lat, long, radius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult? Function(int radius)? changeRadius,
    TResult? Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) {
    return changeLatLong?.call(lat, long, radius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult Function(int radius)? changeRadius,
    TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    required TResult orElse(),
  }) {
    if (changeLatLong != null) {
      return changeLatLong(lat, long, radius);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDealers value) getDealers,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) {
    return changeLatLong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDealers value)? getDealers,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) {
    return changeLatLong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDealers value)? getDealers,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    required TResult orElse(),
  }) {
    if (changeLatLong != null) {
      return changeLatLong(this);
    }
    return orElse();
  }
}

abstract class _ChangeLatLong implements MapOrganizationEvent {
  factory _ChangeLatLong(
      {required final double lat,
      required final double long,
      final int? radius}) = _$_ChangeLatLong;

  double get lat;
  double get long;
  int? get radius;
  @JsonKey(ignore: true)
  _$$_ChangeLatLongCopyWith<_$_ChangeLatLong> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MapOrganizationState {
  List<MapModel> get dealers => throw _privateConstructorUsedError;
  int get radius => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  FormzStatus get getCurrentLocationStatus =>
      throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get long => throw _privateConstructorUsedError;
  double get currentLat => throw _privateConstructorUsedError;
  double get currentLong => throw _privateConstructorUsedError;
  String get searchText => throw _privateConstructorUsedError;
  bool get fetchMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapOrganizationStateCopyWith<MapOrganizationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapOrganizationStateCopyWith<$Res> {
  factory $MapOrganizationStateCopyWith(MapOrganizationState value,
          $Res Function(MapOrganizationState) then) =
      _$MapOrganizationStateCopyWithImpl<$Res, MapOrganizationState>;
  @useResult
  $Res call(
      {List<MapModel> dealers,
      int radius,
      FormzStatus status,
      FormzStatus getCurrentLocationStatus,
      double lat,
      double long,
      double currentLat,
      double currentLong,
      String searchText,
      bool fetchMore});
}

/// @nodoc
class _$MapOrganizationStateCopyWithImpl<$Res,
        $Val extends MapOrganizationState>
    implements $MapOrganizationStateCopyWith<$Res> {
  _$MapOrganizationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dealers = null,
    Object? radius = null,
    Object? status = null,
    Object? getCurrentLocationStatus = null,
    Object? lat = null,
    Object? long = null,
    Object? currentLat = null,
    Object? currentLong = null,
    Object? searchText = null,
    Object? fetchMore = null,
  }) {
    return _then(_value.copyWith(
      dealers: null == dealers
          ? _value.dealers
          : dealers // ignore: cast_nullable_to_non_nullable
              as List<MapModel>,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      getCurrentLocationStatus: null == getCurrentLocationStatus
          ? _value.getCurrentLocationStatus
          : getCurrentLocationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      currentLat: null == currentLat
          ? _value.currentLat
          : currentLat // ignore: cast_nullable_to_non_nullable
              as double,
      currentLong: null == currentLong
          ? _value.currentLong
          : currentLong // ignore: cast_nullable_to_non_nullable
              as double,
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      fetchMore: null == fetchMore
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MapOrganizationStateCopyWith<$Res>
    implements $MapOrganizationStateCopyWith<$Res> {
  factory _$$_MapOrganizationStateCopyWith(_$_MapOrganizationState value,
          $Res Function(_$_MapOrganizationState) then) =
      __$$_MapOrganizationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MapModel> dealers,
      int radius,
      FormzStatus status,
      FormzStatus getCurrentLocationStatus,
      double lat,
      double long,
      double currentLat,
      double currentLong,
      String searchText,
      bool fetchMore});
}

/// @nodoc
class __$$_MapOrganizationStateCopyWithImpl<$Res>
    extends _$MapOrganizationStateCopyWithImpl<$Res, _$_MapOrganizationState>
    implements _$$_MapOrganizationStateCopyWith<$Res> {
  __$$_MapOrganizationStateCopyWithImpl(_$_MapOrganizationState _value,
      $Res Function(_$_MapOrganizationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dealers = null,
    Object? radius = null,
    Object? status = null,
    Object? getCurrentLocationStatus = null,
    Object? lat = null,
    Object? long = null,
    Object? currentLat = null,
    Object? currentLong = null,
    Object? searchText = null,
    Object? fetchMore = null,
  }) {
    return _then(_$_MapOrganizationState(
      dealers: null == dealers
          ? _value._dealers
          : dealers // ignore: cast_nullable_to_non_nullable
              as List<MapModel>,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      getCurrentLocationStatus: null == getCurrentLocationStatus
          ? _value.getCurrentLocationStatus
          : getCurrentLocationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      currentLat: null == currentLat
          ? _value.currentLat
          : currentLat // ignore: cast_nullable_to_non_nullable
              as double,
      currentLong: null == currentLong
          ? _value.currentLong
          : currentLong // ignore: cast_nullable_to_non_nullable
              as double,
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      fetchMore: null == fetchMore
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MapOrganizationState implements _MapOrganizationState {
  _$_MapOrganizationState(
      {final List<MapModel> dealers = const [],
      this.radius = 0,
      this.status = FormzStatus.pure,
      this.getCurrentLocationStatus = FormzStatus.pure,
      this.lat = 0,
      this.long = 0,
      this.currentLat = 0,
      this.currentLong = 0,
      this.searchText = '',
      this.fetchMore = false})
      : _dealers = dealers;

  final List<MapModel> _dealers;
  @override
  @JsonKey()
  List<MapModel> get dealers {
    if (_dealers is EqualUnmodifiableListView) return _dealers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dealers);
  }

  @override
  @JsonKey()
  final int radius;
  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final FormzStatus getCurrentLocationStatus;
  @override
  @JsonKey()
  final double lat;
  @override
  @JsonKey()
  final double long;
  @override
  @JsonKey()
  final double currentLat;
  @override
  @JsonKey()
  final double currentLong;
  @override
  @JsonKey()
  final String searchText;
  @override
  @JsonKey()
  final bool fetchMore;

  @override
  String toString() {
    return 'MapOrganizationState(dealers: $dealers, radius: $radius, status: $status, getCurrentLocationStatus: $getCurrentLocationStatus, lat: $lat, long: $long, currentLat: $currentLat, currentLong: $currentLong, searchText: $searchText, fetchMore: $fetchMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapOrganizationState &&
            const DeepCollectionEquality().equals(other._dealers, _dealers) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(
                    other.getCurrentLocationStatus, getCurrentLocationStatus) ||
                other.getCurrentLocationStatus == getCurrentLocationStatus) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.currentLat, currentLat) ||
                other.currentLat == currentLat) &&
            (identical(other.currentLong, currentLong) ||
                other.currentLong == currentLong) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.fetchMore, fetchMore) ||
                other.fetchMore == fetchMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_dealers),
      radius,
      status,
      getCurrentLocationStatus,
      lat,
      long,
      currentLat,
      currentLong,
      searchText,
      fetchMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapOrganizationStateCopyWith<_$_MapOrganizationState> get copyWith =>
      __$$_MapOrganizationStateCopyWithImpl<_$_MapOrganizationState>(
          this, _$identity);
}

abstract class _MapOrganizationState implements MapOrganizationState {
  factory _MapOrganizationState(
      {final List<MapModel> dealers,
      final int radius,
      final FormzStatus status,
      final FormzStatus getCurrentLocationStatus,
      final double lat,
      final double long,
      final double currentLat,
      final double currentLong,
      final String searchText,
      final bool fetchMore}) = _$_MapOrganizationState;

  @override
  List<MapModel> get dealers;
  @override
  int get radius;
  @override
  FormzStatus get status;
  @override
  FormzStatus get getCurrentLocationStatus;
  @override
  double get lat;
  @override
  double get long;
  @override
  double get currentLat;
  @override
  double get currentLong;
  @override
  String get searchText;
  @override
  bool get fetchMore;
  @override
  @JsonKey(ignore: true)
  _$$_MapOrganizationStateCopyWith<_$_MapOrganizationState> get copyWith =>
      throw _privateConstructorUsedError;
}
