// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) getResults,
    required TResult Function() getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetMoreResults value) getMoreResults,
    required TResult Function(_GetSuggestions value) getSuggestions,
    required TResult Function(_SetSuggestions value) setSuggestions,
    required TResult Function(_SaveLocaleSuggestion value) saveLocaleSuggestion,
    required TResult Function(_DeleteLocaleSuggestion value)
        deleteLocaleSuggestion,
    required TResult Function(_SelectLocaleSuggestion value)
        selectSearchSuggestion,
    required TResult Function(_ChangeStatus value) changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res> implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  final SearchEvent _value;
  // ignore: unused_field
  final $Res Function(SearchEvent) _then;
}

/// @nodoc
abstract class _$$_GetResultsCopyWith<$Res> {
  factory _$$_GetResultsCopyWith(
          _$_GetResults value, $Res Function(_$_GetResults) then) =
      __$$_GetResultsCopyWithImpl<$Res>;
  $Res call({String searchText});
}

/// @nodoc
class __$$_GetResultsCopyWithImpl<$Res> extends _$SearchEventCopyWithImpl<$Res>
    implements _$$_GetResultsCopyWith<$Res> {
  __$$_GetResultsCopyWithImpl(
      _$_GetResults _value, $Res Function(_$_GetResults) _then)
      : super(_value, (v) => _then(v as _$_GetResults));

  @override
  _$_GetResults get _value => super._value as _$_GetResults;

  @override
  $Res call({
    Object? searchText = freezed,
  }) {
    return _then(_$_GetResults(
      searchText: searchText == freezed
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetResults implements _GetResults {
  _$_GetResults({required this.searchText});

  @override
  final String searchText;

  @override
  String toString() {
    return 'SearchEvent.getResults(searchText: $searchText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetResults &&
            const DeepCollectionEquality()
                .equals(other.searchText, searchText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(searchText));

  @JsonKey(ignore: true)
  @override
  _$$_GetResultsCopyWith<_$_GetResults> get copyWith =>
      __$$_GetResultsCopyWithImpl<_$_GetResults>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) getResults,
    required TResult Function() getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
  }) {
    return getResults(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
  }) {
    return getResults?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    required TResult orElse(),
  }) {
    if (getResults != null) {
      return getResults(searchText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetMoreResults value) getMoreResults,
    required TResult Function(_GetSuggestions value) getSuggestions,
    required TResult Function(_SetSuggestions value) setSuggestions,
    required TResult Function(_SaveLocaleSuggestion value) saveLocaleSuggestion,
    required TResult Function(_DeleteLocaleSuggestion value)
        deleteLocaleSuggestion,
    required TResult Function(_SelectLocaleSuggestion value)
        selectSearchSuggestion,
    required TResult Function(_ChangeStatus value) changeStatus,
  }) {
    return getResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
  }) {
    return getResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (getResults != null) {
      return getResults(this);
    }
    return orElse();
  }
}

abstract class _GetResults implements SearchEvent {
  factory _GetResults({required final String searchText}) = _$_GetResults;

  String get searchText;
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
    extends _$SearchEventCopyWithImpl<$Res>
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
    return 'SearchEvent.getMoreResults()';
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
    required TResult Function(String searchText) getResults,
    required TResult Function() getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
  }) {
    return getMoreResults();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
  }) {
    return getMoreResults?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
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
    required TResult Function(_GetSuggestions value) getSuggestions,
    required TResult Function(_SetSuggestions value) setSuggestions,
    required TResult Function(_SaveLocaleSuggestion value) saveLocaleSuggestion,
    required TResult Function(_DeleteLocaleSuggestion value)
        deleteLocaleSuggestion,
    required TResult Function(_SelectLocaleSuggestion value)
        selectSearchSuggestion,
    required TResult Function(_ChangeStatus value) changeStatus,
  }) {
    return getMoreResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
  }) {
    return getMoreResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (getMoreResults != null) {
      return getMoreResults(this);
    }
    return orElse();
  }
}

abstract class _GetMoreResults implements SearchEvent {
  factory _GetMoreResults() = _$_GetMoreResults;
}

