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
    required TResult Function(
            double? latitude, double? longitude, double? radius)
        getDirectoriesPoints,
    required TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
    required TResult Function(double lat, double long, MapEntity? currentDealer)
        getAddressOfDealler,
    required TResult Function(List<DealerCardModel> list) setMapPoints,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDirectoriesPoints,
    TResult? Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
    TResult? Function(double lat, double long, MapEntity? currentDealer)?
        getAddressOfDealler,
    TResult? Function(List<DealerCardModel> list)? setMapPoints,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDirectoriesPoints,
    TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    TResult Function(double lat, double long, MapEntity? currentDealer)?
        getAddressOfDealler,
    TResult Function(List<DealerCardModel> list)? setMapPoints,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDealers value) getDealers,
    required TResult Function(_GetDirectoriesPoints value) getDirectoriesPoints,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
    required TResult Function(_GetAddressOfDealler value) getAddressOfDealler,
    required TResult Function(_SetMapPoints value) setMapPoints,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDealers value)? getDealers,
    TResult? Function(_GetDirectoriesPoints value)? getDirectoriesPoints,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
    TResult? Function(_GetAddressOfDealler value)? getAddressOfDealler,
    TResult? Function(_SetMapPoints value)? setMapPoints,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDealers value)? getDealers,
    TResult Function(_GetDirectoriesPoints value)? getDirectoriesPoints,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    TResult Function(_GetAddressOfDealler value)? getAddressOfDealler,
    TResult Function(_SetMapPoints value)? setMapPoints,
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
    required TResult Function(
            double? latitude, double? longitude, double? radius)
        getDirectoriesPoints,
    required TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
    required TResult Function(double lat, double long, MapEntity? currentDealer)
        getAddressOfDealler,
    required TResult Function(List<DealerCardModel> list) setMapPoints,
  }) {
    return getDealers(latitude, longitude, radius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDirectoriesPoints,
    TResult? Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
    TResult? Function(double lat, double long, MapEntity? currentDealer)?
        getAddressOfDealler,
    TResult? Function(List<DealerCardModel> list)? setMapPoints,
  }) {
    return getDealers?.call(latitude, longitude, radius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDirectoriesPoints,
    TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    TResult Function(double lat, double long, MapEntity? currentDealer)?
        getAddressOfDealler,
    TResult Function(List<DealerCardModel> list)? setMapPoints,
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
    required TResult Function(_GetDirectoriesPoints value) getDirectoriesPoints,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
    required TResult Function(_GetAddressOfDealler value) getAddressOfDealler,
    required TResult Function(_SetMapPoints value) setMapPoints,
  }) {
    return getDealers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDealers value)? getDealers,
    TResult? Function(_GetDirectoriesPoints value)? getDirectoriesPoints,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
    TResult? Function(_GetAddressOfDealler value)? getAddressOfDealler,
    TResult? Function(_SetMapPoints value)? setMapPoints,
  }) {
    return getDealers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDealers value)? getDealers,
    TResult Function(_GetDirectoriesPoints value)? getDirectoriesPoints,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    TResult Function(_GetAddressOfDealler value)? getAddressOfDealler,
    TResult Function(_SetMapPoints value)? setMapPoints,
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
abstract class _$$_GetDirectoriesPointsCopyWith<$Res> {
  factory _$$_GetDirectoriesPointsCopyWith(_$_GetDirectoriesPoints value,
          $Res Function(_$_GetDirectoriesPoints) then) =
      __$$_GetDirectoriesPointsCopyWithImpl<$Res>;
  @useResult
  $Res call({double? latitude, double? longitude, double? radius});
}

