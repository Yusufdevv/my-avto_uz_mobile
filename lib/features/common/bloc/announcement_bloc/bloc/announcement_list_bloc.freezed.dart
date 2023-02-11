// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnnouncementListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? isNew) getAnnouncementList,
    required TResult Function(List<Region> regions) setRegions,
    required TResult Function() getMinMaxPriceYear,
    required TResult Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)
        setFilter,
    required TResult Function() clearFilter,
    required TResult Function() saveHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? isNew)? getAnnouncementList,
    TResult? Function(List<Region> regions)? setRegions,
    TResult? Function()? getMinMaxPriceYear,
    TResult? Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)?
        setFilter,
    TResult? Function()? clearFilter,
    TResult? Function()? saveHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? isNew)? getAnnouncementList,
    TResult Function(List<Region> regions)? setRegions,
    TResult Function()? getMinMaxPriceYear,
    TResult Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)?
        setFilter,
    TResult Function()? clearFilter,
    TResult Function()? saveHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncementList value) getAnnouncementList,
    required TResult Function(_GetRegions value) setRegions,
    required TResult Function(_GetMinMaxPriceYear value) getMinMaxPriceYear,
    required TResult Function(_SetFilter value) setFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_SaveHistory value) saveHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncementList value)? getAnnouncementList,
    TResult? Function(_GetRegions value)? setRegions,
    TResult? Function(_GetMinMaxPriceYear value)? getMinMaxPriceYear,
    TResult? Function(_SetFilter value)? setFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_SaveHistory value)? saveHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncementList value)? getAnnouncementList,
    TResult Function(_GetRegions value)? setRegions,
    TResult Function(_GetMinMaxPriceYear value)? getMinMaxPriceYear,
    TResult Function(_SetFilter value)? setFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_SaveHistory value)? saveHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementListEventCopyWith<$Res> {
  factory $AnnouncementListEventCopyWith(AnnouncementListEvent value,
          $Res Function(AnnouncementListEvent) then) =
      _$AnnouncementListEventCopyWithImpl<$Res, AnnouncementListEvent>;
}

/// @nodoc
class _$AnnouncementListEventCopyWithImpl<$Res,
        $Val extends AnnouncementListEvent>
    implements $AnnouncementListEventCopyWith<$Res> {
  _$AnnouncementListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetAnnouncementListCopyWith<$Res> {
  factory _$$_GetAnnouncementListCopyWith(_$_GetAnnouncementList value,
          $Res Function(_$_GetAnnouncementList) then) =
      __$$_GetAnnouncementListCopyWithImpl<$Res>;
  @useResult
  $Res call({bool? isNew});
}

/// @nodoc
class __$$_GetAnnouncementListCopyWithImpl<$Res>
    extends _$AnnouncementListEventCopyWithImpl<$Res, _$_GetAnnouncementList>
    implements _$$_GetAnnouncementListCopyWith<$Res> {
  __$$_GetAnnouncementListCopyWithImpl(_$_GetAnnouncementList _value,
      $Res Function(_$_GetAnnouncementList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNew = freezed,
  }) {
    return _then(_$_GetAnnouncementList(
      freezed == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_GetAnnouncementList implements _GetAnnouncementList {
  _$_GetAnnouncementList(this.isNew);

  @override
  final bool? isNew;

  @override
  String toString() {
    return 'AnnouncementListEvent.getAnnouncementList(isNew: $isNew)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetAnnouncementList &&
            (identical(other.isNew, isNew) || other.isNew == isNew));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isNew);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetAnnouncementListCopyWith<_$_GetAnnouncementList> get copyWith =>
      __$$_GetAnnouncementListCopyWithImpl<_$_GetAnnouncementList>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? isNew) getAnnouncementList,
    required TResult Function(List<Region> regions) setRegions,
    required TResult Function() getMinMaxPriceYear,
    required TResult Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)
        setFilter,
    required TResult Function() clearFilter,
    required TResult Function() saveHistory,
  }) {
    return getAnnouncementList(isNew);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? isNew)? getAnnouncementList,
    TResult? Function(List<Region> regions)? setRegions,
    TResult? Function()? getMinMaxPriceYear,
    TResult? Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)?
        setFilter,
    TResult? Function()? clearFilter,
    TResult? Function()? saveHistory,
  }) {
    return getAnnouncementList?.call(isNew);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? isNew)? getAnnouncementList,
    TResult Function(List<Region> regions)? setRegions,
    TResult Function()? getMinMaxPriceYear,
    TResult Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)?
        setFilter,
    TResult Function()? clearFilter,
    TResult Function()? saveHistory,
    required TResult orElse(),
  }) {
    if (getAnnouncementList != null) {
      return getAnnouncementList(isNew);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncementList value) getAnnouncementList,
    required TResult Function(_GetRegions value) setRegions,
    required TResult Function(_GetMinMaxPriceYear value) getMinMaxPriceYear,
    required TResult Function(_SetFilter value) setFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_SaveHistory value) saveHistory,
  }) {
    return getAnnouncementList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncementList value)? getAnnouncementList,
    TResult? Function(_GetRegions value)? setRegions,
    TResult? Function(_GetMinMaxPriceYear value)? getMinMaxPriceYear,
    TResult? Function(_SetFilter value)? setFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_SaveHistory value)? saveHistory,
  }) {
    return getAnnouncementList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncementList value)? getAnnouncementList,
    TResult Function(_GetRegions value)? setRegions,
    TResult Function(_GetMinMaxPriceYear value)? getMinMaxPriceYear,
    TResult Function(_SetFilter value)? setFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_SaveHistory value)? saveHistory,
    required TResult orElse(),
  }) {
    if (getAnnouncementList != null) {
      return getAnnouncementList(this);
    }
    return orElse();
  }
}