/// @nodoc
abstract class _$$_GetSuggestionsCopyWith<$Res> {
  factory _$$_GetSuggestionsCopyWith(
          _$_GetSuggestions value, $Res Function(_$_GetSuggestions) then) =
      __$$_GetSuggestionsCopyWithImpl<$Res>;
  $Res call({String search});
}

/// @nodoc
class __$$_GetSuggestionsCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$$_GetSuggestionsCopyWith<$Res> {
  __$$_GetSuggestionsCopyWithImpl(
      _$_GetSuggestions _value, $Res Function(_$_GetSuggestions) _then)
      : super(_value, (v) => _then(v as _$_GetSuggestions));

  @override
  _$_GetSuggestions get _value => super._value as _$_GetSuggestions;

  @override
  $Res call({
    Object? search = freezed,
  }) {
    return _then(_$_GetSuggestions(
      search: search == freezed
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetSuggestions implements _GetSuggestions {
  _$_GetSuggestions({required this.search});

  @override
  final String search;

  @override
  String toString() {
    return 'SearchEvent.getSuggestions(search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetSuggestions &&
            const DeepCollectionEquality().equals(other.search, search));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(search));

  @JsonKey(ignore: true)
  @override
  _$$_GetSuggestionsCopyWith<_$_GetSuggestions> get copyWith =>
      __$$_GetSuggestionsCopyWithImpl<_$_GetSuggestions>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) getResults,
    required TResult Function() getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
  }) {
    return getSuggestions(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
  }) {
    return getSuggestions?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    required TResult orElse(),
  }) {
    if (getSuggestions != null) {
      return getSuggestions(search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetMoreResults value) getMoreResults,
    required TResult Function(_GetSuggestions value) getSuggestions,
    required TResult Function(_SetSuggestions value) setSuggestions,
    required TResult Function(_SaveLocaleSuggestion value) saveLocaleSuggestion,
    required TResult Function(_DeleteLocaleSuggestion value)
        deleteLocaleSuggestion,
    required TResult Function(_SelectLocaleSuggestion value)
        selectSearchSuggestion,
    required TResult Function(_ChangeStatus value) changeStatus,
  }) {
    return getSuggestions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
  }) {
    return getSuggestions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (getSuggestions != null) {
      return getSuggestions(this);
    }
    return orElse();
  }
}

abstract class _GetSuggestions implements SearchEvent {
  factory _GetSuggestions({required final String search}) = _$_GetSuggestions;

  String get search;
  @JsonKey(ignore: true)
  _$$_GetSuggestionsCopyWith<_$_GetSuggestions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetSuggestionsCopyWith<$Res> {
  factory _$$_SetSuggestionsCopyWith(
          _$_SetSuggestions value, $Res Function(_$_SetSuggestions) then) =
      __$$_SetSuggestionsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SetSuggestionsCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$$_SetSuggestionsCopyWith<$Res> {
  __$$_SetSuggestionsCopyWithImpl(
      _$_SetSuggestions _value, $Res Function(_$_SetSuggestions) _then)
      : super(_value, (v) => _then(v as _$_SetSuggestions));

  @override
  _$_SetSuggestions get _value => super._value as _$_SetSuggestions;
}

/// @nodoc

class _$_SetSuggestions implements _SetSuggestions {
  _$_SetSuggestions();

  @override
  String toString() {
    return 'SearchEvent.setSuggestions()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SetSuggestions);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) getResults,
    required TResult Function() getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
  }) {
    return setSuggestions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
  }) {
    return setSuggestions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    required TResult orElse(),
  }) {
    if (setSuggestions != null) {
      return setSuggestions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetMoreResults value) getMoreResults,
    required TResult Function(_GetSuggestions value) getSuggestions,
    required TResult Function(_SetSuggestions value) setSuggestions,
    required TResult Function(_SaveLocaleSuggestion value) saveLocaleSuggestion,
    required TResult Function(_DeleteLocaleSuggestion value)
        deleteLocaleSuggestion,
    required TResult Function(_SelectLocaleSuggestion value)
        selectSearchSuggestion,
    required TResult Function(_ChangeStatus value) changeStatus,
  }) {
    return setSuggestions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
  }) {
    return setSuggestions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (setSuggestions != null) {
      return setSuggestions(this);
    }
    return orElse();
  }
}