/// @nodoc
class __$$_GetDirectoriesPointsCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_GetDirectoriesPoints>
    implements _$$_GetDirectoriesPointsCopyWith<$Res> {
  __$$_GetDirectoriesPointsCopyWithImpl(_$_GetDirectoriesPoints _value,
      $Res Function(_$_GetDirectoriesPoints) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? radius = freezed,
  }) {
    return _then(_$_GetDirectoriesPoints(
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

class _$_GetDirectoriesPoints implements _GetDirectoriesPoints {
  _$_GetDirectoriesPoints({this.latitude, this.longitude, this.radius});

  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final double? radius;

  @override
  String toString() {
    return 'MapOrganizationEvent.getDirectoriesPoints(latitude: $latitude, longitude: $longitude, radius: $radius)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetDirectoriesPoints &&
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
  _$$_GetDirectoriesPointsCopyWith<_$_GetDirectoriesPoints> get copyWith =>
      __$$_GetDirectoriesPointsCopyWithImpl<_$_GetDirectoriesPoints>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double? latitude, double? longitude, double? radius)
        getDealers,
    required TResult Function(
            double? latitude, double? longitude, double? radius)
        getDirectoriesPoints,
    required TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
    required TResult Function(double lat, double long, MapEntity? currentDealer)
        getAddressOfDealler,
    required TResult Function(List<DealerCardModel> list) setMapPoints,
  }) {
    return getDirectoriesPoints(latitude, longitude, radius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDirectoriesPoints,
    TResult? Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
    TResult? Function(double lat, double long, MapEntity? currentDealer)?
        getAddressOfDealler,
    TResult? Function(List<DealerCardModel> list)? setMapPoints,
  }) {
    return getDirectoriesPoints?.call(latitude, longitude, radius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDirectoriesPoints,
    TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    TResult Function(double lat, double long, MapEntity? currentDealer)?
        getAddressOfDealler,
    TResult Function(List<DealerCardModel> list)? setMapPoints,
    required TResult orElse(),
  }) {
    if (getDirectoriesPoints != null) {
      return getDirectoriesPoints(latitude, longitude, radius);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDealers value) getDealers,
    required TResult Function(_GetDirectoriesPoints value) getDirectoriesPoints,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
    required TResult Function(_GetAddressOfDealler value) getAddressOfDealler,
    required TResult Function(_SetMapPoints value) setMapPoints,
  }) {
    return getDirectoriesPoints(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDealers value)? getDealers,
    TResult? Function(_GetDirectoriesPoints value)? getDirectoriesPoints,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
    TResult? Function(_GetAddressOfDealler value)? getAddressOfDealler,
    TResult? Function(_SetMapPoints value)? setMapPoints,
  }) {
    return getDirectoriesPoints?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDealers value)? getDealers,
    TResult Function(_GetDirectoriesPoints value)? getDirectoriesPoints,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    TResult Function(_GetAddressOfDealler value)? getAddressOfDealler,
    TResult Function(_SetMapPoints value)? setMapPoints,
    required TResult orElse(),
  }) {
    if (getDirectoriesPoints != null) {
      return getDirectoriesPoints(this);
    }
    return orElse();
  }
}

abstract class _GetDirectoriesPoints implements MapOrganizationEvent {
  factory _GetDirectoriesPoints(
      {final double? latitude,
      final double? longitude,
      final double? radius}) = _$_GetDirectoriesPoints;

  double? get latitude;
  double? get longitude;
  double? get radius;
  @JsonKey(ignore: true)
  _$$_GetDirectoriesPointsCopyWith<_$_GetDirectoriesPoints> get copyWith =>
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
    required TResult Function(
            double? latitude, double? longitude, double? radius)
        getDirectoriesPoints,
    required TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
    required TResult Function(double lat, double long, MapEntity? currentDealer)
        getAddressOfDealler,
    required TResult Function(List<DealerCardModel> list) setMapPoints,
  }) {
    return getCurrentLocation(onError, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDirectoriesPoints,
    TResult? Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
    TResult? Function(double lat, double long, MapEntity? currentDealer)?
        getAddressOfDealler,
    TResult? Function(List<DealerCardModel> list)? setMapPoints,
  }) {
    return getCurrentLocation?.call(onError, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDirectoriesPoints,
    TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    TResult Function(double lat, double long, MapEntity? currentDealer)?
        getAddressOfDealler,
    TResult Function(List<DealerCardModel> list)? setMapPoints,
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
    required TResult Function(_GetDirectoriesPoints value) getDirectoriesPoints,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
    required TResult Function(_GetAddressOfDealler value) getAddressOfDealler,
    required TResult Function(_SetMapPoints value) setMapPoints,
  }) {
    return getCurrentLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDealers value)? getDealers,
    TResult? Function(_GetDirectoriesPoints value)? getDirectoriesPoints,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
    TResult? Function(_GetAddressOfDealler value)? getAddressOfDealler,
    TResult? Function(_SetMapPoints value)? setMapPoints,
  }) {
    return getCurrentLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDealers value)? getDealers,
    TResult Function(_GetDirectoriesPoints value)? getDirectoriesPoints,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    TResult Function(_GetAddressOfDealler value)? getAddressOfDealler,
    TResult Function(_SetMapPoints value)? setMapPoints,
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
    required TResult Function(
            double? latitude, double? longitude, double? radius)
        getDirectoriesPoints,
    required TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
    required TResult Function(double lat, double long, MapEntity? currentDealer)
        getAddressOfDealler,
    required TResult Function(List<DealerCardModel> list) setMapPoints,
  }) {
    return changeLatLong(lat, long, radius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDirectoriesPoints,
    TResult? Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
    TResult? Function(double lat, double long, MapEntity? currentDealer)?
        getAddressOfDealler,
    TResult? Function(List<DealerCardModel> list)? setMapPoints,
  }) {
    return changeLatLong?.call(lat, long, radius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDirectoriesPoints,
    TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    TResult Function(double lat, double long, MapEntity? currentDealer)?
        getAddressOfDealler,
    TResult Function(List<DealerCardModel> list)? setMapPoints,
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
    required TResult Function(_GetDirectoriesPoints value) getDirectoriesPoints,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
    required TResult Function(_GetAddressOfDealler value) getAddressOfDealler,
    required TResult Function(_SetMapPoints value) setMapPoints,
  }) {
    return changeLatLong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDealers value)? getDealers,
    TResult? Function(_GetDirectoriesPoints value)? getDirectoriesPoints,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
    TResult? Function(_GetAddressOfDealler value)? getAddressOfDealler,
    TResult? Function(_SetMapPoints value)? setMapPoints,
  }) {
    return changeLatLong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDealers value)? getDealers,
    TResult Function(_GetDirectoriesPoints value)? getDirectoriesPoints,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    TResult Function(_GetAddressOfDealler value)? getAddressOfDealler,
    TResult Function(_SetMapPoints value)? setMapPoints,
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
abstract class _$$_GetAddressOfDeallerCopyWith<$Res> {
  factory _$$_GetAddressOfDeallerCopyWith(_$_GetAddressOfDealler value,
          $Res Function(_$_GetAddressOfDealler) then) =
      __$$_GetAddressOfDeallerCopyWithImpl<$Res>;
  @useResult
  $Res call({double lat, double long, MapEntity? currentDealer});
}