abstract class _GetAnnouncementList implements AnnouncementListEvent {
  factory _GetAnnouncementList(final bool? isNew) = _$_GetAnnouncementList;

  bool? get isNew;
  @JsonKey(ignore: true)
  _$$_GetAnnouncementListCopyWith<_$_GetAnnouncementList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetRegionsCopyWith<$Res> {
  factory _$$_GetRegionsCopyWith(
          _$_GetRegions value, $Res Function(_$_GetRegions) then) =
      __$$_GetRegionsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Region> regions});
}

/// @nodoc
class __$$_GetRegionsCopyWithImpl<$Res>
    extends _$AnnouncementListEventCopyWithImpl<$Res, _$_GetRegions>
    implements _$$_GetRegionsCopyWith<$Res> {
  __$$_GetRegionsCopyWithImpl(
      _$_GetRegions _value, $Res Function(_$_GetRegions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regions = null,
  }) {
    return _then(_$_GetRegions(
      null == regions
          ? _value._regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<Region>,
    ));
  }
}

/// @nodoc

class _$_GetRegions implements _GetRegions {
  _$_GetRegions(final List<Region> regions) : _regions = regions;

  final List<Region> _regions;
  @override
  List<Region> get regions {
    if (_regions is EqualUnmodifiableListView) return _regions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regions);
  }

  @override
  String toString() {
    return 'AnnouncementListEvent.setRegions(regions: $regions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetRegions &&
            const DeepCollectionEquality().equals(other._regions, _regions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_regions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetRegionsCopyWith<_$_GetRegions> get copyWith =>
      __$$_GetRegionsCopyWithImpl<_$_GetRegions>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? isNew) getAnnouncementList,
    required TResult Function(List<Region> regions) setRegions,
    required TResult Function() getMinMaxPriceYear,
    required TResult Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)
        setFilter,
    required TResult Function() clearFilter,
    required TResult Function() saveHistory,
  }) {
    return setRegions(regions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? isNew)? getAnnouncementList,
    TResult? Function(List<Region> regions)? setRegions,
    TResult? Function()? getMinMaxPriceYear,
    TResult? Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)?
        setFilter,
    TResult? Function()? clearFilter,
    TResult? Function()? saveHistory,
  }) {
    return setRegions?.call(regions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? isNew)? getAnnouncementList,
    TResult Function(List<Region> regions)? setRegions,
    TResult Function()? getMinMaxPriceYear,
    TResult Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)?
        setFilter,
    TResult Function()? clearFilter,
    TResult Function()? saveHistory,
    required TResult orElse(),
  }) {
    if (setRegions != null) {
      return setRegions(regions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncementList value) getAnnouncementList,
    required TResult Function(_GetRegions value) setRegions,
    required TResult Function(_GetMinMaxPriceYear value) getMinMaxPriceYear,
    required TResult Function(_SetFilter value) setFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_SaveHistory value) saveHistory,
  }) {
    return setRegions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncementList value)? getAnnouncementList,
    TResult? Function(_GetRegions value)? setRegions,
    TResult? Function(_GetMinMaxPriceYear value)? getMinMaxPriceYear,
    TResult? Function(_SetFilter value)? setFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_SaveHistory value)? saveHistory,
  }) {
    return setRegions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncementList value)? getAnnouncementList,
    TResult Function(_GetRegions value)? setRegions,
    TResult Function(_GetMinMaxPriceYear value)? getMinMaxPriceYear,
    TResult Function(_SetFilter value)? setFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_SaveHistory value)? saveHistory,
    required TResult orElse(),
  }) {
    if (setRegions != null) {
      return setRegions(this);
    }
    return orElse();
  }
}

abstract class _GetRegions implements AnnouncementListEvent {
  factory _GetRegions(final List<Region> regions) = _$_GetRegions;

