// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
    required TResult Function() getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isRefresh, String search)? getResults,
    TResult Function()? getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh, String search)? getResults,
    TResult Function()? getMoreResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetMoreResults value) getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DealerCardEventCopyWith<$Res> {
  factory $DealerCardEventCopyWith(
          DealerCardEvent value, $Res Function(DealerCardEvent) then) =
      _$DealerCardEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DealerCardEventCopyWithImpl<$Res>
    implements $DealerCardEventCopyWith<$Res> {
  _$DealerCardEventCopyWithImpl(this._value, this._then);

  final DealerCardEvent _value;
  // ignore: unused_field
  final $Res Function(DealerCardEvent) _then;
}

/// @nodoc
abstract class _$$_GetResultsCopyWith<$Res> {
  factory _$$_GetResultsCopyWith(
          _$_GetResults value, $Res Function(_$_GetResults) then) =
      __$$_GetResultsCopyWithImpl<$Res>;
  $Res call({bool isRefresh, String search});
}

/// @nodoc
class __$$_GetResultsCopyWithImpl<$Res>
    extends _$DealerCardEventCopyWithImpl<$Res>
    implements _$$_GetResultsCopyWith<$Res> {
  __$$_GetResultsCopyWithImpl(
      _$_GetResults _value, $Res Function(_$_GetResults) _then)
      : super(_value, (v) => _then(v as _$_GetResults));

  @override
  _$_GetResults get _value => super._value as _$_GetResults;

  @override
  $Res call({
    Object? isRefresh = freezed,
    Object? search = freezed,
  }) {
    return _then(_$_GetResults(
      isRefresh: isRefresh == freezed
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
      search: search == freezed
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
            const DeepCollectionEquality().equals(other.isRefresh, isRefresh) &&
            const DeepCollectionEquality().equals(other.search, search));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isRefresh),
      const DeepCollectionEquality().hash(search));

  @JsonKey(ignore: true)
  @override
  _$$_GetResultsCopyWith<_$_GetResults> get copyWith =>
      __$$_GetResultsCopyWithImpl<_$_GetResults>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh, String search) getResults,
    required TResult Function() getMoreResults,
  }) {
    return getResults(isRefresh, search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isRefresh, String search)? getResults,
    TResult Function()? getMoreResults,
  }) {
    return getResults?.call(isRefresh, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh, String search)? getResults,
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
    required TResult Function(_GetMoreResults value) getMoreResults,
  }) {
    return getResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
  }) {
    return getResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
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
abstract class _$$_GetMoreResultsCopyWith<$Res> {
  factory _$$_GetMoreResultsCopyWith(
          _$_GetMoreResults value, $Res Function(_$_GetMoreResults) then) =
      __$$_GetMoreResultsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMoreResultsCopyWithImpl<$Res>
    extends _$DealerCardEventCopyWithImpl<$Res>
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
    required TResult Function() getMoreResults,
  }) {
    return getMoreResults();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isRefresh, String search)? getResults,
    TResult Function()? getMoreResults,
  }) {
    return getMoreResults?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh, String search)? getResults,
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
    required TResult Function(_GetMoreResults value) getMoreResults,
  }) {
    return getMoreResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
  }) {
    return getMoreResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
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
      _$DealerCardStateCopyWithImpl<$Res>;
  $Res call(
      {List<DealerCardEntity> list,
      FormzStatus status,
      FormzStatus paginationStatus,
      String? next,
      int count});
}

/// @nodoc
class _$DealerCardStateCopyWithImpl<$Res>
    implements $DealerCardStateCopyWith<$Res> {
  _$DealerCardStateCopyWithImpl(this._value, this._then);

  final DealerCardState _value;
  // ignore: unused_field
  final $Res Function(DealerCardState) _then;

  @override
  $Res call({
    Object? list = freezed,
    Object? status = freezed,
    Object? paginationStatus = freezed,
    Object? next = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<DealerCardEntity>,
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
    ));
  }
}

/// @nodoc
abstract class _$$_DealerCardStateCopyWith<$Res>
    implements $DealerCardStateCopyWith<$Res> {
  factory _$$_DealerCardStateCopyWith(
          _$_DealerCardState value, $Res Function(_$_DealerCardState) then) =
      __$$_DealerCardStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<DealerCardEntity> list,
      FormzStatus status,
      FormzStatus paginationStatus,
      String? next,
      int count});
}

/// @nodoc
class __$$_DealerCardStateCopyWithImpl<$Res>
    extends _$DealerCardStateCopyWithImpl<$Res>
    implements _$$_DealerCardStateCopyWith<$Res> {
  __$$_DealerCardStateCopyWithImpl(
      _$_DealerCardState _value, $Res Function(_$_DealerCardState) _then)
      : super(_value, (v) => _then(v as _$_DealerCardState));

  @override
  _$_DealerCardState get _value => super._value as _$_DealerCardState;

  @override
  $Res call({
    Object? list = freezed,
    Object? status = freezed,
    Object? paginationStatus = freezed,
    Object? next = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_DealerCardState(
      list: list == freezed
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<DealerCardEntity>,
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
    ));
  }
}

/// @nodoc

class _$_DealerCardState implements _DealerCardState {
  _$_DealerCardState(
      {final List<DealerCardEntity> list = const [],
      this.status = FormzStatus.pure,
      this.paginationStatus = FormzStatus.pure,
      this.next,
      this.count = 0})
      : _list = list;

  final List<DealerCardEntity> _list;
  @override
  @JsonKey()
  List<DealerCardEntity> get list {
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
  String toString() {
    return 'DealerCardState(list: $list, status: $status, paginationStatus: $paginationStatus, next: $next, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DealerCardState &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.paginationStatus, paginationStatus) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_list),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(paginationStatus),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$$_DealerCardStateCopyWith<_$_DealerCardState> get copyWith =>
      __$$_DealerCardStateCopyWithImpl<_$_DealerCardState>(this, _$identity);
}

abstract class _DealerCardState implements DealerCardState {
  factory _DealerCardState(
      {final List<DealerCardEntity> list,
      final FormzStatus status,
      final FormzStatus paginationStatus,
      final String? next,
      final int count}) = _$_DealerCardState;

  @override
  List<DealerCardEntity> get list;
  @override
  FormzStatus get status;
  @override
  FormzStatus get paginationStatus;
  @override
  String? get next;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_DealerCardStateCopyWith<_$_DealerCardState> get copyWith =>
      throw _privateConstructorUsedError;
}