/// @nodoc
class __$$_GetAddressOfDeallerCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_GetAddressOfDealler>
    implements _$$_GetAddressOfDeallerCopyWith<$Res> {
  __$$_GetAddressOfDeallerCopyWithImpl(_$_GetAddressOfDealler _value,
      $Res Function(_$_GetAddressOfDealler) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? long = null,
    Object? currentDealer = freezed,
  }) {
    return _then(_$_GetAddressOfDealler(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      currentDealer: freezed == currentDealer
          ? _value.currentDealer
          : currentDealer // ignore: cast_nullable_to_non_nullable
              as MapEntity?,
    ));
  }
}

/// @nodoc

class _$_GetAddressOfDealler implements _GetAddressOfDealler {
  _$_GetAddressOfDealler(
      {required this.lat, required this.long, this.currentDealer});

  @override
  final double lat;
  @override
  final double long;
  @override
  final MapEntity? currentDealer;

  @override
  String toString() {
    return 'MapOrganizationEvent.getAddressOfDealler(lat: $lat, long: $long, currentDealer: $currentDealer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetAddressOfDealler &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.currentDealer, currentDealer) ||
                other.currentDealer == currentDealer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, long, currentDealer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetAddressOfDeallerCopyWith<_$_GetAddressOfDealler> get copyWith =>
      __$$_GetAddressOfDeallerCopyWithImpl<_$_GetAddressOfDealler>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double? latitude, double? longitude, double? radius)
        getDealers,
    required TResult Function(
            double? latitude, double? longitude, double? radius)
        getDirectoriesPoints,
    required TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
    required TResult Function(double lat, double long, MapEntity? currentDealer)
        getAddressOfDealler,
    required TResult Function(List<DealerCardModel> list) setMapPoints,
  }) {
    return getAddressOfDealler(lat, long, currentDealer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDirectoriesPoints,
    TResult? Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
    TResult? Function(double lat, double long, MapEntity? currentDealer)?
        getAddressOfDealler,
    TResult? Function(List<DealerCardModel> list)? setMapPoints,
  }) {
    return getAddressOfDealler?.call(lat, long, currentDealer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDirectoriesPoints,
    TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    TResult Function(double lat, double long, MapEntity? currentDealer)?
        getAddressOfDealler,
    TResult Function(List<DealerCardModel> list)? setMapPoints,
    required TResult orElse(),
  }) {
    if (getAddressOfDealler != null) {
      return getAddressOfDealler(lat, long, currentDealer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDealers value) getDealers,
    required TResult Function(_GetDirectoriesPoints value) getDirectoriesPoints,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
    required TResult Function(_GetAddressOfDealler value) getAddressOfDealler,
    required TResult Function(_SetMapPoints value) setMapPoints,
  }) {
    return getAddressOfDealler(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDealers value)? getDealers,
    TResult? Function(_GetDirectoriesPoints value)? getDirectoriesPoints,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
    TResult? Function(_GetAddressOfDealler value)? getAddressOfDealler,
    TResult? Function(_SetMapPoints value)? setMapPoints,
  }) {
    return getAddressOfDealler?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDealers value)? getDealers,
    TResult Function(_GetDirectoriesPoints value)? getDirectoriesPoints,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    TResult Function(_GetAddressOfDealler value)? getAddressOfDealler,
    TResult Function(_SetMapPoints value)? setMapPoints,
    required TResult orElse(),
  }) {
    if (getAddressOfDealler != null) {
      return getAddressOfDealler(this);
    }
    return orElse();
  }
}