abstract class _SetSuggestions implements SearchEvent {
  factory _SetSuggestions() = _$_SetSuggestions;
}

/// @nodoc
abstract class _$$_SaveLocaleSuggestionCopyWith<$Res> {
  factory _$$_SaveLocaleSuggestionCopyWith(_$_SaveLocaleSuggestion value,
          $Res Function(_$_SaveLocaleSuggestion) then) =
      __$$_SaveLocaleSuggestionCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class __$$_SaveLocaleSuggestionCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$$_SaveLocaleSuggestionCopyWith<$Res> {
  __$$_SaveLocaleSuggestionCopyWithImpl(_$_SaveLocaleSuggestion _value,
      $Res Function(_$_SaveLocaleSuggestion) _then)
      : super(_value, (v) => _then(v as _$_SaveLocaleSuggestion));

  @override
  _$_SaveLocaleSuggestion get _value => super._value as _$_SaveLocaleSuggestion;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_SaveLocaleSuggestion(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SaveLocaleSuggestion implements _SaveLocaleSuggestion {
  _$_SaveLocaleSuggestion({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'SearchEvent.saveLocaleSuggestion(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaveLocaleSuggestion &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$$_SaveLocaleSuggestionCopyWith<_$_SaveLocaleSuggestion> get copyWith =>
      __$$_SaveLocaleSuggestionCopyWithImpl<_$_SaveLocaleSuggestion>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) getResults,
    required TResult Function() getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
  }) {
    return saveLocaleSuggestion(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
  }) {
    return saveLocaleSuggestion?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    required TResult orElse(),
  }) {
    if (saveLocaleSuggestion != null) {
      return saveLocaleSuggestion(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetMoreResults value) getMoreResults,
    required TResult Function(_GetSuggestions value) getSuggestions,
    required TResult Function(_SetSuggestions value) setSuggestions,
    required TResult Function(_SaveLocaleSuggestion value) saveLocaleSuggestion,
    required TResult Function(_DeleteLocaleSuggestion value)
        deleteLocaleSuggestion,
    required TResult Function(_SelectLocaleSuggestion value)
        selectSearchSuggestion,
    required TResult Function(_ChangeStatus value) changeStatus,
  }) {
    return saveLocaleSuggestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
  }) {
    return saveLocaleSuggestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (saveLocaleSuggestion != null) {
      return saveLocaleSuggestion(this);
    }
    return orElse();
  }
}

abstract class _SaveLocaleSuggestion implements SearchEvent {
  factory _SaveLocaleSuggestion({required final String text}) =
      _$_SaveLocaleSuggestion;

  String get text;
  @JsonKey(ignore: true)
  _$$_SaveLocaleSuggestionCopyWith<_$_SaveLocaleSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteLocaleSuggestionCopyWith<$Res> {
  factory _$$_DeleteLocaleSuggestionCopyWith(_$_DeleteLocaleSuggestion value,
          $Res Function(_$_DeleteLocaleSuggestion) then) =
      __$$_DeleteLocaleSuggestionCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class __$$_DeleteLocaleSuggestionCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$$_DeleteLocaleSuggestionCopyWith<$Res> {
  __$$_DeleteLocaleSuggestionCopyWithImpl(_$_DeleteLocaleSuggestion _value,
      $Res Function(_$_DeleteLocaleSuggestion) _then)
      : super(_value, (v) => _then(v as _$_DeleteLocaleSuggestion));

  @override
  _$_DeleteLocaleSuggestion get _value =>
      super._value as _$_DeleteLocaleSuggestion;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_DeleteLocaleSuggestion(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteLocaleSuggestion implements _DeleteLocaleSuggestion {
  _$_DeleteLocaleSuggestion({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'SearchEvent.deleteLocaleSuggestion(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteLocaleSuggestion &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$$_DeleteLocaleSuggestionCopyWith<_$_DeleteLocaleSuggestion> get copyWith =>
      __$$_DeleteLocaleSuggestionCopyWithImpl<_$_DeleteLocaleSuggestion>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) getResults,
    required TResult Function() getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
  }) {
    return deleteLocaleSuggestion(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
  }) {
    return deleteLocaleSuggestion?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    required TResult orElse(),
  }) {
    if (deleteLocaleSuggestion != null) {
      return deleteLocaleSuggestion(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetMoreResults value) getMoreResults,
    required TResult Function(_GetSuggestions value) getSuggestions,
    required TResult Function(_SetSuggestions value) setSuggestions,
    required TResult Function(_SaveLocaleSuggestion value) saveLocaleSuggestion,
    required TResult Function(_DeleteLocaleSuggestion value)
        deleteLocaleSuggestion,
    required TResult Function(_SelectLocaleSuggestion value)
        selectSearchSuggestion,
    required TResult Function(_ChangeStatus value) changeStatus,
  }) {
    return deleteLocaleSuggestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
  }) {
    return deleteLocaleSuggestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (deleteLocaleSuggestion != null) {
      return deleteLocaleSuggestion(this);
    }
    return orElse();
  }
}

abstract class _DeleteLocaleSuggestion implements SearchEvent {
  factory _DeleteLocaleSuggestion({required final String text}) =
      _$_DeleteLocaleSuggestion;