  List<Region> get regions;
  @JsonKey(ignore: true)
  _$$_GetRegionsCopyWith<_$_GetRegions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMinMaxPriceYearCopyWith<$Res> {
  factory _$$_GetMinMaxPriceYearCopyWith(_$_GetMinMaxPriceYear value,
          $Res Function(_$_GetMinMaxPriceYear) then) =
      __$$_GetMinMaxPriceYearCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMinMaxPriceYearCopyWithImpl<$Res>
    extends _$AnnouncementListEventCopyWithImpl<$Res, _$_GetMinMaxPriceYear>
    implements _$$_GetMinMaxPriceYearCopyWith<$Res> {
  __$$_GetMinMaxPriceYearCopyWithImpl(
      _$_GetMinMaxPriceYear _value, $Res Function(_$_GetMinMaxPriceYear) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetMinMaxPriceYear implements _GetMinMaxPriceYear {
  _$_GetMinMaxPriceYear();

  @override
  String toString() {
    return 'AnnouncementListEvent.getMinMaxPriceYear()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMinMaxPriceYear);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? isNew) getAnnouncementList,
    required TResult Function(List<Region> regions) setRegions,
    required TResult Function() getMinMaxPriceYear,
    required TResult Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)
        setFilter,
    required TResult Function() clearFilter,
    required TResult Function() saveHistory,
  }) {
    return getMinMaxPriceYear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? isNew)? getAnnouncementList,
    TResult? Function(List<Region> regions)? setRegions,
    TResult? Function()? getMinMaxPriceYear,
    TResult? Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)?
        setFilter,
    TResult? Function()? clearFilter,
    TResult? Function()? saveHistory,
  }) {
    return getMinMaxPriceYear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? isNew)? getAnnouncementList,
    TResult Function(List<Region> regions)? setRegions,
    TResult Function()? getMinMaxPriceYear,
    TResult Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)?
        setFilter,
    TResult Function()? clearFilter,
    TResult Function()? saveHistory,
    required TResult orElse(),
  }) {
    if (getMinMaxPriceYear != null) {
      return getMinMaxPriceYear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncementList value) getAnnouncementList,
    required TResult Function(_GetRegions value) setRegions,
    required TResult Function(_GetMinMaxPriceYear value) getMinMaxPriceYear,
    required TResult Function(_SetFilter value) setFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_SaveHistory value) saveHistory,
  }) {
    return getMinMaxPriceYear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncementList value)? getAnnouncementList,
    TResult? Function(_GetRegions value)? setRegions,
    TResult? Function(_GetMinMaxPriceYear value)? getMinMaxPriceYear,
    TResult? Function(_SetFilter value)? setFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_SaveHistory value)? saveHistory,
  }) {
    return getMinMaxPriceYear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncementList value)? getAnnouncementList,
    TResult Function(_GetRegions value)? setRegions,
    TResult Function(_GetMinMaxPriceYear value)? getMinMaxPriceYear,
    TResult Function(_SetFilter value)? setFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_SaveHistory value)? saveHistory,
    required TResult orElse(),
  }) {
    if (getMinMaxPriceYear != null) {
      return getMinMaxPriceYear(this);
    }
    return orElse();
  }
}

abstract class _GetMinMaxPriceYear implements AnnouncementListEvent {
  factory _GetMinMaxPriceYear() = _$_GetMinMaxPriceYear;
}

/// @nodoc
abstract class _$$_SetFilterCopyWith<$Res> {
  factory _$$_SetFilterCopyWith(
          _$_SetFilter value, $Res Function(_$_SetFilter) then) =
      __$$_SetFilterCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int? makeId,
      int? modelId,
      Currency? currency,
      GearboxTypeEntity? gearboxType,
      BodyTypeEntity? bodyType,
      DriveTypeEntity? driveType,
      RangeValues? yearValues,
      RangeValues? priceValues,
      bool? isFilter});
}

