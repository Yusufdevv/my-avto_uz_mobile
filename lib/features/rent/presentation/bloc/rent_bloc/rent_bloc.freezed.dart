// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rent_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh) getResults,
    required TResult Function(int id, int? hasAirConditioner, int? hasBabySeat,
            int? rentCarIsClean, int? rentCarIsFullFuel)
        setId,
    required TResult Function() getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRefresh)? getResults,
    TResult? Function(int id, int? hasAirConditioner, int? hasBabySeat,
            int? rentCarIsClean, int? rentCarIsFullFuel)?
        setId,
    TResult? Function()? getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh)? getResults,
    TResult Function(int id, int? hasAirConditioner, int? hasBabySeat,
            int? rentCarIsClean, int? rentCarIsFullFuel)?
        setId,
    TResult Function()? getMoreResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_SetId value) setId,
    required TResult Function(_GetMoreResults value) getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_SetId value)? setId,
    TResult? Function(_GetMoreResults value)? getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_SetId value)? setId,
    TResult Function(_GetMoreResults value)? getMoreResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentEventCopyWith<$Res> {
  factory $RentEventCopyWith(RentEvent value, $Res Function(RentEvent) then) =
      _$RentEventCopyWithImpl<$Res, RentEvent>;
}

/// @nodoc
class _$RentEventCopyWithImpl<$Res, $Val extends RentEvent>
    implements $RentEventCopyWith<$Res> {
  _$RentEventCopyWithImpl(this._value, this._then);

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
  $Res call({bool isRefresh});
}

/// @nodoc
class __$$_GetResultsCopyWithImpl<$Res>
    extends _$RentEventCopyWithImpl<$Res, _$_GetResults>
    implements _$$_GetResultsCopyWith<$Res> {
  __$$_GetResultsCopyWithImpl(
      _$_GetResults _value, $Res Function(_$_GetResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRefresh = null,
  }) {
    return _then(_$_GetResults(
      isRefresh: null == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GetResults implements _GetResults {
  _$_GetResults({required this.isRefresh});

  @override
  final bool isRefresh;

  @override
  String toString() {
    return 'RentEvent.getResults(isRefresh: $isRefresh)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetResults &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRefresh);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetResultsCopyWith<_$_GetResults> get copyWith =>
      __$$_GetResultsCopyWithImpl<_$_GetResults>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh) getResults,
    required TResult Function(int id, int? hasAirConditioner, int? hasBabySeat,
            int? rentCarIsClean, int? rentCarIsFullFuel)
        setId,
    required TResult Function() getMoreResults,
  }) {
    return getResults(isRefresh);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRefresh)? getResults,
    TResult? Function(int id, int? hasAirConditioner, int? hasBabySeat,
            int? rentCarIsClean, int? rentCarIsFullFuel)?
        setId,
    TResult? Function()? getMoreResults,
  }) {
    return getResults?.call(isRefresh);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh)? getResults,
    TResult Function(int id, int? hasAirConditioner, int? hasBabySeat,
            int? rentCarIsClean, int? rentCarIsFullFuel)?
        setId,
    TResult Function()? getMoreResults,
    required TResult orElse(),
  }) {
    if (getResults != null) {
      return getResults(isRefresh);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_SetId value) setId,
    required TResult Function(_GetMoreResults value) getMoreResults,
  }) {
    return getResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_SetId value)? setId,
    TResult? Function(_GetMoreResults value)? getMoreResults,
  }) {
    return getResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_SetId value)? setId,
    TResult Function(_GetMoreResults value)? getMoreResults,
    required TResult orElse(),
  }) {
    if (getResults != null) {
      return getResults(this);
    }
    return orElse();
  }
}

abstract class _GetResults implements RentEvent {
  factory _GetResults({required final bool isRefresh}) = _$_GetResults;

  bool get isRefresh;
  @JsonKey(ignore: true)
  _$$_GetResultsCopyWith<_$_GetResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetIdCopyWith<$Res> {
  factory _$$_SetIdCopyWith(_$_SetId value, $Res Function(_$_SetId) then) =
      __$$_SetIdCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id,
      int? hasAirConditioner,
      int? hasBabySeat,
      int? rentCarIsClean,
      int? rentCarIsFullFuel});
}

