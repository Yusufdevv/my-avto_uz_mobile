// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dealer_card_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DealerCardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh, String search) getResults,
    required TResult Function(
            bool? isRefresh, String? mark, String? regionId, String? carType)
        getFilterResult,
    required TResult Function(String? regions, String? maker, String? carType)
        getFilterParams,
    required TResult Function() getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRefresh, String search)? getResults,
    TResult? Function(
            bool? isRefresh, String? mark, String? regionId, String? carType)?
        getFilterResult,
    TResult? Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult? Function()? getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh, String search)? getResults,
    TResult Function(
            bool? isRefresh, String? mark, String? regionId, String? carType)?
        getFilterResult,
    TResult Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult Function()? getMoreResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetFilter value) getFilterResult,
    required TResult Function(_GetFilterParams value) getFilterParams,
    required TResult Function(_GetMoreResults value) getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetFilter value)? getFilterResult,
    TResult? Function(_GetFilterParams value)? getFilterParams,
    TResult? Function(_GetMoreResults value)? getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetFilter value)? getFilterResult,
    TResult Function(_GetFilterParams value)? getFilterParams,
    TResult Function(_GetMoreResults value)? getMoreResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DealerCardEventCopyWith<$Res> {
  factory $DealerCardEventCopyWith(
          DealerCardEvent value, $Res Function(DealerCardEvent) then) =
      _$DealerCardEventCopyWithImpl<$Res, DealerCardEvent>;
}

/// @nodoc
class _$DealerCardEventCopyWithImpl<$Res, $Val extends DealerCardEvent>
    implements $DealerCardEventCopyWith<$Res> {
  _$DealerCardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetResultsCopyWith<$Res> {
  factory _$$_GetResultsCopyWith(
          _$_GetResults value, $Res Function(_$_GetResults) then) =
      __$$_GetResultsCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isRefresh, String search});
}

/// @nodoc
class __$$_GetResultsCopyWithImpl<$Res>
    extends _$DealerCardEventCopyWithImpl<$Res, _$_GetResults>
    implements _$$_GetResultsCopyWith<$Res> {
  __$$_GetResultsCopyWithImpl(
      _$_GetResults _value, $Res Function(_$_GetResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRefresh = null,
    Object? search = null,
  }) {
    return _then(_$_GetResults(
      isRefresh: null == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetResults implements _GetResults {
  _$_GetResults({required this.isRefresh, required this.search});

  @override
  final bool isRefresh;
  @override
  final String search;

  @override
  String toString() {
    return 'DealerCardEvent.getResults(isRefresh: $isRefresh, search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetResults &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRefresh, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetResultsCopyWith<_$_GetResults> get copyWith =>
      __$$_GetResultsCopyWithImpl<_$_GetResults>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh, String search) getResults,
    required TResult Function(
            bool? isRefresh, String? mark, String? regionId, String? carType)
        getFilterResult,
    required TResult Function(String? regions, String? maker, String? carType)
        getFilterParams,
    required TResult Function() getMoreResults,
  }) {
    return getResults(isRefresh, search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRefresh, String search)? getResults,
    TResult? Function(
            bool? isRefresh, String? mark, String? regionId, String? carType)?
        getFilterResult,
    TResult? Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult? Function()? getMoreResults,
  }) {
    return getResults?.call(isRefresh, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh, String search)? getResults,
    TResult Function(
            bool? isRefresh, String? mark, String? regionId, String? carType)?
        getFilterResult,
    TResult Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult Function()? getMoreResults,
    required TResult orElse(),
  }) {
    if (getResults != null) {
      return getResults(isRefresh, search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetFilter value) getFilterResult,
    required TResult Function(_GetFilterParams value) getFilterParams,
    required TResult Function(_GetMoreResults value) getMoreResults,
  }) {
    return getResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetFilter value)? getFilterResult,
    TResult? Function(_GetFilterParams value)? getFilterParams,
    TResult? Function(_GetMoreResults value)? getMoreResults,
  }) {
    return getResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetFilter value)? getFilterResult,
    TResult Function(_GetFilterParams value)? getFilterParams,
    TResult Function(_GetMoreResults value)? getMoreResults,
    required TResult orElse(),
  }) {
    if (getResults != null) {
      return getResults(this);
    }
    return orElse();
  }
}