/// @nodoc
class __$$_SetFilterCopyWithImpl<$Res>
    extends _$AnnouncementListEventCopyWithImpl<$Res, _$_SetFilter>
    implements _$$_SetFilterCopyWith<$Res> {
  __$$_SetFilterCopyWithImpl(
      _$_SetFilter _value, $Res Function(_$_SetFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? makeId = freezed,
    Object? modelId = freezed,
    Object? currency = freezed,
    Object? gearboxType = freezed,
    Object? bodyType = freezed,
    Object? driveType = freezed,
    Object? yearValues = freezed,
    Object? priceValues = freezed,
    Object? isFilter = freezed,
  }) {
    return _then(_$_SetFilter(
      makeId: freezed == makeId
          ? _value.makeId
          : makeId // ignore: cast_nullable_to_non_nullable
              as int?,
      modelId: freezed == modelId
          ? _value.modelId
          : modelId // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      gearboxType: freezed == gearboxType
          ? _value.gearboxType
          : gearboxType // ignore: cast_nullable_to_non_nullable
              as GearboxTypeEntity?,
      bodyType: freezed == bodyType
          ? _value.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as BodyTypeEntity?,
      driveType: freezed == driveType
          ? _value.driveType
          : driveType // ignore: cast_nullable_to_non_nullable
              as DriveTypeEntity?,
      yearValues: freezed == yearValues
          ? _value.yearValues
          : yearValues // ignore: cast_nullable_to_non_nullable
              as RangeValues?,
      priceValues: freezed == priceValues
          ? _value.priceValues
          : priceValues // ignore: cast_nullable_to_non_nullable
              as RangeValues?,
      isFilter: freezed == isFilter
          ? _value.isFilter
          : isFilter // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_SetFilter implements _SetFilter {
  _$_SetFilter(
      {this.makeId,
      this.modelId,
      this.currency,
      this.gearboxType,
      this.bodyType,
      this.driveType,
      this.yearValues,
      this.priceValues,
      this.isFilter});

  @override
  final int? makeId;
  @override
  final int? modelId;
  @override
  final Currency? currency;
  @override
  final GearboxTypeEntity? gearboxType;
  @override
  final BodyTypeEntity? bodyType;
  @override
  final DriveTypeEntity? driveType;
  @override
  final RangeValues? yearValues;
  @override
  final RangeValues? priceValues;
  @override
  final bool? isFilter;

  @override
  String toString() {
    return 'AnnouncementListEvent.setFilter(makeId: $makeId, modelId: $modelId, currency: $currency, gearboxType: $gearboxType, bodyType: $bodyType, driveType: $driveType, yearValues: $yearValues, priceValues: $priceValues, isFilter: $isFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetFilter &&
            (identical(other.makeId, makeId) || other.makeId == makeId) &&
            (identical(other.modelId, modelId) || other.modelId == modelId) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.gearboxType, gearboxType) ||
                other.gearboxType == gearboxType) &&
            (identical(other.bodyType, bodyType) ||
                other.bodyType == bodyType) &&
            (identical(other.driveType, driveType) ||
                other.driveType == driveType) &&
            (identical(other.yearValues, yearValues) ||
                other.yearValues == yearValues) &&
            (identical(other.priceValues, priceValues) ||
                other.priceValues == priceValues) &&
            (identical(other.isFilter, isFilter) ||
                other.isFilter == isFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, makeId, modelId, currency,
      gearboxType, bodyType, driveType, yearValues, priceValues, isFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetFilterCopyWith<_$_SetFilter> get copyWith =>
      __$$_SetFilterCopyWithImpl<_$_SetFilter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? isNew) getAnnouncementList,
    required TResult Function(List<Region> regions) setRegions,
    required TResult Function() getMinMaxPriceYear,
    required TResult Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)
        setFilter,
    required TResult Function() clearFilter,
    required TResult Function() saveHistory,
  }) {
    return setFilter(makeId, modelId, currency, gearboxType, bodyType,
        driveType, yearValues, priceValues, isFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? isNew)? getAnnouncementList,
    TResult? Function(List<Region> regions)? setRegions,
    TResult? Function()? getMinMaxPriceYear,
    TResult? Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)?
        setFilter,
    TResult? Function()? clearFilter,
    TResult? Function()? saveHistory,
  }) {
    return setFilter?.call(makeId, modelId, currency, gearboxType, bodyType,
        driveType, yearValues, priceValues, isFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? isNew)? getAnnouncementList,
    TResult Function(List<Region> regions)? setRegions,
    TResult Function()? getMinMaxPriceYear,
    TResult Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)?
        setFilter,
    TResult Function()? clearFilter,
    TResult Function()? saveHistory,
    required TResult orElse(),
  }) {
    if (setFilter != null) {
      return setFilter(makeId, modelId, currency, gearboxType, bodyType,
          driveType, yearValues, priceValues, isFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncementList value) getAnnouncementList,
    required TResult Function(_GetRegions value) setRegions,
    required TResult Function(_GetMinMaxPriceYear value) getMinMaxPriceYear,
    required TResult Function(_SetFilter value) setFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_SaveHistory value) saveHistory,
  }) {
    return setFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncementList value)? getAnnouncementList,
    TResult? Function(_GetRegions value)? setRegions,
    TResult? Function(_GetMinMaxPriceYear value)? getMinMaxPriceYear,
    TResult? Function(_SetFilter value)? setFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_SaveHistory value)? saveHistory,
  }) {
    return setFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncementList value)? getAnnouncementList,
    TResult Function(_GetRegions value)? setRegions,
    TResult Function(_GetMinMaxPriceYear value)? getMinMaxPriceYear,
    TResult Function(_SetFilter value)? setFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_SaveHistory value)? saveHistory,
    required TResult orElse(),
  }) {
    if (setFilter != null) {
      return setFilter(this);
    }
    return orElse();
  }
}

abstract class _SetFilter implements AnnouncementListEvent {
  factory _SetFilter(
      {final int? makeId,
      final int? modelId,
      final Currency? currency,
      final GearboxTypeEntity? gearboxType,
      final BodyTypeEntity? bodyType,
      final DriveTypeEntity? driveType,
      final RangeValues? yearValues,
      final RangeValues? priceValues,
      final bool? isFilter}) = _$_SetFilter;

