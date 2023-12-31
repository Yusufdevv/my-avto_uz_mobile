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
    required TResult Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)
        getResults,
    required TResult Function(String? regions, String? maker, String? carType)
        getFilterParams,
    required TResult Function(int index) changeTabIndex,
    required TResult Function() getMoreResults,
    required TResult Function(int id) watchContact,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)?
        getResults,
    TResult? Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult? Function(int index)? changeTabIndex,
    TResult? Function()? getMoreResults,
    TResult? Function(int id)? watchContact,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)?
        getResults,
    TResult Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult Function(int index)? changeTabIndex,
    TResult Function()? getMoreResults,
    TResult Function(int id)? watchContact,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetFilterParams value) getFilterParams,
    required TResult Function(_ChangeTabIndex value) changeTabIndex,
    required TResult Function(_GetMoreResults value) getMoreResults,
    required TResult Function(_WatchContact value) watchContact,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetFilterParams value)? getFilterParams,
    TResult? Function(_ChangeTabIndex value)? changeTabIndex,
    TResult? Function(_GetMoreResults value)? getMoreResults,
    TResult? Function(_WatchContact value)? watchContact,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetFilterParams value)? getFilterParams,
    TResult Function(_ChangeTabIndex value)? changeTabIndex,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_WatchContact value)? watchContact,
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
  $Res call(
      {bool isRefresh,
      String search,
      ValueChanged<List<DealerCardEntity>> onSuccess,
      int? mark,
      String? regionId,
      String? carType});
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
    Object? onSuccess = null,
    Object? mark = freezed,
    Object? regionId = freezed,
    Object? carType = freezed,
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
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as ValueChanged<List<DealerCardEntity>>,
      mark: freezed == mark
          ? _value.mark
          : mark // ignore: cast_nullable_to_non_nullable
              as int?,
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

class _$_GetResults implements _GetResults {
  _$_GetResults(
      {required this.isRefresh,
      required this.search,
      required this.onSuccess,
      this.mark,
      this.regionId,
      this.carType});

  @override
  final bool isRefresh;
  @override
  final String search;
  @override
  final ValueChanged<List<DealerCardEntity>> onSuccess;
  @override
  final int? mark;
  @override
  final String? regionId;
  @override
  final String? carType;