abstract class _GetResults implements DealerCardEvent {
  factory _GetResults(
      {required final bool isRefresh,
      required final String search}) = _$_GetResults;

  bool get isRefresh;
  String get search;
  @JsonKey(ignore: true)
  _$$_GetResultsCopyWith<_$_GetResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetFilterCopyWith<$Res> {
  factory _$$_GetFilterCopyWith(
          _$_GetFilter value, $Res Function(_$_GetFilter) then) =
      __$$_GetFilterCopyWithImpl<$Res>;
  @useResult
  $Res call({bool? isRefresh, String? mark, String? regionId, String? carType});
}

/// @nodoc
class __$$_GetFilterCopyWithImpl<$Res>
    extends _$DealerCardEventCopyWithImpl<$Res, _$_GetFilter>
    implements _$$_GetFilterCopyWith<$Res> {
  __$$_GetFilterCopyWithImpl(
      _$_GetFilter _value, $Res Function(_$_GetFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRefresh = freezed,
    Object? mark = freezed,
    Object? regionId = freezed,
    Object? carType = freezed,
  }) {
    return _then(_$_GetFilter(
      isRefresh: freezed == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool?,
      mark: freezed == mark
          ? _value.mark
          : mark // ignore: cast_nullable_to_non_nullable
              as String?,
      regionId: freezed == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as String?,
      carType: freezed == carType
          ? _value.carType
          : carType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GetFilter implements _GetFilter {
  _$_GetFilter({this.isRefresh, this.mark, this.regionId, this.carType});

  @override
  final bool? isRefresh;
  @override
  final String? mark;
  @override
  final String? regionId;
  @override
  final String? carType;

  @override
  String toString() {
    return 'DealerCardEvent.getFilterResult(isRefresh: $isRefresh, mark: $mark, regionId: $regionId, carType: $carType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetFilter &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.mark, mark) || other.mark == mark) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.carType, carType) || other.carType == carType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isRefresh, mark, regionId, carType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetFilterCopyWith<_$_GetFilter> get copyWith =>
      __$$_GetFilterCopyWithImpl<_$_GetFilter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh, String search) getResults,
    required TResult Function(
            bool? isRefresh, String? mark, String? regionId, String? carType)
        getFilterResult,
    required TResult Function(String? regions, String? maker, String? carType)
        getFilterParams,
    required TResult Function() getMoreResults,
  }) {
    return getFilterResult(isRefresh, mark, regionId, carType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRefresh, String search)? getResults,
    TResult? Function(
            bool? isRefresh, String? mark, String? regionId, String? carType)?
        getFilterResult,
    TResult? Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult? Function()? getMoreResults,
  }) {
    return getFilterResult?.call(isRefresh, mark, regionId, carType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh, String search)? getResults,
    TResult Function(
            bool? isRefresh, String? mark, String? regionId, String? carType)?
        getFilterResult,
    TResult Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult Function()? getMoreResults,
    required TResult orElse(),
  }) {
    if (getFilterResult != null) {
      return getFilterResult(isRefresh, mark, regionId, carType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetFilter value) getFilterResult,
    required TResult Function(_GetFilterParams value) getFilterParams,
    required TResult Function(_GetMoreResults value) getMoreResults,
  }) {
    return getFilterResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetFilter value)? getFilterResult,
    TResult? Function(_GetFilterParams value)? getFilterParams,
    TResult? Function(_GetMoreResults value)? getMoreResults,
  }) {
    return getFilterResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetFilter value)? getFilterResult,
    TResult Function(_GetFilterParams value)? getFilterParams,
    TResult Function(_GetMoreResults value)? getMoreResults,
    required TResult orElse(),
  }) {
    if (getFilterResult != null) {
      return getFilterResult(this);
    }
    return orElse();
  }
}

