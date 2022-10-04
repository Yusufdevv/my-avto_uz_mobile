// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
    required TResult Function(int id) setId,
    required TResult Function() getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isRefresh)? getResults,
    TResult Function(int id)? setId,
    TResult Function()? getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh)? getResults,
    TResult Function(int id)? setId,
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
    TResult Function(_GetResults value)? getResults,
    TResult Function(_SetId value)? setId,
    TResult Function(_GetMoreResults value)? getMoreResults,
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
      _$RentEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RentEventCopyWithImpl<$Res> implements $RentEventCopyWith<$Res> {
  _$RentEventCopyWithImpl(this._value, this._then);

  final RentEvent _value;
  // ignore: unused_field
  final $Res Function(RentEvent) _then;
}

/// @nodoc
abstract class _$$_GetResultsCopyWith<$Res> {
  factory _$$_GetResultsCopyWith(
          _$_GetResults value, $Res Function(_$_GetResults) then) =
      __$$_GetResultsCopyWithImpl<$Res>;
  $Res call({bool isRefresh});
}

/// @nodoc
class __$$_GetResultsCopyWithImpl<$Res> extends _$RentEventCopyWithImpl<$Res>
    implements _$$_GetResultsCopyWith<$Res> {
  __$$_GetResultsCopyWithImpl(
      _$_GetResults _value, $Res Function(_$_GetResults) _then)
      : super(_value, (v) => _then(v as _$_GetResults));

  @override
  _$_GetResults get _value => super._value as _$_GetResults;

  @override
  $Res call({
    Object? isRefresh = freezed,
  }) {
    return _then(_$_GetResults(
      isRefresh: isRefresh == freezed
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
            const DeepCollectionEquality().equals(other.isRefresh, isRefresh));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isRefresh));

  @JsonKey(ignore: true)
  @override
  _$$_GetResultsCopyWith<_$_GetResults> get copyWith =>
      __$$_GetResultsCopyWithImpl<_$_GetResults>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh) getResults,
    required TResult Function(int id) setId,
    required TResult Function() getMoreResults,
  }) {
    return getResults(isRefresh);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isRefresh)? getResults,
    TResult Function(int id)? setId,
    TResult Function()? getMoreResults,
  }) {
    return getResults?.call(isRefresh);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh)? getResults,
    TResult Function(int id)? setId,
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
    TResult Function(_GetResults value)? getResults,
    TResult Function(_SetId value)? setId,
    TResult Function(_GetMoreResults value)? getMoreResults,
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
  $Res call({int id});
}

/// @nodoc
class __$$_SetIdCopyWithImpl<$Res> extends _$RentEventCopyWithImpl<$Res>
    implements _$$_SetIdCopyWith<$Res> {
  __$$_SetIdCopyWithImpl(_$_SetId _value, $Res Function(_$_SetId) _then)
      : super(_value, (v) => _then(v as _$_SetId));

  @override
  _$_SetId get _value => super._value as _$_SetId;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_SetId(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SetId implements _SetId {
  _$_SetId({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'RentEvent.setId(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetId &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_SetIdCopyWith<_$_SetId> get copyWith =>
      __$$_SetIdCopyWithImpl<_$_SetId>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh) getResults,
    required TResult Function(int id) setId,
    required TResult Function() getMoreResults,
  }) {
    return setId(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isRefresh)? getResults,
    TResult Function(int id)? setId,
    TResult Function()? getMoreResults,
  }) {
    return setId?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh)? getResults,
    TResult Function(int id)? setId,
    TResult Function()? getMoreResults,
    required TResult orElse(),
  }) {
    if (setId != null) {
      return setId(id);
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
    TResult Function(_GetResults value)? getResults,
    TResult Function(_SetId value)? setId,
    TResult Function(_GetMoreResults value)? getMoreResults,
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
  factory _SetId({required final int id}) = _$_SetId;

  int get id;
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
    extends _$RentEventCopyWithImpl<$Res>
    implements _$$_GetMoreResultsCopyWith<$Res> {
  __$$_GetMoreResultsCopyWithImpl(
      _$_GetMoreResults _value, $Res Function(_$_GetMoreResults) _then)
      : super(_value, (v) => _then(v as _$_GetMoreResults));

  @override
  _$_GetMoreResults get _value => super._value as _$_GetMoreResults;
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
    required TResult Function(int id) setId,
    required TResult Function() getMoreResults,
  }) {
    return getMoreResults();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isRefresh)? getResults,
    TResult Function(int id)? setId,
    TResult Function()? getMoreResults,
  }) {
    return getMoreResults?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh)? getResults,
    TResult Function(int id)? setId,
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
    TResult Function(_GetResults value)? getResults,
    TResult Function(_SetId value)? setId,
    TResult Function(_GetMoreResults value)? getMoreResults,
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
  int get categaryId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RentStateCopyWith<RentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentStateCopyWith<$Res> {
  factory $RentStateCopyWith(RentState value, $Res Function(RentState) then) =
      _$RentStateCopyWithImpl<$Res>;
  $Res call(
      {List<RentMainEntity> list,
      FormzStatus status,
      FormzStatus paginationStatus,
      String? next,
      int count,
      int categaryId});
}