abstract class _GetAddressOfDealler implements MapOrganizationEvent {
  factory _GetAddressOfDealler(
      {required final double lat,
      required final double long,
      final MapEntity? currentDealer}) = _$_GetAddressOfDealler;

  double get lat;
  double get long;
  MapEntity? get currentDealer;
  @JsonKey(ignore: true)
  _$$_GetAddressOfDeallerCopyWith<_$_GetAddressOfDealler> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetMapPointsCopyWith<$Res> {
  factory _$$_SetMapPointsCopyWith(
          _$_SetMapPoints value, $Res Function(_$_SetMapPoints) then) =
      __$$_SetMapPointsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DealerCardModel> list});
}

/// @nodoc
class __$$_SetMapPointsCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_SetMapPoints>
    implements _$$_SetMapPointsCopyWith<$Res> {
  __$$_SetMapPointsCopyWithImpl(
      _$_SetMapPoints _value, $Res Function(_$_SetMapPoints) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$_SetMapPoints(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<DealerCardModel>,
    ));
  }
}

/// @nodoc

class _$_SetMapPoints implements _SetMapPoints {
  _$_SetMapPoints({final List<DealerCardModel> list = const []}) : _list = list;

  final List<DealerCardModel> _list;
  @override
  @JsonKey()
  List<DealerCardModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'MapOrganizationEvent.setMapPoints(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetMapPoints &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetMapPointsCopyWith<_$_SetMapPoints> get copyWith =>
      __$$_SetMapPointsCopyWithImpl<_$_SetMapPoints>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double? latitude, double? longitude, double? radius)
        getDealers,
    required TResult Function(
            double? latitude, double? longitude, double? radius)
        getDirectoriesPoints,
    required TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
    required TResult Function(double lat, double long, MapEntity? currentDealer)
        getAddressOfDealler,
    required TResult Function(List<DealerCardModel> list) setMapPoints,
  }) {
    return setMapPoints(list);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult? Function(double? latitude, double? longitude, double? radius)?
        getDirectoriesPoints,
    TResult? Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
    TResult? Function(double lat, double long, MapEntity? currentDealer)?
        getAddressOfDealler,
    TResult? Function(List<DealerCardModel> list)? setMapPoints,
  }) {
    return setMapPoints?.call(list);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDealers,
    TResult Function(double? latitude, double? longitude, double? radius)?
        getDirectoriesPoints,
    TResult Function(
            ValueChanged<String> onError, ValueChanged<Position> onSuccess)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    TResult Function(double lat, double long, MapEntity? currentDealer)?
        getAddressOfDealler,
    TResult Function(List<DealerCardModel> list)? setMapPoints,
    required TResult orElse(),
  }) {
    if (setMapPoints != null) {
      return setMapPoints(list);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDealers value) getDealers,
    required TResult Function(_GetDirectoriesPoints value) getDirectoriesPoints,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
    required TResult Function(_GetAddressOfDealler value) getAddressOfDealler,
    required TResult Function(_SetMapPoints value) setMapPoints,
  }) {
    return setMapPoints(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDealers value)? getDealers,
    TResult? Function(_GetDirectoriesPoints value)? getDirectoriesPoints,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
    TResult? Function(_GetAddressOfDealler value)? getAddressOfDealler,
    TResult? Function(_SetMapPoints value)? setMapPoints,
  }) {
    return setMapPoints?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDealers value)? getDealers,
    TResult Function(_GetDirectoriesPoints value)? getDirectoriesPoints,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    TResult Function(_GetAddressOfDealler value)? getAddressOfDealler,
    TResult Function(_SetMapPoints value)? setMapPoints,
    required TResult orElse(),
  }) {
    if (setMapPoints != null) {
      return setMapPoints(this);
    }
    return orElse();
  }
}