abstract class _GetFilter implements DealerCardEvent {
  factory _GetFilter(
      {final bool? isRefresh,
      final String? mark,
      final String? regionId,
      final String? carType}) = _$_GetFilter;

  bool? get isRefresh;
  String? get mark;
  String? get regionId;
  String? get carType;
  @JsonKey(ignore: true)
  _$$_GetFilterCopyWith<_$_GetFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetFilterParamsCopyWith<$Res> {
  factory _$$_GetFilterParamsCopyWith(
          _$_GetFilterParams value, $Res Function(_$_GetFilterParams) then) =
      __$$_GetFilterParamsCopyWithImpl<$Res>;
  @useResult
  $Res call({String? regions, String? maker, String? carType});
}

/// @nodoc
class __$$_GetFilterParamsCopyWithImpl<$Res>
    extends _$DealerCardEventCopyWithImpl<$Res, _$_GetFilterParams>
    implements _$$_GetFilterParamsCopyWith<$Res> {
  __$$_GetFilterParamsCopyWithImpl(
      _$_GetFilterParams _value, $Res Function(_$_GetFilterParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regions = freezed,
    Object? maker = freezed,
    Object? carType = freezed,
  }) {
    return _then(_$_GetFilterParams(
      regions: freezed == regions
          ? _value.regions
          : regions // ignore: cast_nullable_to_non_nullable
              as String?,
      maker: freezed == maker
          ? _value.maker
          : maker // ignore: cast_nullable_to_non_nullable
              as String?,
      carType: freezed == carType
          ? _value.carType
          : carType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GetFilterParams implements _GetFilterParams {
  _$_GetFilterParams({this.regions, this.maker, this.carType});

  @override
  final String? regions;
  @override
  final String? maker;
  @override
  final String? carType;

  @override
  String toString() {
    return 'DealerCardEvent.getFilterParams(regions: $regions, maker: $maker, carType: $carType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetFilterParams &&
            (identical(other.regions, regions) || other.regions == regions) &&
            (identical(other.maker, maker) || other.maker == maker) &&
            (identical(other.carType, carType) || other.carType == carType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, regions, maker, carType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetFilterParamsCopyWith<_$_GetFilterParams> get copyWith =>
      __$$_GetFilterParamsCopyWithImpl<_$_GetFilterParams>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh, String search) getResults,
    required TResult Function(
            bool? isRefresh, String? mark, String? regionId, String? carType)
        getFilterResult,
    required TResult Function(String? regions, String? maker, String? carType)
        getFilterParams,
    required TResult Function() getMoreResults,
  }) {
    return getFilterParams(regions, maker, carType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRefresh, String search)? getResults,
    TResult? Function(
            bool? isRefresh, String? mark, String? regionId, String? carType)?
        getFilterResult,
    TResult? Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult? Function()? getMoreResults,
  }) {
    return getFilterParams?.call(regions, maker, carType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh, String search)? getResults,
    TResult Function(
            bool? isRefresh, String? mark, String? regionId, String? carType)?
        getFilterResult,
    TResult Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult Function()? getMoreResults,
    required TResult orElse(),
  }) {
    if (getFilterParams != null) {
      return getFilterParams(regions, maker, carType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetFilter value) getFilterResult,
    required TResult Function(_GetFilterParams value) getFilterParams,
    required TResult Function(_GetMoreResults value) getMoreResults,
  }) {
    return getFilterParams(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetFilter value)? getFilterResult,
    TResult? Function(_GetFilterParams value)? getFilterParams,
    TResult? Function(_GetMoreResults value)? getMoreResults,
  }) {
    return getFilterParams?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetFilter value)? getFilterResult,
    TResult Function(_GetFilterParams value)? getFilterParams,
    TResult Function(_GetMoreResults value)? getMoreResults,
    required TResult orElse(),
  }) {
    if (getFilterParams != null) {
      return getFilterParams(this);
    }
    return orElse();
  }
}