/// @nodoc
class _$RentStateCopyWithImpl<$Res> implements $RentStateCopyWith<$Res> {
  _$RentStateCopyWithImpl(this._value, this._then);

  final RentState _value;
  // ignore: unused_field
  final $Res Function(RentState) _then;

  @override
  $Res call({
    Object? list = freezed,
    Object? status = freezed,
    Object? paginationStatus = freezed,
    Object? next = freezed,
    Object? count = freezed,
    Object? categaryId = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<RentMainEntity>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      paginationStatus: paginationStatus == freezed
          ? _value.paginationStatus
          : paginationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      categaryId: categaryId == freezed
          ? _value.categaryId
          : categaryId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_RentStateCopyWith<$Res> implements $RentStateCopyWith<$Res> {
  factory _$$_RentStateCopyWith(
          _$_RentState value, $Res Function(_$_RentState) then) =
      __$$_RentStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<RentMainEntity> list,
      FormzStatus status,
      FormzStatus paginationStatus,
      String? next,
      int count,
      int categaryId});
}

/// @nodoc
class __$$_RentStateCopyWithImpl<$Res> extends _$RentStateCopyWithImpl<$Res>
    implements _$$_RentStateCopyWith<$Res> {
  __$$_RentStateCopyWithImpl(
      _$_RentState _value, $Res Function(_$_RentState) _then)
      : super(_value, (v) => _then(v as _$_RentState));

  @override
  _$_RentState get _value => super._value as _$_RentState;

  @override
  $Res call({
    Object? list = freezed,
    Object? status = freezed,
    Object? paginationStatus = freezed,
    Object? next = freezed,
    Object? count = freezed,
    Object? categaryId = freezed,
  }) {
    return _then(_$_RentState(
      list: list == freezed
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<RentMainEntity>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      paginationStatus: paginationStatus == freezed
          ? _value.paginationStatus
          : paginationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      categaryId: categaryId == freezed
          ? _value.categaryId
          : categaryId // ignore: cast_nullable_to_non_nullable
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
      this.categaryId = -1})
      : _list = list;

  final List<RentMainEntity> _list;
  @override
  @JsonKey()
  List<RentMainEntity> get list {
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
  final int categaryId;

  @override
  String toString() {
    return 'RentState(list: $list, status: $status, paginationStatus: $paginationStatus, next: $next, count: $count, categaryId: $categaryId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RentState &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.paginationStatus, paginationStatus) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality()
                .equals(other.categaryId, categaryId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_list),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(paginationStatus),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(categaryId));

  @JsonKey(ignore: true)
  @override
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
      final int categaryId}) = _$_RentState;

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
  int get categaryId;
  @override
  @JsonKey(ignore: true)
  _$$_RentStateCopyWith<_$_RentState> get copyWith =>
      throw _privateConstructorUsedError;
}