  int? get makeId;
  int? get modelId;
  Currency? get currency;
  GearboxTypeEntity? get gearboxType;
  BodyTypeEntity? get bodyType;
  DriveTypeEntity? get driveType;
  RangeValues? get yearValues;
  RangeValues? get priceValues;
  bool? get isFilter;
  @JsonKey(ignore: true)
  _$$_SetFilterCopyWith<_$_SetFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ClearFilterCopyWith<$Res> {
  factory _$$_ClearFilterCopyWith(
          _$_ClearFilter value, $Res Function(_$_ClearFilter) then) =
      __$$_ClearFilterCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearFilterCopyWithImpl<$Res>
    extends _$AnnouncementListEventCopyWithImpl<$Res, _$_ClearFilter>
    implements _$$_ClearFilterCopyWith<$Res> {
  __$$_ClearFilterCopyWithImpl(
      _$_ClearFilter _value, $Res Function(_$_ClearFilter) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ClearFilter implements _ClearFilter {
  _$_ClearFilter();

  @override
  String toString() {
    return 'AnnouncementListEvent.clearFilter()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ClearFilter);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? isNew) getAnnouncementList,
    required TResult Function(List<Region> regions) setRegions,
    required TResult Function() getMinMaxPriceYear,
    required TResult Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)
        setFilter,
    required TResult Function() clearFilter,
    required TResult Function() saveHistory,
  }) {
    return clearFilter();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? isNew)? getAnnouncementList,
    TResult? Function(List<Region> regions)? setRegions,
    TResult? Function()? getMinMaxPriceYear,
    TResult? Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)?
        setFilter,
    TResult? Function()? clearFilter,
    TResult? Function()? saveHistory,
  }) {
    return clearFilter?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? isNew)? getAnnouncementList,
    TResult Function(List<Region> regions)? setRegions,
    TResult Function()? getMinMaxPriceYear,
    TResult Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)?
        setFilter,
    TResult Function()? clearFilter,
    TResult Function()? saveHistory,
    required TResult orElse(),
  }) {
    if (clearFilter != null) {
      return clearFilter();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncementList value) getAnnouncementList,
    required TResult Function(_GetRegions value) setRegions,
    required TResult Function(_GetMinMaxPriceYear value) getMinMaxPriceYear,
    required TResult Function(_SetFilter value) setFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_SaveHistory value) saveHistory,
  }) {
    return clearFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncementList value)? getAnnouncementList,
    TResult? Function(_GetRegions value)? setRegions,
    TResult? Function(_GetMinMaxPriceYear value)? getMinMaxPriceYear,
    TResult? Function(_SetFilter value)? setFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_SaveHistory value)? saveHistory,
  }) {
    return clearFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncementList value)? getAnnouncementList,
    TResult Function(_GetRegions value)? setRegions,
    TResult Function(_GetMinMaxPriceYear value)? getMinMaxPriceYear,
    TResult Function(_SetFilter value)? setFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_SaveHistory value)? saveHistory,
    required TResult orElse(),
  }) {
    if (clearFilter != null) {
      return clearFilter(this);
    }
    return orElse();
  }
}

abstract class _ClearFilter implements AnnouncementListEvent {
  factory _ClearFilter() = _$_ClearFilter;
}

/// @nodoc
abstract class _$$_SaveHistoryCopyWith<$Res> {
  factory _$$_SaveHistoryCopyWith(
          _$_SaveHistory value, $Res Function(_$_SaveHistory) then) =
      __$$_SaveHistoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SaveHistoryCopyWithImpl<$Res>
    extends _$AnnouncementListEventCopyWithImpl<$Res, _$_SaveHistory>
    implements _$$_SaveHistoryCopyWith<$Res> {
  __$$_SaveHistoryCopyWithImpl(
      _$_SaveHistory _value, $Res Function(_$_SaveHistory) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SaveHistory implements _SaveHistory {
  _$_SaveHistory();

  @override
  String toString() {
    return 'AnnouncementListEvent.saveHistory()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SaveHistory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? isNew) getAnnouncementList,
    required TResult Function(List<Region> regions) setRegions,
    required TResult Function() getMinMaxPriceYear,
    required TResult Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)
        setFilter,
    required TResult Function() clearFilter,
    required TResult Function() saveHistory,
  }) {
    return saveHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? isNew)? getAnnouncementList,
    TResult? Function(List<Region> regions)? setRegions,
    TResult? Function()? getMinMaxPriceYear,
    TResult? Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)?
        setFilter,
    TResult? Function()? clearFilter,
    TResult? Function()? saveHistory,
  }) {
    return saveHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? isNew)? getAnnouncementList,
    TResult Function(List<Region> regions)? setRegions,
    TResult Function()? getMinMaxPriceYear,
    TResult Function(
            int? makeId,
            int? modelId,
            Currency? currency,
            GearboxTypeEntity? gearboxType,
            BodyTypeEntity? bodyType,
            DriveTypeEntity? driveType,
            RangeValues? yearValues,
            RangeValues? priceValues,
            bool? isFilter)?
        setFilter,
    TResult Function()? clearFilter,
    TResult Function()? saveHistory,
    required TResult orElse(),
  }) {
    if (saveHistory != null) {
      return saveHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncementList value) getAnnouncementList,
    required TResult Function(_GetRegions value) setRegions,
    required TResult Function(_GetMinMaxPriceYear value) getMinMaxPriceYear,
    required TResult Function(_SetFilter value) setFilter,
    required TResult Function(_ClearFilter value) clearFilter,
    required TResult Function(_SaveHistory value) saveHistory,
  }) {
    return saveHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncementList value)? getAnnouncementList,
    TResult? Function(_GetRegions value)? setRegions,
    TResult? Function(_GetMinMaxPriceYear value)? getMinMaxPriceYear,
    TResult? Function(_SetFilter value)? setFilter,
    TResult? Function(_ClearFilter value)? clearFilter,
    TResult? Function(_SaveHistory value)? saveHistory,
  }) {
    return saveHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncementList value)? getAnnouncementList,
    TResult Function(_GetRegions value)? setRegions,
    TResult Function(_GetMinMaxPriceYear value)? getMinMaxPriceYear,
    TResult Function(_SetFilter value)? setFilter,
    TResult Function(_ClearFilter value)? clearFilter,
    TResult Function(_SaveHistory value)? saveHistory,
    required TResult orElse(),
  }) {
    if (saveHistory != null) {
      return saveHistory(this);
    }
    return orElse();
  }
}