  String get text;
  @JsonKey(ignore: true)
  _$$_DeleteLocaleSuggestionCopyWith<_$_DeleteLocaleSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SelectLocaleSuggestionCopyWith<$Res> {
  factory _$$_SelectLocaleSuggestionCopyWith(_$_SelectLocaleSuggestion value,
          $Res Function(_$_SelectLocaleSuggestion) then) =
      __$$_SelectLocaleSuggestionCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class __$$_SelectLocaleSuggestionCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$$_SelectLocaleSuggestionCopyWith<$Res> {
  __$$_SelectLocaleSuggestionCopyWithImpl(_$_SelectLocaleSuggestion _value,
      $Res Function(_$_SelectLocaleSuggestion) _then)
      : super(_value, (v) => _then(v as _$_SelectLocaleSuggestion));

  @override
  _$_SelectLocaleSuggestion get _value =>
      super._value as _$_SelectLocaleSuggestion;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_SelectLocaleSuggestion(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SelectLocaleSuggestion implements _SelectLocaleSuggestion {
  _$_SelectLocaleSuggestion({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'SearchEvent.selectSearchSuggestion(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectLocaleSuggestion &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$$_SelectLocaleSuggestionCopyWith<_$_SelectLocaleSuggestion> get copyWith =>
      __$$_SelectLocaleSuggestionCopyWithImpl<_$_SelectLocaleSuggestion>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) getResults,
    required TResult Function() getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
  }) {
    return selectSearchSuggestion(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
  }) {
    return selectSearchSuggestion?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    required TResult orElse(),
  }) {
    if (selectSearchSuggestion != null) {
      return selectSearchSuggestion(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetMoreResults value) getMoreResults,
    required TResult Function(_GetSuggestions value) getSuggestions,
    required TResult Function(_SetSuggestions value) setSuggestions,
    required TResult Function(_SaveLocaleSuggestion value) saveLocaleSuggestion,
    required TResult Function(_DeleteLocaleSuggestion value)
        deleteLocaleSuggestion,
    required TResult Function(_SelectLocaleSuggestion value)
        selectSearchSuggestion,
    required TResult Function(_ChangeStatus value) changeStatus,
  }) {
    return selectSearchSuggestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
  }) {
    return selectSearchSuggestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (selectSearchSuggestion != null) {
      return selectSearchSuggestion(this);
    }
    return orElse();
  }
}

abstract class _SelectLocaleSuggestion implements SearchEvent {
  factory _SelectLocaleSuggestion({required final String text}) =
      _$_SelectLocaleSuggestion;