  @override
  String toString() {
    return 'DealerCardEvent.getResults(isRefresh: $isRefresh, search: $search, onSuccess: $onSuccess, mark: $mark, regionId: $regionId, carType: $carType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetResults &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess) &&
            (identical(other.mark, mark) || other.mark == mark) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.carType, carType) || other.carType == carType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isRefresh, search, onSuccess, mark, regionId, carType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetResultsCopyWith<_$_GetResults> get copyWith =>
      __$$_GetResultsCopyWithImpl<_$_GetResults>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)
        getResults,
    required TResult Function(String? regions, String? maker, String? carType)
        getFilterParams,
    required TResult Function(int index) changeTabIndex,
    required TResult Function() getMoreResults,
    required TResult Function(int id) watchContact,
  }) {
    return getResults(isRefresh, search, onSuccess, mark, regionId, carType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)?
        getResults,
    TResult? Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult? Function(int index)? changeTabIndex,
    TResult? Function()? getMoreResults,
    TResult? Function(int id)? watchContact,
  }) {
    return getResults?.call(
        isRefresh, search, onSuccess, mark, regionId, carType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)?
        getResults,
    TResult Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult Function(int index)? changeTabIndex,
    TResult Function()? getMoreResults,
    TResult Function(int id)? watchContact,
    required TResult orElse(),
  }) {
    if (getResults != null) {
      return getResults(isRefresh, search, onSuccess, mark, regionId, carType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetFilterParams value) getFilterParams,
    required TResult Function(_ChangeTabIndex value) changeTabIndex,
    required TResult Function(_GetMoreResults value) getMoreResults,
    required TResult Function(_WatchContact value) watchContact,
  }) {
    return getResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetFilterParams value)? getFilterParams,
    TResult? Function(_ChangeTabIndex value)? changeTabIndex,
    TResult? Function(_GetMoreResults value)? getMoreResults,
    TResult? Function(_WatchContact value)? watchContact,
  }) {
    return getResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetFilterParams value)? getFilterParams,
    TResult Function(_ChangeTabIndex value)? changeTabIndex,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_WatchContact value)? watchContact,
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
      required final String search,
      required final ValueChanged<List<DealerCardEntity>> onSuccess,
      final int? mark,
      final String? regionId,
      final String? carType}) = _$_GetResults;

  bool get isRefresh;
  String get search;
  ValueChanged<List<DealerCardEntity>> get onSuccess;
  int? get mark;
  String? get regionId;
  String? get carType;
  @JsonKey(ignore: true)
  _$$_GetResultsCopyWith<_$_GetResults> get copyWith =>
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
    required TResult Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)
        getResults,
    required TResult Function(String? regions, String? maker, String? carType)
        getFilterParams,
    required TResult Function(int index) changeTabIndex,
    required TResult Function() getMoreResults,
    required TResult Function(int id) watchContact,
  }) {
    return getFilterParams(regions, maker, carType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)?
        getResults,
    TResult? Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult? Function(int index)? changeTabIndex,
    TResult? Function()? getMoreResults,
    TResult? Function(int id)? watchContact,
  }) {
    return getFilterParams?.call(regions, maker, carType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)?
        getResults,
    TResult Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult Function(int index)? changeTabIndex,
    TResult Function()? getMoreResults,
    TResult Function(int id)? watchContact,
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
    required TResult Function(_GetFilterParams value) getFilterParams,
    required TResult Function(_ChangeTabIndex value) changeTabIndex,
    required TResult Function(_GetMoreResults value) getMoreResults,
    required TResult Function(_WatchContact value) watchContact,
  }) {
    return getFilterParams(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetFilterParams value)? getFilterParams,
    TResult? Function(_ChangeTabIndex value)? changeTabIndex,
    TResult? Function(_GetMoreResults value)? getMoreResults,
    TResult? Function(_WatchContact value)? watchContact,
  }) {
    return getFilterParams?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetFilterParams value)? getFilterParams,
    TResult Function(_ChangeTabIndex value)? changeTabIndex,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_WatchContact value)? watchContact,
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
abstract class _$$_ChangeTabIndexCopyWith<$Res> {
  factory _$$_ChangeTabIndexCopyWith(
          _$_ChangeTabIndex value, $Res Function(_$_ChangeTabIndex) then) =
      __$$_ChangeTabIndexCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_ChangeTabIndexCopyWithImpl<$Res>
    extends _$DealerCardEventCopyWithImpl<$Res, _$_ChangeTabIndex>
    implements _$$_ChangeTabIndexCopyWith<$Res> {
  __$$_ChangeTabIndexCopyWithImpl(
      _$_ChangeTabIndex _value, $Res Function(_$_ChangeTabIndex) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_ChangeTabIndex(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChangeTabIndex implements _ChangeTabIndex {
  _$_ChangeTabIndex({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'DealerCardEvent.changeTabIndex(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeTabIndex &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeTabIndexCopyWith<_$_ChangeTabIndex> get copyWith =>
      __$$_ChangeTabIndexCopyWithImpl<_$_ChangeTabIndex>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)
        getResults,
    required TResult Function(String? regions, String? maker, String? carType)
        getFilterParams,
    required TResult Function(int index) changeTabIndex,
    required TResult Function() getMoreResults,
    required TResult Function(int id) watchContact,
  }) {
    return changeTabIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)?
        getResults,
    TResult? Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult? Function(int index)? changeTabIndex,
    TResult? Function()? getMoreResults,
    TResult? Function(int id)? watchContact,
  }) {
    return changeTabIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)?
        getResults,
    TResult Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult Function(int index)? changeTabIndex,
    TResult Function()? getMoreResults,
    TResult Function(int id)? watchContact,
    required TResult orElse(),
  }) {
    if (changeTabIndex != null) {
      return changeTabIndex(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetFilterParams value) getFilterParams,
    required TResult Function(_ChangeTabIndex value) changeTabIndex,
    required TResult Function(_GetMoreResults value) getMoreResults,
    required TResult Function(_WatchContact value) watchContact,
  }) {
    return changeTabIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetFilterParams value)? getFilterParams,
    TResult? Function(_ChangeTabIndex value)? changeTabIndex,
    TResult? Function(_GetMoreResults value)? getMoreResults,
    TResult? Function(_WatchContact value)? watchContact,
  }) {
    return changeTabIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetFilterParams value)? getFilterParams,
    TResult Function(_ChangeTabIndex value)? changeTabIndex,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_WatchContact value)? watchContact,
    required TResult orElse(),
  }) {
    if (changeTabIndex != null) {
      return changeTabIndex(this);
    }
    return orElse();
  }
}

abstract class _ChangeTabIndex implements DealerCardEvent {
  factory _ChangeTabIndex({required final int index}) = _$_ChangeTabIndex;