/// @nodoc
class __$$_SetIdCopyWithImpl<$Res>
    extends _$RentEventCopyWithImpl<$Res, _$_SetId>
    implements _$$_SetIdCopyWith<$Res> {
  __$$_SetIdCopyWithImpl(_$_SetId _value, $Res Function(_$_SetId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hasAirConditioner = freezed,
    Object? hasBabySeat = freezed,
    Object? rentCarIsClean = freezed,
    Object? rentCarIsFullFuel = freezed,
  }) {
    return _then(_$_SetId(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hasAirConditioner: freezed == hasAirConditioner
          ? _value.hasAirConditioner
          : hasAirConditioner // ignore: cast_nullable_to_non_nullable
              as int?,
      hasBabySeat: freezed == hasBabySeat
          ? _value.hasBabySeat
          : hasBabySeat // ignore: cast_nullable_to_non_nullable
              as int?,
      rentCarIsClean: freezed == rentCarIsClean
          ? _value.rentCarIsClean
          : rentCarIsClean // ignore: cast_nullable_to_non_nullable
              as int?,
      rentCarIsFullFuel: freezed == rentCarIsFullFuel
          ? _value.rentCarIsFullFuel
          : rentCarIsFullFuel // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_SetId implements _SetId {
  _$_SetId(
      {required this.id,
      this.hasAirConditioner,
      this.hasBabySeat,
      this.rentCarIsClean,
      this.rentCarIsFullFuel});

  @override
  final int id;
  @override
  final int? hasAirConditioner;
  @override
  final int? hasBabySeat;
  @override
  final int? rentCarIsClean;
  @override
  final int? rentCarIsFullFuel;

  @override
  String toString() {
    return 'RentEvent.setId(id: $id, hasAirConditioner: $hasAirConditioner, hasBabySeat: $hasBabySeat, rentCarIsClean: $rentCarIsClean, rentCarIsFullFuel: $rentCarIsFullFuel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetId &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hasAirConditioner, hasAirConditioner) ||
                other.hasAirConditioner == hasAirConditioner) &&
            (identical(other.hasBabySeat, hasBabySeat) ||
                other.hasBabySeat == hasBabySeat) &&
            (identical(other.rentCarIsClean, rentCarIsClean) ||
                other.rentCarIsClean == rentCarIsClean) &&
            (identical(other.rentCarIsFullFuel, rentCarIsFullFuel) ||
                other.rentCarIsFullFuel == rentCarIsFullFuel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, hasAirConditioner,
      hasBabySeat, rentCarIsClean, rentCarIsFullFuel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetIdCopyWith<_$_SetId> get copyWith =>
      __$$_SetIdCopyWithImpl<_$_SetId>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh) getResults,
    required TResult Function(int id, int? hasAirConditioner, int? hasBabySeat,
            int? rentCarIsClean, int? rentCarIsFullFuel)
        setId,
    required TResult Function() getMoreResults,
  }) {
    return setId(
        id, hasAirConditioner, hasBabySeat, rentCarIsClean, rentCarIsFullFuel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRefresh)? getResults,
    TResult? Function(int id, int? hasAirConditioner, int? hasBabySeat,
            int? rentCarIsClean, int? rentCarIsFullFuel)?
        setId,
    TResult? Function()? getMoreResults,
  }) {
    return setId?.call(
        id, hasAirConditioner, hasBabySeat, rentCarIsClean, rentCarIsFullFuel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh)? getResults,
    TResult Function(int id, int? hasAirConditioner, int? hasBabySeat,
            int? rentCarIsClean, int? rentCarIsFullFuel)?
        setId,
    TResult Function()? getMoreResults,
    required TResult orElse(),
  }) {
    if (setId != null) {
      return setId(id, hasAirConditioner, hasBabySeat, rentCarIsClean,
          rentCarIsFullFuel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_SetId value) setId,
    required TResult Function(_GetMoreResults value) getMoreResults,
  }) {
    return setId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_SetId value)? setId,
    TResult? Function(_GetMoreResults value)? getMoreResults,
  }) {
    return setId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_SetId value)? setId,
    TResult Function(_GetMoreResults value)? getMoreResults,
    required TResult orElse(),
  }) {
    if (setId != null) {
      return setId(this);
    }
    return orElse();
  }
}

abstract class _SetId implements RentEvent {
  factory _SetId(
      {required final int id,
      final int? hasAirConditioner,
      final int? hasBabySeat,
      final int? rentCarIsClean,
      final int? rentCarIsFullFuel}) = _$_SetId;