  String get text;
  @JsonKey(ignore: true)
  _$$_SelectLocaleSuggestionCopyWith<_$_SelectLocaleSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeStatusCopyWith<$Res> {
  factory _$$_ChangeStatusCopyWith(
          _$_ChangeStatus value, $Res Function(_$_ChangeStatus) then) =
      __$$_ChangeStatusCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ChangeStatusCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$$_ChangeStatusCopyWith<$Res> {
  __$$_ChangeStatusCopyWithImpl(
      _$_ChangeStatus _value, $Res Function(_$_ChangeStatus) _then)
      : super(_value, (v) => _then(v as _$_ChangeStatus));

  @override
  _$_ChangeStatus get _value => super._value as _$_ChangeStatus;
}

/// @nodoc

class _$_ChangeStatus implements _ChangeStatus {
  _$_ChangeStatus();

  @override
  String toString() {
    return 'SearchEvent.changeStatus()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ChangeStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) getResults,
    required TResult Function() getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
  }) {
    return changeStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
  }) {
    return changeStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function()? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    required TResult orElse(),
  }) {
    if (changeStatus != null) {
      return changeStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
    required TResult Function(_GetMoreResults value) getMoreResults,
    required TResult Function(_GetSuggestions value) getSuggestions,
    required TResult Function(_SetSuggestions value) setSuggestions,
    required TResult Function(_SaveLocaleSuggestion value) saveLocaleSuggestion,
    required TResult Function(_DeleteLocaleSuggestion value)
        deleteLocaleSuggestion,
    required TResult Function(_SelectLocaleSuggestion value)
        selectSearchSuggestion,
    required TResult Function(_ChangeStatus value) changeStatus,
  }) {
    return changeStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
  }) {
    return changeStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    TResult Function(_GetMoreResults value)? getMoreResults,
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_SetSuggestions value)? setSuggestions,
    TResult Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult Function(_ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (changeStatus != null) {
      return changeStatus(this);
    }
    return orElse();
  }
}

abstract class _ChangeStatus implements SearchEvent {
  factory _ChangeStatus() = _$_ChangeStatus;
}