  int get index;
  @JsonKey(ignore: true)
  _$$_ChangeTabIndexCopyWith<_$_ChangeTabIndex> get copyWith =>
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
    required TResult Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)
        getResults,
    required TResult Function(String? regions, String? maker, String? carType)
        getFilterParams,
    required TResult Function(int index) changeTabIndex,
    required TResult Function() getMoreResults,
    required TResult Function(int id) watchContact,
  }) {
    return getMoreResults();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)?
        getResults,
    TResult? Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult? Function(int index)? changeTabIndex,
    TResult? Function()? getMoreResults,
    TResult? Function(int id)? watchContact,
  }) {
    return getMoreResults?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)?
        getResults,
    TResult Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult Function(int index)? changeTabIndex,
    TResult Function()? getMoreResults,
    TResult Function(int id)? watchContact,
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
    required TResult Function(_GetFilterParams value) getFilterParams,
    required TResult Function(_ChangeTabIndex value) changeTabIndex,
    required TResult Function(_GetMoreResults value) getMoreResults,
    required TResult Function(_WatchContact value) watchContact,
  }) {
    return getMoreResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetFilterParams value)? getFilterParams,
    TResult? Function(_ChangeTabIndex value)? changeTabIndex,
    TResult? Function(_GetMoreResults value)? getMoreResults,
    TResult? Function(_WatchContact value)? watchContact,
  }) {
    return getMoreResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetFilterParams value)? getFilterParams,
    TResult Function(_ChangeTabIndex value)? changeTabIndex,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_WatchContact value)? watchContact,
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
abstract class _$$_WatchContactCopyWith<$Res> {
  factory _$$_WatchContactCopyWith(
          _$_WatchContact value, $Res Function(_$_WatchContact) then) =
      __$$_WatchContactCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_WatchContactCopyWithImpl<$Res>
    extends _$DealerCardEventCopyWithImpl<$Res, _$_WatchContact>
    implements _$$_WatchContactCopyWith<$Res> {
  __$$_WatchContactCopyWithImpl(
      _$_WatchContact _value, $Res Function(_$_WatchContact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_WatchContact(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_WatchContact implements _WatchContact {
  _$_WatchContact({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'DealerCardEvent.watchContact(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WatchContact &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WatchContactCopyWith<_$_WatchContact> get copyWith =>
      __$$_WatchContactCopyWithImpl<_$_WatchContact>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)
        getResults,
    required TResult Function(String? regions, String? maker, String? carType)
        getFilterParams,
    required TResult Function(int index) changeTabIndex,
    required TResult Function() getMoreResults,
    required TResult Function(int id) watchContact,
  }) {
    return watchContact(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)?
        getResults,
    TResult? Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult? Function(int index)? changeTabIndex,
    TResult? Function()? getMoreResults,
    TResult? Function(int id)? watchContact,
  }) {
    return watchContact?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isRefresh,
            String search,
            ValueChanged<List<DealerCardEntity>> onSuccess,
            int? mark,
            String? regionId,
            String? carType)?
        getResults,
    TResult Function(String? regions, String? maker, String? carType)?
        getFilterParams,
    TResult Function(int index)? changeTabIndex,
    TResult Function()? getMoreResults,
    TResult Function(int id)? watchContact,
    required TResult orElse(),
  }) {
    if (watchContact != null) {
      return watchContact(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetFilterParams value) getFilterParams,
    required TResult Function(_ChangeTabIndex value) changeTabIndex,
    required TResult Function(_GetMoreResults value) getMoreResults,
    required TResult Function(_WatchContact value) watchContact,
  }) {
    return watchContact(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetFilterParams value)? getFilterParams,
    TResult? Function(_ChangeTabIndex value)? changeTabIndex,
    TResult? Function(_GetMoreResults value)? getMoreResults,
    TResult? Function(_WatchContact value)? watchContact,
  }) {
    return watchContact?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetFilterParams value)? getFilterParams,
    TResult Function(_ChangeTabIndex value)? changeTabIndex,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_WatchContact value)? watchContact,
    required TResult orElse(),
  }) {
    if (watchContact != null) {
      return watchContact(this);
    }
    return orElse();
  }
}

abstract class _WatchContact implements DealerCardEvent {
  factory _WatchContact({required final int id}) = _$_WatchContact;

  int get id;
  @JsonKey(ignore: true)
  _$$_WatchContactCopyWith<_$_WatchContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DealerCardState {
  List<DealerCardEntity> get list => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  FormzStatus get paginationStatus => throw _privateConstructorUsedError;
  String get maker => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  String get carType => throw _privateConstructorUsedError;
  bool? get isIndexOne => throw _privateConstructorUsedError;
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
      bool? isIndexOne,
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
    Object? isIndexOne = freezed,
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
      isIndexOne: freezed == isIndexOne
          ? _value.isIndexOne
          : isIndexOne // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      bool? isIndexOne,
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
    Object? isIndexOne = freezed,
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
      isIndexOne: freezed == isIndexOne
          ? _value.isIndexOne
          : isIndexOne // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      this.isIndexOne = false,
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
  @JsonKey()
  final bool? isIndexOne;
  @override
  final String? next;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'DealerCardState(list: $list, status: $status, paginationStatus: $paginationStatus, maker: $maker, region: $region, carType: $carType, isIndexOne: $isIndexOne, next: $next, count: $count)';
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
            (identical(other.isIndexOne, isIndexOne) ||
                other.isIndexOne == isIndexOne) &&
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
      isIndexOne,
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
      final bool? isIndexOne,
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
  bool? get isIndexOne;
  @override
  String? get next;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_DealerCardStateCopyWith<_$_DealerCardState> get copyWith =>
      throw _privateConstructorUsedError;
}