abstract class _GetFilterParams implements DealerCardEvent {
  factory _GetFilterParams(
      {final String? regions,
      final String? maker,
      final String? carType}) = _$_GetFilterParams;

  String? get regions;
  String? get maker;
  String? get carType;
  @JsonKey(ignore: true)
  _$$_GetFilterParamsCopyWith<_$_GetFilterParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMoreResultsCopyWith<$Res> {
  factory _$$_GetMoreResultsCopyWith(
          _$_GetMoreResults value, $Res Function(_$_GetMoreResults) then) =
      __$$_GetMoreResultsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMoreResultsCopyWithImpl<$Res>
    extends _$DealerCardEventCopyWithImpl<$Res, _$_GetMoreResults>
    implements _$$_GetMoreResultsCopyWith<$Res> {
  __$$_GetMoreResultsCopyWithImpl(
      _$_GetMoreResults _value, $Res Function(_$_GetMoreResults) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetMoreResults implements _GetMoreResults {
  _$_GetMoreResults();

  @override
  String toString() {
    return 'DealerCardEvent.getMoreResults()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMoreResults);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh, String search) getResults,
    required TResult Function(
            bool? isRefresh, String? mark, String? regionId, String? carType)
        getFilterResult,
    required TResult Function(String? regions, String? maker, String? carType)
        getFilterParams,
    required TResult Function() getMoreResults,
  }) {
    return getMoreResults();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRefresh, String search)? getResults,
    TResult? Function(
            bool? isRefresh, String? mark, String? regionId, String? carType)?
        getFilterResult,
    TResult? Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult? Function()? getMoreResults,
  }) {
    return getMoreResults?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh, String search)? getResults,
    TResult Function(
            bool? isRefresh, String? mark, String? regionId, String? carType)?
        getFilterResult,
    TResult Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult Function()? getMoreResults,
    required TResult orElse(),
  }) {
    if (getMoreResults != null) {
      return getMoreResults();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetFilter value) getFilterResult,
    required TResult Function(_GetFilterParams value) getFilterParams,
    required TResult Function(_GetMoreResults value) getMoreResults,
  }) {
    return getMoreResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetFilter value)? getFilterResult,
    TResult? Function(_GetFilterParams value)? getFilterParams,
    TResult? Function(_GetMoreResults value)? getMoreResults,
  }) {
    return getMoreResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetFilter value)? getFilterResult,
    TResult Function(_GetFilterParams value)? getFilterParams,
    TResult Function(_GetMoreResults value)? getMoreResults,
    required TResult orElse(),
  }) {
    if (getMoreResults != null) {
      return getMoreResults(this);
    }
    return orElse();
  }
}

abstract class _GetMoreResults implements DealerCardEvent {
  factory _GetMoreResults() = _$_GetMoreResults;
}