abstract class _SetMapPoints implements MapOrganizationEvent {
  factory _SetMapPoints({final List<DealerCardModel> list}) = _$_SetMapPoints;

  List<DealerCardModel> get list;
  @JsonKey(ignore: true)
  _$$_SetMapPointsCopyWith<_$_SetMapPoints> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MapOrganizationState {
  String? get address => throw _privateConstructorUsedError;
  List<MapEntity> get dealers => throw _privateConstructorUsedError;
  MapEntity? get currentDealer => throw _privateConstructorUsedError;
  List<MapEntity> get directoriesPoints => throw _privateConstructorUsedError;
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
      {String? address,
      List<MapEntity> dealers,
      MapEntity? currentDealer,
      List<MapEntity> directoriesPoints,
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
    Object? address = freezed,
    Object? dealers = null,
    Object? currentDealer = freezed,
    Object? directoriesPoints = null,
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
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      dealers: null == dealers
          ? _value.dealers
          : dealers // ignore: cast_nullable_to_non_nullable
              as List<MapEntity>,
      currentDealer: freezed == currentDealer
          ? _value.currentDealer
          : currentDealer // ignore: cast_nullable_to_non_nullable
              as MapEntity?,
      directoriesPoints: null == directoriesPoints
          ? _value.directoriesPoints
          : directoriesPoints // ignore: cast_nullable_to_non_nullable
              as List<MapEntity>,
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
      {String? address,
      List<MapEntity> dealers,
      MapEntity? currentDealer,
      List<MapEntity> directoriesPoints,
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
    Object? address = freezed,
    Object? dealers = null,
    Object? currentDealer = freezed,
    Object? directoriesPoints = null,
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
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      dealers: null == dealers
          ? _value._dealers
          : dealers // ignore: cast_nullable_to_non_nullable
              as List<MapEntity>,
      currentDealer: freezed == currentDealer
          ? _value.currentDealer
          : currentDealer // ignore: cast_nullable_to_non_nullable
              as MapEntity?,
      directoriesPoints: null == directoriesPoints
          ? _value._directoriesPoints
          : directoriesPoints // ignore: cast_nullable_to_non_nullable
              as List<MapEntity>,
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
      {this.address = null,
      final List<MapEntity> dealers = const [],
      this.currentDealer = const MapEntity(),
      final List<MapEntity> directoriesPoints = const [],
      this.radius = 0,
      this.status = FormzStatus.pure,
      this.getCurrentLocationStatus = FormzStatus.pure,
      this.lat = 0,
      this.long = 0,
      this.currentLat = 0,
      this.currentLong = 0,
      this.searchText = '',
      this.fetchMore = false})
      : _dealers = dealers,
        _directoriesPoints = directoriesPoints;

  @override
  @JsonKey()
  final String? address;
  final List<MapEntity> _dealers;
  @override
  @JsonKey()
  List<MapEntity> get dealers {
    if (_dealers is EqualUnmodifiableListView) return _dealers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dealers);
  }

  @override
  @JsonKey()
  final MapEntity? currentDealer;
  final List<MapEntity> _directoriesPoints;
  @override
  @JsonKey()
  List<MapEntity> get directoriesPoints {
    if (_directoriesPoints is EqualUnmodifiableListView)
      return _directoriesPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_directoriesPoints);
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
    return 'MapOrganizationState(address: $address, dealers: $dealers, currentDealer: $currentDealer, directoriesPoints: $directoriesPoints, radius: $radius, status: $status, getCurrentLocationStatus: $getCurrentLocationStatus, lat: $lat, long: $long, currentLat: $currentLat, currentLong: $currentLong, searchText: $searchText, fetchMore: $fetchMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapOrganizationState &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other._dealers, _dealers) &&
            (identical(other.currentDealer, currentDealer) ||
                other.currentDealer == currentDealer) &&
            const DeepCollectionEquality()
                .equals(other._directoriesPoints, _directoriesPoints) &&
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
      address,
      const DeepCollectionEquality().hash(_dealers),
      currentDealer,
      const DeepCollectionEquality().hash(_directoriesPoints),
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
      {final String? address,
      final List<MapEntity> dealers,
      final MapEntity? currentDealer,
      final List<MapEntity> directoriesPoints,
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
  String? get address;
  @override
  List<MapEntity> get dealers;
  @override
  MapEntity? get currentDealer;
  @override
  List<MapEntity> get directoriesPoints;
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