  int get id;
  int? get hasAirConditioner;
  int? get hasBabySeat;
  int? get rentCarIsClean;
  int? get rentCarIsFullFuel;
  @JsonKey(ignore: true)
  _$$_SetIdCopyWith<_$_SetId> get copyWith =>
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
    extends _$RentEventCopyWithImpl<$Res, _$_GetMoreResults>
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
    return 'RentEvent.getMoreResults()';
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
    required TResult Function(bool isRefresh) getResults,
    required TResult Function(int id, int? hasAirConditioner, int? hasBabySeat,
            int? rentCarIsClean, int? rentCarIsFullFuel)
        setId,
    required TResult Function() getMoreResults,
  }) {
    return getMoreResults();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRefresh)? getResults,
    TResult? Function(int id, int? hasAirConditioner, int? hasBabySeat,
            int? rentCarIsClean, int? rentCarIsFullFuel)?
        setId,
    TResult? Function()? getMoreResults,
  }) {
    return getMoreResults?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh)? getResults,
    TResult Function(int id, int? hasAirConditioner, int? hasBabySeat,
            int? rentCarIsClean, int? rentCarIsFullFuel)?
        setId,
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
    required TResult Function(_SetId value) setId,
    required TResult Function(_GetMoreResults value) getMoreResults,
  }) {
    return getMoreResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_SetId value)? setId,
    TResult? Function(_GetMoreResults value)? getMoreResults,
  }) {
    return getMoreResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_SetId value)? setId,
    TResult Function(_GetMoreResults value)? getMoreResults,
    required TResult orElse(),
  }) {
    if (getMoreResults != null) {
      return getMoreResults(this);
    }
    return orElse();
  }
}

abstract class _GetMoreResults implements RentEvent {
  factory _GetMoreResults() = _$_GetMoreResults;
}

/// @nodoc
mixin _$RentState {
  List<RentMainEntity> get list => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  FormzStatus get paginationStatus => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  int get hasAirConditioners => throw _privateConstructorUsedError;
  int get hasBabySeat => throw _privateConstructorUsedError;
  int get rentCarIsClean => throw _privateConstructorUsedError;
  int get rentCarIsFullFuel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RentStateCopyWith<RentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentStateCopyWith<$Res> {
  factory $RentStateCopyWith(RentState value, $Res Function(RentState) then) =
      _$RentStateCopyWithImpl<$Res, RentState>;
  @useResult
  $Res call(
      {List<RentMainEntity> list,
      FormzStatus status,
      FormzStatus paginationStatus,
      String? next,
      int count,
      int categoryId,
      int hasAirConditioners,
      int hasBabySeat,
      int rentCarIsClean,
      int rentCarIsFullFuel});
}

/// @nodoc
class _$RentStateCopyWithImpl<$Res, $Val extends RentState>
    implements $RentStateCopyWith<$Res> {
  _$RentStateCopyWithImpl(this._value, this._then);

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
    Object? next = freezed,
    Object? count = null,
    Object? categoryId = null,
    Object? hasAirConditioners = null,
    Object? hasBabySeat = null,
    Object? rentCarIsClean = null,
    Object? rentCarIsFullFuel = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<RentMainEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      paginationStatus: null == paginationStatus
          ? _value.paginationStatus
          : paginationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      hasAirConditioners: null == hasAirConditioners
          ? _value.hasAirConditioners
          : hasAirConditioners // ignore: cast_nullable_to_non_nullable
              as int,
      hasBabySeat: null == hasBabySeat
          ? _value.hasBabySeat
          : hasBabySeat // ignore: cast_nullable_to_non_nullable
              as int,
      rentCarIsClean: null == rentCarIsClean
          ? _value.rentCarIsClean
          : rentCarIsClean // ignore: cast_nullable_to_non_nullable
              as int,
      rentCarIsFullFuel: null == rentCarIsFullFuel
          ? _value.rentCarIsFullFuel
          : rentCarIsFullFuel // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RentStateCopyWith<$Res> implements $RentStateCopyWith<$Res> {
  factory _$$_RentStateCopyWith(
          _$_RentState value, $Res Function(_$_RentState) then) =
      __$$_RentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<RentMainEntity> list,
      FormzStatus status,
      FormzStatus paginationStatus,
      String? next,
      int count,
      int categoryId,
      int hasAirConditioners,
      int hasBabySeat,
      int rentCarIsClean,
      int rentCarIsFullFuel});
}