abstract class _SaveHistory implements AnnouncementListEvent {
  factory _SaveHistory() = _$_SaveHistory;
}

/// @nodoc
mixin _$AnnouncementListState {
  FormzStatus get status => throw _privateConstructorUsedError;
  int get selected => throw _privateConstructorUsedError;
  bool get next => throw _privateConstructorUsedError;
  String get search => throw _privateConstructorUsedError;
  SearchHistoryModel get searchModel => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  List<Region> get regions => throw _privateConstructorUsedError;
  bool get isFilter => throw _privateConstructorUsedError;
  bool get isHistory => throw _privateConstructorUsedError;
  List<AnnouncementListEntity> get announcementList =>
      throw _privateConstructorUsedError;
  SearchHistoryEntity get searchHistory => throw _privateConstructorUsedError;
  RangeValues get yearValues => throw _privateConstructorUsedError;
  RangeValues get priceValues => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  GearboxTypeEntity? get gearboxType => throw _privateConstructorUsedError;
  BodyTypeEntity? get bodyType => throw _privateConstructorUsedError;
  DriveTypeEntity? get driveType => throw _privateConstructorUsedError;
  int? get makeId => throw _privateConstructorUsedError;
  int? get modelId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementListStateCopyWith<AnnouncementListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementListStateCopyWith<$Res> {
  factory $AnnouncementListStateCopyWith(AnnouncementListState value,
          $Res Function(AnnouncementListState) then) =
      _$AnnouncementListStateCopyWithImpl<$Res, AnnouncementListState>;
  @useResult
  $Res call(
      {FormzStatus status,
      int selected,
      bool next,
      String search,
      SearchHistoryModel searchModel,
      int count,
      List<Region> regions,
      bool isFilter,
      bool isHistory,
      List<AnnouncementListEntity> announcementList,
      SearchHistoryEntity searchHistory,
      RangeValues yearValues,
      RangeValues priceValues,
      Currency currency,
      GearboxTypeEntity? gearboxType,
      BodyTypeEntity? bodyType,
      DriveTypeEntity? driveType,
      int? makeId,
      int? modelId});
}

/// @nodoc
class _$AnnouncementListStateCopyWithImpl<$Res,
        $Val extends AnnouncementListState>
    implements $AnnouncementListStateCopyWith<$Res> {
  _$AnnouncementListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selected = null,
    Object? next = null,
    Object? search = null,
    Object? searchModel = null,
    Object? count = null,
    Object? regions = null,
    Object? isFilter = null,
    Object? isHistory = null,
    Object? announcementList = null,
    Object? searchHistory = null,
    Object? yearValues = null,
    Object? priceValues = null,
    Object? currency = null,
    Object? gearboxType = freezed,
    Object? bodyType = freezed,
    Object? driveType = freezed,
    Object? makeId = freezed,
    Object? modelId = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as int,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as bool,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      searchModel: null == searchModel
          ? _value.searchModel
          : searchModel // ignore: cast_nullable_to_non_nullable
              as SearchHistoryModel,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      regions: null == regions
          ? _value.regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<Region>,
      isFilter: null == isFilter
          ? _value.isFilter
          : isFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      isHistory: null == isHistory
          ? _value.isHistory
          : isHistory // ignore: cast_nullable_to_non_nullable
              as bool,
      announcementList: null == announcementList
          ? _value.announcementList
          : announcementList // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementListEntity>,
      searchHistory: null == searchHistory
          ? _value.searchHistory
          : searchHistory // ignore: cast_nullable_to_non_nullable
              as SearchHistoryEntity,
      yearValues: null == yearValues
          ? _value.yearValues
          : yearValues // ignore: cast_nullable_to_non_nullable
              as RangeValues,
      priceValues: null == priceValues
          ? _value.priceValues
          : priceValues // ignore: cast_nullable_to_non_nullable
              as RangeValues,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      gearboxType: freezed == gearboxType
          ? _value.gearboxType
          : gearboxType // ignore: cast_nullable_to_non_nullable
              as GearboxTypeEntity?,
      bodyType: freezed == bodyType
          ? _value.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as BodyTypeEntity?,
      driveType: freezed == driveType
          ? _value.driveType
          : driveType // ignore: cast_nullable_to_non_nullable
              as DriveTypeEntity?,
      makeId: freezed == makeId
          ? _value.makeId
          : makeId // ignore: cast_nullable_to_non_nullable
              as int?,
      modelId: freezed == modelId
          ? _value.modelId
          : modelId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnnouncementListCopyWith<$Res>
    implements $AnnouncementListStateCopyWith<$Res> {
  factory _$$_AnnouncementListCopyWith(
          _$_AnnouncementList value, $Res Function(_$_AnnouncementList) then) =
      __$$_AnnouncementListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus status,
      int selected,
      bool next,
      String search,
      SearchHistoryModel searchModel,
      int count,
      List<Region> regions,
      bool isFilter,
      bool isHistory,
      List<AnnouncementListEntity> announcementList,
      SearchHistoryEntity searchHistory,
      RangeValues yearValues,
      RangeValues priceValues,
      Currency currency,
      GearboxTypeEntity? gearboxType,
      BodyTypeEntity? bodyType,
      DriveTypeEntity? driveType,
      int? makeId,
      int? modelId});
}