/// @nodoc
mixin _$DealerCardState {
  List<DealerCardEntity> get list => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  FormzStatus get paginationStatus => throw _privateConstructorUsedError;
  String get maker => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  String get carType => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DealerCardStateCopyWith<DealerCardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DealerCardStateCopyWith<$Res> {
  factory $DealerCardStateCopyWith(
          DealerCardState value, $Res Function(DealerCardState) then) =
      _$DealerCardStateCopyWithImpl<$Res, DealerCardState>;
  @useResult
  $Res call(
      {List<DealerCardEntity> list,
      FormzStatus status,
      FormzStatus paginationStatus,
      String maker,
      String region,
      String carType,
      String? next,
      int count});
}

/// @nodoc
class _$DealerCardStateCopyWithImpl<$Res, $Val extends DealerCardState>
    implements $DealerCardStateCopyWith<$Res> {
  _$DealerCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? status = null,
    Object? paginationStatus = null,
    Object? maker = null,
    Object? region = null,
    Object? carType = null,
    Object? next = freezed,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<DealerCardEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      paginationStatus: null == paginationStatus
          ? _value.paginationStatus
          : paginationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      maker: null == maker
          ? _value.maker
          : maker // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      carType: null == carType
          ? _value.carType
          : carType // ignore: cast_nullable_to_non_nullable
              as String,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DealerCardStateCopyWith<$Res>
    implements $DealerCardStateCopyWith<$Res> {
  factory _$$_DealerCardStateCopyWith(
          _$_DealerCardState value, $Res Function(_$_DealerCardState) then) =
      __$$_DealerCardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DealerCardEntity> list,
      FormzStatus status,
      FormzStatus paginationStatus,
      String maker,
      String region,
      String carType,
      String? next,
      int count});
}

/// @nodoc
class __$$_DealerCardStateCopyWithImpl<$Res>
    extends _$DealerCardStateCopyWithImpl<$Res, _$_DealerCardState>
    implements _$$_DealerCardStateCopyWith<$Res> {
  __$$_DealerCardStateCopyWithImpl(
      _$_DealerCardState _value, $Res Function(_$_DealerCardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? status = null,
    Object? paginationStatus = null,
    Object? maker = null,
    Object? region = null,
    Object? carType = null,
    Object? next = freezed,
    Object? count = null,
  }) {
    return _then(_$_DealerCardState(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<DealerCardEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      paginationStatus: null == paginationStatus
          ? _value.paginationStatus
          : paginationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      maker: null == maker
          ? _value.maker
          : maker // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      carType: null == carType
          ? _value.carType
          : carType // ignore: cast_nullable_to_non_nullable
              as String,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DealerCardState implements _DealerCardState {
  _$_DealerCardState(
      {final List<DealerCardEntity> list = const [],
      this.status = FormzStatus.pure,
      this.paginationStatus = FormzStatus.pure,
      this.maker = '',
      this.region = '',
      this.carType = '',
      this.next,
      this.count = 0})
      : _list = list;

  final List<DealerCardEntity> _list;
  @override
  @JsonKey()
  List<DealerCardEntity> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final FormzStatus paginationStatus;
  @override
  @JsonKey()
  final String maker;
  @override
  @JsonKey()
  final String region;
  @override
  @JsonKey()
  final String carType;
  @override
  final String? next;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'DealerCardState(list: $list, status: $status, paginationStatus: $paginationStatus, maker: $maker, region: $region, carType: $carType, next: $next, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DealerCardState &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paginationStatus, paginationStatus) ||
                other.paginationStatus == paginationStatus) &&
            (identical(other.maker, maker) || other.maker == maker) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.carType, carType) || other.carType == carType) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_list),
      status,
      paginationStatus,
      maker,
      region,
      carType,
      next,
      count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DealerCardStateCopyWith<_$_DealerCardState> get copyWith =>
      __$$_DealerCardStateCopyWithImpl<_$_DealerCardState>(this, _$identity);
}

abstract class _DealerCardState implements DealerCardState {
  factory _DealerCardState(
      {final List<DealerCardEntity> list,
      final FormzStatus status,
      final FormzStatus paginationStatus,
      final String maker,
      final String region,
      final String carType,
      final String? next,
      final int count}) = _$_DealerCardState;

  @override
  List<DealerCardEntity> get list;
  @override
  FormzStatus get status;
  @override
  FormzStatus get paginationStatus;
  @override
  String get maker;
  @override
  String get region;
  @override
  String get carType;
  @override
  String? get next;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_DealerCardStateCopyWith<_$_DealerCardState> get copyWith =>
      throw _privateConstructorUsedError;
}