/// @nodoc
mixin _$SearchState {
  List<AutoEntity> get searchResults => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  FormzStatus get paginationStatus => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  dynamic get moreFetch => throw _privateConstructorUsedError;
  List<OptionsEntity> get suggestions => throw _privateConstructorUsedError;
  int get suggestionsCount => throw _privateConstructorUsedError;
  bool? get suggestionsFetchMore => throw _privateConstructorUsedError;
  FormzStatus get suggestionsStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
  $Res call(
      {List<AutoEntity> searchResults,
      FormzStatus status,
      FormzStatus paginationStatus,
      String? next,
      int count,
      dynamic moreFetch,
      List<OptionsEntity> suggestions,
      int suggestionsCount,
      bool? suggestionsFetchMore,
      FormzStatus suggestionsStatus});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;

  @override
  $Res call({
    Object? searchResults = freezed,
    Object? status = freezed,
    Object? paginationStatus = freezed,
    Object? next = freezed,
    Object? count = freezed,
    Object? moreFetch = freezed,
    Object? suggestions = freezed,
    Object? suggestionsCount = freezed,
    Object? suggestionsFetchMore = freezed,
    Object? suggestionsStatus = freezed,
  }) {
    return _then(_value.copyWith(
      searchResults: searchResults == freezed
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<AutoEntity>,
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
      moreFetch: moreFetch == freezed
          ? _value.moreFetch
          : moreFetch // ignore: cast_nullable_to_non_nullable
              as dynamic,
      suggestions: suggestions == freezed
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<OptionsEntity>,
      suggestionsCount: suggestionsCount == freezed
          ? _value.suggestionsCount
          : suggestionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      suggestionsFetchMore: suggestionsFetchMore == freezed
          ? _value.suggestionsFetchMore
          : suggestionsFetchMore // ignore: cast_nullable_to_non_nullable
              as bool?,
      suggestionsStatus: suggestionsStatus == freezed
          ? _value.suggestionsStatus
          : suggestionsStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<AutoEntity> searchResults,
      FormzStatus status,
      FormzStatus paginationStatus,
      String? next,
      int count,
      dynamic moreFetch,
      List<OptionsEntity> suggestions,
      int suggestionsCount,
      bool? suggestionsFetchMore,
      FormzStatus suggestionsStatus});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, (v) => _then(v as _$_SearchState));

  @override
  _$_SearchState get _value => super._value as _$_SearchState;

  @override
  $Res call({
    Object? searchResults = freezed,
    Object? status = freezed,
    Object? paginationStatus = freezed,
    Object? next = freezed,
    Object? count = freezed,
    Object? moreFetch = freezed,
    Object? suggestions = freezed,
    Object? suggestionsCount = freezed,
    Object? suggestionsFetchMore = freezed,
    Object? suggestionsStatus = freezed,
  }) {
    return _then(_$_SearchState(
      searchResults: searchResults == freezed
          ? _value._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<AutoEntity>,
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
      moreFetch: moreFetch == freezed ? _value.moreFetch : moreFetch,
      suggestions: suggestions == freezed
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<OptionsEntity>,
      suggestionsCount: suggestionsCount == freezed
          ? _value.suggestionsCount
          : suggestionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      suggestionsFetchMore: suggestionsFetchMore == freezed
          ? _value.suggestionsFetchMore
          : suggestionsFetchMore // ignore: cast_nullable_to_non_nullable
              as bool?,
      suggestionsStatus: suggestionsStatus == freezed
          ? _value.suggestionsStatus
          : suggestionsStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_SearchState implements _SearchState {
  _$_SearchState(
      {final List<AutoEntity> searchResults = const [],
      this.status = FormzStatus.pure,
      this.paginationStatus = FormzStatus.pure,
      this.next = '',
      this.count = 0,
      this.moreFetch = false,
      final List<OptionsEntity> suggestions = const [],
      this.suggestionsCount = 0,
      this.suggestionsFetchMore = false,
      this.suggestionsStatus = FormzStatus.pure})
      : _searchResults = searchResults,
        _suggestions = suggestions;

  final List<AutoEntity> _searchResults;
  @override
  @JsonKey()
  List<AutoEntity> get searchResults {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final FormzStatus paginationStatus;
  @override
  @JsonKey()
  final String? next;
  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final dynamic moreFetch;
  final List<OptionsEntity> _suggestions;
  @override
  @JsonKey()
  List<OptionsEntity> get suggestions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  @JsonKey()
  final int suggestionsCount;
  @override
  @JsonKey()
  final bool? suggestionsFetchMore;
  @override
  @JsonKey()
  final FormzStatus suggestionsStatus;

  @override
  String toString() {
    return 'SearchState(searchResults: $searchResults, status: $status, paginationStatus: $paginationStatus, next: $next, count: $count, moreFetch: $moreFetch, suggestions: $suggestions, suggestionsCount: $suggestionsCount, suggestionsFetchMore: $suggestionsFetchMore, suggestionsStatus: $suggestionsStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.paginationStatus, paginationStatus) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other.moreFetch, moreFetch) &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions) &&
            const DeepCollectionEquality()
                .equals(other.suggestionsCount, suggestionsCount) &&
            const DeepCollectionEquality()
                .equals(other.suggestionsFetchMore, suggestionsFetchMore) &&
            const DeepCollectionEquality()
                .equals(other.suggestionsStatus, suggestionsStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_searchResults),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(paginationStatus),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(moreFetch),
      const DeepCollectionEquality().hash(_suggestions),
      const DeepCollectionEquality().hash(suggestionsCount),
      const DeepCollectionEquality().hash(suggestionsFetchMore),
      const DeepCollectionEquality().hash(suggestionsStatus));

  @JsonKey(ignore: true)
  @override
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  factory _SearchState(
      {final List<AutoEntity> searchResults,
      final FormzStatus status,
      final FormzStatus paginationStatus,
      final String? next,
      final int count,
      final dynamic moreFetch,
      final List<OptionsEntity> suggestions,
      final int suggestionsCount,
      final bool? suggestionsFetchMore,
      final FormzStatus suggestionsStatus}) = _$_SearchState;

  @override
  List<AutoEntity> get searchResults;
  @override
  FormzStatus get status;
  @override
  FormzStatus get paginationStatus;
  @override
  String? get next;
  @override
  int get count;
  @override
  dynamic get moreFetch;
  @override
  List<OptionsEntity> get suggestions;
  @override
  int get suggestionsCount;
  @override
  bool? get suggestionsFetchMore;
  @override
  FormzStatus get suggestionsStatus;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