/// @nodoc
class __$$_AnnouncementListCopyWithImpl<$Res>
    extends _$AnnouncementListStateCopyWithImpl<$Res, _$_AnnouncementList>
    implements _$$_AnnouncementListCopyWith<$Res> {
  __$$_AnnouncementListCopyWithImpl(
      _$_AnnouncementList _value, $Res Function(_$_AnnouncementList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selected = null,
    Object? next = null,
    Object? search = null,
    Object? searchModel = null,
    Object? count = null,
    Object? regions = null,
    Object? isFilter = null,
    Object? isHistory = null,
    Object? announcementList = null,
    Object? searchHistory = null,
    Object? yearValues = null,
    Object? priceValues = null,
    Object? currency = null,
    Object? gearboxType = freezed,
    Object? bodyType = freezed,
    Object? driveType = freezed,
    Object? makeId = freezed,
    Object? modelId = freezed,
  }) {
    return _then(_$_AnnouncementList(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as int,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as bool,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      searchModel: null == searchModel
          ? _value.searchModel
          : searchModel // ignore: cast_nullable_to_non_nullable
              as SearchHistoryModel,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      regions: null == regions
          ? _value._regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<Region>,
      isFilter: null == isFilter
          ? _value.isFilter
          : isFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      isHistory: null == isHistory
          ? _value.isHistory
          : isHistory // ignore: cast_nullable_to_non_nullable
              as bool,
      announcementList: null == announcementList
          ? _value._announcementList
          : announcementList // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementListEntity>,
      searchHistory: null == searchHistory
          ? _value.searchHistory
          : searchHistory // ignore: cast_nullable_to_non_nullable
              as SearchHistoryEntity,
      yearValues: null == yearValues
          ? _value.yearValues
          : yearValues // ignore: cast_nullable_to_non_nullable
              as RangeValues,
      priceValues: null == priceValues
          ? _value.priceValues
          : priceValues // ignore: cast_nullable_to_non_nullable
              as RangeValues,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      gearboxType: freezed == gearboxType
          ? _value.gearboxType
          : gearboxType // ignore: cast_nullable_to_non_nullable
              as GearboxTypeEntity?,
      bodyType: freezed == bodyType
          ? _value.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as BodyTypeEntity?,
      driveType: freezed == driveType
          ? _value.driveType
          : driveType // ignore: cast_nullable_to_non_nullable
              as DriveTypeEntity?,
      makeId: freezed == makeId
          ? _value.makeId
          : makeId // ignore: cast_nullable_to_non_nullable
              as int?,
      modelId: freezed == modelId
          ? _value.modelId
          : modelId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_AnnouncementList implements _AnnouncementList {
  _$_AnnouncementList(
      {this.status = FormzStatus.pure,
      this.selected = 0,
      this.next = true,
      this.search = '',
      this.searchModel = const SearchHistoryModel(),
      this.count = 0,
      final List<Region> regions = const [],
      this.isFilter = false,
      this.isHistory = false,
      final List<AnnouncementListEntity> announcementList = const [],
      this.searchHistory = const SearchHistoryEntity(),
      this.yearValues = const RangeValues(1960, 2023),
      this.priceValues = const RangeValues(1000, 500000),
      this.currency = Currency.usd,
      this.gearboxType,
      this.bodyType,
      this.driveType,
      this.makeId,
      this.modelId})
      : _regions = regions,
        _announcementList = announcementList;

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final int selected;
  @override
  @JsonKey()
  final bool next;
  @override
  @JsonKey()
  final String search;
  @override
  @JsonKey()
  final SearchHistoryModel searchModel;
  @override
  @JsonKey()
  final int count;
  final List<Region> _regions;
  @override
  @JsonKey()
  List<Region> get regions {
    if (_regions is EqualUnmodifiableListView) return _regions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regions);
  }

  @override
  @JsonKey()
  final bool isFilter;
  @override
  @JsonKey()
  final bool isHistory;
  final List<AnnouncementListEntity> _announcementList;
  @override
  @JsonKey()
  List<AnnouncementListEntity> get announcementList {
    if (_announcementList is EqualUnmodifiableListView)
      return _announcementList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_announcementList);
  }

  @override
  @JsonKey()
  final SearchHistoryEntity searchHistory;
  @override
  @JsonKey()
  final RangeValues yearValues;
  @override
  @JsonKey()
  final RangeValues priceValues;
  @override
  @JsonKey()
  final Currency currency;
  @override
  final GearboxTypeEntity? gearboxType;
  @override
  final BodyTypeEntity? bodyType;
  @override
  final DriveTypeEntity? driveType;
  @override
  final int? makeId;
  @override
  final int? modelId;

  @override
  String toString() {
    return 'AnnouncementListState(status: $status, selected: $selected, next: $next, search: $search, searchModel: $searchModel, count: $count, regions: $regions, isFilter: $isFilter, isHistory: $isHistory, announcementList: $announcementList, searchHistory: $searchHistory, yearValues: $yearValues, priceValues: $priceValues, currency: $currency, gearboxType: $gearboxType, bodyType: $bodyType, driveType: $driveType, makeId: $makeId, modelId: $modelId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncementList &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.searchModel, searchModel) ||
                other.searchModel == searchModel) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._regions, _regions) &&
            (identical(other.isFilter, isFilter) ||
                other.isFilter == isFilter) &&
            (identical(other.isHistory, isHistory) ||
                other.isHistory == isHistory) &&
            const DeepCollectionEquality()
                .equals(other._announcementList, _announcementList) &&
            (identical(other.searchHistory, searchHistory) ||
                other.searchHistory == searchHistory) &&
            (identical(other.yearValues, yearValues) ||
                other.yearValues == yearValues) &&
            (identical(other.priceValues, priceValues) ||
                other.priceValues == priceValues) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.gearboxType, gearboxType) ||
                other.gearboxType == gearboxType) &&
            (identical(other.bodyType, bodyType) ||
                other.bodyType == bodyType) &&
            (identical(other.driveType, driveType) ||
                other.driveType == driveType) &&
            (identical(other.makeId, makeId) || other.makeId == makeId) &&
            (identical(other.modelId, modelId) || other.modelId == modelId));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        status,
        selected,
        next,
        search,
        searchModel,
        count,
        const DeepCollectionEquality().hash(_regions),
        isFilter,
        isHistory,
        const DeepCollectionEquality().hash(_announcementList),
        searchHistory,
        yearValues,
        priceValues,
        currency,
        gearboxType,
        bodyType,
        driveType,
        makeId,
        modelId
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnouncementListCopyWith<_$_AnnouncementList> get copyWith =>
      __$$_AnnouncementListCopyWithImpl<_$_AnnouncementList>(this, _$identity);
}