/// @nodoc
class __$$_RentStateCopyWithImpl<$Res>
    extends _$RentStateCopyWithImpl<$Res, _$_RentState>
    implements _$$_RentStateCopyWith<$Res> {
  __$$_RentStateCopyWithImpl(
      _$_RentState _value, $Res Function(_$_RentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? status = null,
    Object? paginationStatus = null,
    Object? next = freezed,
    Object? count = null,
    Object? categoryId = null,
    Object? hasAirConditioners = null,
    Object? hasBabySeat = null,
    Object? rentCarIsClean = null,
    Object? rentCarIsFullFuel = null,
  }) {
    return _then(_$_RentState(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<RentMainEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      paginationStatus: null == paginationStatus
          ? _value.paginationStatus
          : paginationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      hasAirConditioners: null == hasAirConditioners
          ? _value.hasAirConditioners
          : hasAirConditioners // ignore: cast_nullable_to_non_nullable
              as int,
      hasBabySeat: null == hasBabySeat
          ? _value.hasBabySeat
          : hasBabySeat // ignore: cast_nullable_to_non_nullable
              as int,
      rentCarIsClean: null == rentCarIsClean
          ? _value.rentCarIsClean
          : rentCarIsClean // ignore: cast_nullable_to_non_nullable
              as int,
      rentCarIsFullFuel: null == rentCarIsFullFuel
          ? _value.rentCarIsFullFuel
          : rentCarIsFullFuel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RentState implements _RentState {
  _$_RentState(
      {final List<RentMainEntity> list = const [],
      this.status = FormzStatus.pure,
      this.paginationStatus = FormzStatus.pure,
      this.next,
      this.count = 0,
      this.categoryId = -1,
      this.hasAirConditioners = 0,
      this.hasBabySeat = 0,
      this.rentCarIsClean = 0,
      this.rentCarIsFullFuel = 0})
      : _list = list;

  final List<RentMainEntity> _list;
  @override
  @JsonKey()
  List<RentMainEntity> get list {
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
  final String? next;
  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final int categoryId;
  @override
  @JsonKey()
  final int hasAirConditioners;
  @override
  @JsonKey()
  final int hasBabySeat;
  @override
  @JsonKey()
  final int rentCarIsClean;
  @override
  @JsonKey()
  final int rentCarIsFullFuel;

  @override
  String toString() {
    return 'RentState(list: $list, status: $status, paginationStatus: $paginationStatus, next: $next, count: $count, categoryId: $categoryId, hasAirConditioners: $hasAirConditioners, hasBabySeat: $hasBabySeat, rentCarIsClean: $rentCarIsClean, rentCarIsFullFuel: $rentCarIsFullFuel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RentState &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paginationStatus, paginationStatus) ||
                other.paginationStatus == paginationStatus) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.hasAirConditioners, hasAirConditioners) ||
                other.hasAirConditioners == hasAirConditioners) &&
            (identical(other.hasBabySeat, hasBabySeat) ||
                other.hasBabySeat == hasBabySeat) &&
            (identical(other.rentCarIsClean, rentCarIsClean) ||
                other.rentCarIsClean == rentCarIsClean) &&
            (identical(other.rentCarIsFullFuel, rentCarIsFullFuel) ||
                other.rentCarIsFullFuel == rentCarIsFullFuel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_list),
      status,
      paginationStatus,
      next,
      count,
      categoryId,
      hasAirConditioners,
      hasBabySeat,
      rentCarIsClean,
      rentCarIsFullFuel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RentStateCopyWith<_$_RentState> get copyWith =>
      __$$_RentStateCopyWithImpl<_$_RentState>(this, _$identity);
}

abstract class _RentState implements RentState {
  factory _RentState(
      {final List<RentMainEntity> list,
      final FormzStatus status,
      final FormzStatus paginationStatus,
      final String? next,
      final int count,
      final int categoryId,
      final int hasAirConditioners,
      final int hasBabySeat,
      final int rentCarIsClean,
      final int rentCarIsFullFuel}) = _$_RentState;

  @override
  List<RentMainEntity> get list;
  @override
  FormzStatus get status;
  @override
  FormzStatus get paginationStatus;
  @override
  String? get next;
  @override
  int get count;
  @override
  int get categoryId;
  @override
  int get hasAirConditioners;
  @override
  int get hasBabySeat;
  @override
  int get rentCarIsClean;
  @override
  int get rentCarIsFullFuel;
  @override
  @JsonKey(ignore: true)
  _$$_RentStateCopyWith<_$_RentState> get copyWith =>
      throw _privateConstructorUsedError;
}