abstract class _AnnouncementList implements AnnouncementListState {
  factory _AnnouncementList(
      {final FormzStatus status,
      final int selected,
      final bool next,
      final String search,
      final SearchHistoryModel searchModel,
      final int count,
      final List<Region> regions,
      final bool isFilter,
      final bool isHistory,
      final List<AnnouncementListEntity> announcementList,
      final SearchHistoryEntity searchHistory,
      final RangeValues yearValues,
      final RangeValues priceValues,
      final Currency currency,
      final GearboxTypeEntity? gearboxType,
      final BodyTypeEntity? bodyType,
      final DriveTypeEntity? driveType,
      final int? makeId,
      final int? modelId}) = _$_AnnouncementList;

  @override
  FormzStatus get status;
  @override
  int get selected;
  @override
  bool get next;
  @override
  String get search;
  @override
  SearchHistoryModel get searchModel;
  @override
  int get count;
  @override
  List<Region> get regions;
  @override
  bool get isFilter;
  @override
  bool get isHistory;
  @override
  List<AnnouncementListEntity> get announcementList;
  @override
  SearchHistoryEntity get searchHistory;
  @override
  RangeValues get yearValues;
  @override
  RangeValues get priceValues;
  @override
  Currency get currency;
  @override
  GearboxTypeEntity? get gearboxType;
  @override
  BodyTypeEntity? get bodyType;
  @override
  DriveTypeEntity? get driveType;
  @override
  int? get makeId;
  @override
  int? get modelId;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementListCopyWith<_$_AnnouncementList> get copyWith =>
      throw _privateConstructorUsedError;
}
