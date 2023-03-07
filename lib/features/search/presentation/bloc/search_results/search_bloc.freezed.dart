// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    required TResult Function(String searchText) getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
    required TResult Function(SortStatus sortStatus) setSortStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? getResults,
    TResult? Function(String searchText)? getMoreResults,
    TResult? Function(String search)? getSuggestions,
    TResult? Function()? setSuggestions,
    TResult? Function(String text)? saveLocaleSuggestion,
    TResult? Function(String text)? deleteLocaleSuggestion,
    TResult? Function(String text)? selectSearchSuggestion,
    TResult? Function()? changeStatus,
    TResult? Function(SortStatus sortStatus)? setSortStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function(String searchText)? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    TResult Function(SortStatus sortStatus)? setSortStatus,
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
    required TResult Function(_SetSortStatus value) setSortStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetMoreResults value)? getMoreResults,
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_SetSuggestions value)? setSuggestions,
    TResult? Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult? Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult? Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_SetSortStatus value)? setSortStatus,
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
    TResult Function(_SetSortStatus value)? setSortStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res, SearchEvent>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

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
  $Res call({String searchText});
}

/// @nodoc
class __$$_GetResultsCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$_GetResults>
    implements _$$_GetResultsCopyWith<$Res> {
  __$$_GetResultsCopyWithImpl(
      _$_GetResults _value, $Res Function(_$_GetResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
  }) {
    return _then(_$_GetResults(
      searchText: null == searchText
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
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetResultsCopyWith<_$_GetResults> get copyWith =>
      __$$_GetResultsCopyWithImpl<_$_GetResults>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) getResults,
    required TResult Function(String searchText) getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
    required TResult Function(SortStatus sortStatus) setSortStatus,
  }) {
    return getResults(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? getResults,
    TResult? Function(String searchText)? getMoreResults,
    TResult? Function(String search)? getSuggestions,
    TResult? Function()? setSuggestions,
    TResult? Function(String text)? saveLocaleSuggestion,
    TResult? Function(String text)? deleteLocaleSuggestion,
    TResult? Function(String text)? selectSearchSuggestion,
    TResult? Function()? changeStatus,
    TResult? Function(SortStatus sortStatus)? setSortStatus,
  }) {
    return getResults?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function(String searchText)? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    TResult Function(SortStatus sortStatus)? setSortStatus,
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
    required TResult Function(_SetSortStatus value) setSortStatus,
  }) {
    return getResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetMoreResults value)? getMoreResults,
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_SetSuggestions value)? setSuggestions,
    TResult? Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult? Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult? Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_SetSortStatus value)? setSortStatus,
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
    TResult Function(_SetSortStatus value)? setSortStatus,
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
  @useResult
  $Res call({String searchText});
}

/// @nodoc
class __$$_GetMoreResultsCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$_GetMoreResults>
    implements _$$_GetMoreResultsCopyWith<$Res> {
  __$$_GetMoreResultsCopyWithImpl(
      _$_GetMoreResults _value, $Res Function(_$_GetMoreResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
  }) {
    return _then(_$_GetMoreResults(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetMoreResults implements _GetMoreResults {
  _$_GetMoreResults({required this.searchText});

  @override
  final String searchText;

  @override
  String toString() {
    return 'SearchEvent.getMoreResults(searchText: $searchText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetMoreResults &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetMoreResultsCopyWith<_$_GetMoreResults> get copyWith =>
      __$$_GetMoreResultsCopyWithImpl<_$_GetMoreResults>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) getResults,
    required TResult Function(String searchText) getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
    required TResult Function(SortStatus sortStatus) setSortStatus,
  }) {
    return getMoreResults(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? getResults,
    TResult? Function(String searchText)? getMoreResults,
    TResult? Function(String search)? getSuggestions,
    TResult? Function()? setSuggestions,
    TResult? Function(String text)? saveLocaleSuggestion,
    TResult? Function(String text)? deleteLocaleSuggestion,
    TResult? Function(String text)? selectSearchSuggestion,
    TResult? Function()? changeStatus,
    TResult? Function(SortStatus sortStatus)? setSortStatus,
  }) {
    return getMoreResults?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function(String searchText)? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    TResult Function(SortStatus sortStatus)? setSortStatus,
    required TResult orElse(),
  }) {
    if (getMoreResults != null) {
      return getMoreResults(searchText);
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
    required TResult Function(_SetSortStatus value) setSortStatus,
  }) {
    return getMoreResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetMoreResults value)? getMoreResults,
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_SetSuggestions value)? setSuggestions,
    TResult? Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult? Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult? Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_SetSortStatus value)? setSortStatus,
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
    TResult Function(_SetSortStatus value)? setSortStatus,
    required TResult orElse(),
  }) {
    if (getMoreResults != null) {
      return getMoreResults(this);
    }
    return orElse();
  }
}

abstract class _GetMoreResults implements SearchEvent {
  factory _GetMoreResults({required final String searchText}) =
      _$_GetMoreResults;

  String get searchText;
  @JsonKey(ignore: true)
  _$$_GetMoreResultsCopyWith<_$_GetMoreResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetSuggestionsCopyWith<$Res> {
  factory _$$_GetSuggestionsCopyWith(
          _$_GetSuggestions value, $Res Function(_$_GetSuggestions) then) =
      __$$_GetSuggestionsCopyWithImpl<$Res>;
  @useResult
  $Res call({String search});
}

/// @nodoc
class __$$_GetSuggestionsCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$_GetSuggestions>
    implements _$$_GetSuggestionsCopyWith<$Res> {
  __$$_GetSuggestionsCopyWithImpl(
      _$_GetSuggestions _value, $Res Function(_$_GetSuggestions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
  }) {
    return _then(_$_GetSuggestions(
      search: null == search
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
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetSuggestionsCopyWith<_$_GetSuggestions> get copyWith =>
      __$$_GetSuggestionsCopyWithImpl<_$_GetSuggestions>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) getResults,
    required TResult Function(String searchText) getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
    required TResult Function(SortStatus sortStatus) setSortStatus,
  }) {
    return getSuggestions(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? getResults,
    TResult? Function(String searchText)? getMoreResults,
    TResult? Function(String search)? getSuggestions,
    TResult? Function()? setSuggestions,
    TResult? Function(String text)? saveLocaleSuggestion,
    TResult? Function(String text)? deleteLocaleSuggestion,
    TResult? Function(String text)? selectSearchSuggestion,
    TResult? Function()? changeStatus,
    TResult? Function(SortStatus sortStatus)? setSortStatus,
  }) {
    return getSuggestions?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function(String searchText)? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    TResult Function(SortStatus sortStatus)? setSortStatus,
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
    required TResult Function(_SetSortStatus value) setSortStatus,
  }) {
    return getSuggestions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetMoreResults value)? getMoreResults,
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_SetSuggestions value)? setSuggestions,
    TResult? Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult? Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult? Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_SetSortStatus value)? setSortStatus,
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
    TResult Function(_SetSortStatus value)? setSortStatus,
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
    extends _$SearchEventCopyWithImpl<$Res, _$_SetSuggestions>
    implements _$$_SetSuggestionsCopyWith<$Res> {
  __$$_SetSuggestionsCopyWithImpl(
      _$_SetSuggestions _value, $Res Function(_$_SetSuggestions) _then)
      : super(_value, _then);
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
    required TResult Function(String searchText) getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
    required TResult Function(SortStatus sortStatus) setSortStatus,
  }) {
    return setSuggestions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? getResults,
    TResult? Function(String searchText)? getMoreResults,
    TResult? Function(String search)? getSuggestions,
    TResult? Function()? setSuggestions,
    TResult? Function(String text)? saveLocaleSuggestion,
    TResult? Function(String text)? deleteLocaleSuggestion,
    TResult? Function(String text)? selectSearchSuggestion,
    TResult? Function()? changeStatus,
    TResult? Function(SortStatus sortStatus)? setSortStatus,
  }) {
    return setSuggestions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function(String searchText)? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    TResult Function(SortStatus sortStatus)? setSortStatus,
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
    required TResult Function(_SetSortStatus value) setSortStatus,
  }) {
    return setSuggestions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetMoreResults value)? getMoreResults,
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_SetSuggestions value)? setSuggestions,
    TResult? Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult? Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult? Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_SetSortStatus value)? setSortStatus,
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
    TResult Function(_SetSortStatus value)? setSortStatus,
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
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$_SaveLocaleSuggestionCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$_SaveLocaleSuggestion>
    implements _$$_SaveLocaleSuggestionCopyWith<$Res> {
  __$$_SaveLocaleSuggestionCopyWithImpl(_$_SaveLocaleSuggestion _value,
      $Res Function(_$_SaveLocaleSuggestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$_SaveLocaleSuggestion(
      text: null == text
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
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaveLocaleSuggestionCopyWith<_$_SaveLocaleSuggestion> get copyWith =>
      __$$_SaveLocaleSuggestionCopyWithImpl<_$_SaveLocaleSuggestion>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) getResults,
    required TResult Function(String searchText) getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
    required TResult Function(SortStatus sortStatus) setSortStatus,
  }) {
    return saveLocaleSuggestion(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? getResults,
    TResult? Function(String searchText)? getMoreResults,
    TResult? Function(String search)? getSuggestions,
    TResult? Function()? setSuggestions,
    TResult? Function(String text)? saveLocaleSuggestion,
    TResult? Function(String text)? deleteLocaleSuggestion,
    TResult? Function(String text)? selectSearchSuggestion,
    TResult? Function()? changeStatus,
    TResult? Function(SortStatus sortStatus)? setSortStatus,
  }) {
    return saveLocaleSuggestion?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function(String searchText)? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    TResult Function(SortStatus sortStatus)? setSortStatus,
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
    required TResult Function(_SetSortStatus value) setSortStatus,
  }) {
    return saveLocaleSuggestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetMoreResults value)? getMoreResults,
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_SetSuggestions value)? setSuggestions,
    TResult? Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult? Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult? Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_SetSortStatus value)? setSortStatus,
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
    TResult Function(_SetSortStatus value)? setSortStatus,
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
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$_DeleteLocaleSuggestionCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$_DeleteLocaleSuggestion>
    implements _$$_DeleteLocaleSuggestionCopyWith<$Res> {
  __$$_DeleteLocaleSuggestionCopyWithImpl(_$_DeleteLocaleSuggestion _value,
      $Res Function(_$_DeleteLocaleSuggestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$_DeleteLocaleSuggestion(
      text: null == text
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
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteLocaleSuggestionCopyWith<_$_DeleteLocaleSuggestion> get copyWith =>
      __$$_DeleteLocaleSuggestionCopyWithImpl<_$_DeleteLocaleSuggestion>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) getResults,
    required TResult Function(String searchText) getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
    required TResult Function(SortStatus sortStatus) setSortStatus,
  }) {
    return deleteLocaleSuggestion(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? getResults,
    TResult? Function(String searchText)? getMoreResults,
    TResult? Function(String search)? getSuggestions,
    TResult? Function()? setSuggestions,
    TResult? Function(String text)? saveLocaleSuggestion,
    TResult? Function(String text)? deleteLocaleSuggestion,
    TResult? Function(String text)? selectSearchSuggestion,
    TResult? Function()? changeStatus,
    TResult? Function(SortStatus sortStatus)? setSortStatus,
  }) {
    return deleteLocaleSuggestion?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function(String searchText)? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    TResult Function(SortStatus sortStatus)? setSortStatus,
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
    required TResult Function(_SetSortStatus value) setSortStatus,
  }) {
    return deleteLocaleSuggestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetMoreResults value)? getMoreResults,
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_SetSuggestions value)? setSuggestions,
    TResult? Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult? Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult? Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_SetSortStatus value)? setSortStatus,
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
    TResult Function(_SetSortStatus value)? setSortStatus,
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
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$_SelectLocaleSuggestionCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$_SelectLocaleSuggestion>
    implements _$$_SelectLocaleSuggestionCopyWith<$Res> {
  __$$_SelectLocaleSuggestionCopyWithImpl(_$_SelectLocaleSuggestion _value,
      $Res Function(_$_SelectLocaleSuggestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$_SelectLocaleSuggestion(
      text: null == text
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
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectLocaleSuggestionCopyWith<_$_SelectLocaleSuggestion> get copyWith =>
      __$$_SelectLocaleSuggestionCopyWithImpl<_$_SelectLocaleSuggestion>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) getResults,
    required TResult Function(String searchText) getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
    required TResult Function(SortStatus sortStatus) setSortStatus,
  }) {
    return selectSearchSuggestion(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? getResults,
    TResult? Function(String searchText)? getMoreResults,
    TResult? Function(String search)? getSuggestions,
    TResult? Function()? setSuggestions,
    TResult? Function(String text)? saveLocaleSuggestion,
    TResult? Function(String text)? deleteLocaleSuggestion,
    TResult? Function(String text)? selectSearchSuggestion,
    TResult? Function()? changeStatus,
    TResult? Function(SortStatus sortStatus)? setSortStatus,
  }) {
    return selectSearchSuggestion?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function(String searchText)? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    TResult Function(SortStatus sortStatus)? setSortStatus,
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
    required TResult Function(_SetSortStatus value) setSortStatus,
  }) {
    return selectSearchSuggestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetMoreResults value)? getMoreResults,
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_SetSuggestions value)? setSuggestions,
    TResult? Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult? Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult? Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_SetSortStatus value)? setSortStatus,
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
    TResult Function(_SetSortStatus value)? setSortStatus,
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
    extends _$SearchEventCopyWithImpl<$Res, _$_ChangeStatus>
    implements _$$_ChangeStatusCopyWith<$Res> {
  __$$_ChangeStatusCopyWithImpl(
      _$_ChangeStatus _value, $Res Function(_$_ChangeStatus) _then)
      : super(_value, _then);
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
    required TResult Function(String searchText) getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
    required TResult Function(SortStatus sortStatus) setSortStatus,
  }) {
    return changeStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? getResults,
    TResult? Function(String searchText)? getMoreResults,
    TResult? Function(String search)? getSuggestions,
    TResult? Function()? setSuggestions,
    TResult? Function(String text)? saveLocaleSuggestion,
    TResult? Function(String text)? deleteLocaleSuggestion,
    TResult? Function(String text)? selectSearchSuggestion,
    TResult? Function()? changeStatus,
    TResult? Function(SortStatus sortStatus)? setSortStatus,
  }) {
    return changeStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function(String searchText)? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    TResult Function(SortStatus sortStatus)? setSortStatus,
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
    required TResult Function(_SetSortStatus value) setSortStatus,
  }) {
    return changeStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetMoreResults value)? getMoreResults,
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_SetSuggestions value)? setSuggestions,
    TResult? Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult? Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult? Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_SetSortStatus value)? setSortStatus,
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
    TResult Function(_SetSortStatus value)? setSortStatus,
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
abstract class _$$_SetSortStatusCopyWith<$Res> {
  factory _$$_SetSortStatusCopyWith(
          _$_SetSortStatus value, $Res Function(_$_SetSortStatus) then) =
      __$$_SetSortStatusCopyWithImpl<$Res>;
  @useResult
  $Res call({SortStatus sortStatus});
}

/// @nodoc
class __$$_SetSortStatusCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$_SetSortStatus>
    implements _$$_SetSortStatusCopyWith<$Res> {
  __$$_SetSortStatusCopyWithImpl(
      _$_SetSortStatus _value, $Res Function(_$_SetSortStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortStatus = null,
  }) {
    return _then(_$_SetSortStatus(
      sortStatus: null == sortStatus
          ? _value.sortStatus
          : sortStatus // ignore: cast_nullable_to_non_nullable
              as SortStatus,
    ));
  }
}

/// @nodoc

class _$_SetSortStatus implements _SetSortStatus {
  _$_SetSortStatus({required this.sortStatus});

  @override
  final SortStatus sortStatus;

  @override
  String toString() {
    return 'SearchEvent.setSortStatus(sortStatus: $sortStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetSortStatus &&
            (identical(other.sortStatus, sortStatus) ||
                other.sortStatus == sortStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetSortStatusCopyWith<_$_SetSortStatus> get copyWith =>
      __$$_SetSortStatusCopyWithImpl<_$_SetSortStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) getResults,
    required TResult Function(String searchText) getMoreResults,
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function() changeStatus,
    required TResult Function(SortStatus sortStatus) setSortStatus,
  }) {
    return setSortStatus(sortStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? getResults,
    TResult? Function(String searchText)? getMoreResults,
    TResult? Function(String search)? getSuggestions,
    TResult? Function()? setSuggestions,
    TResult? Function(String text)? saveLocaleSuggestion,
    TResult? Function(String text)? deleteLocaleSuggestion,
    TResult? Function(String text)? selectSearchSuggestion,
    TResult? Function()? changeStatus,
    TResult? Function(SortStatus sortStatus)? setSortStatus,
  }) {
    return setSortStatus?.call(sortStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? getResults,
    TResult Function(String searchText)? getMoreResults,
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function()? changeStatus,
    TResult Function(SortStatus sortStatus)? setSortStatus,
    required TResult orElse(),
  }) {
    if (setSortStatus != null) {
      return setSortStatus(sortStatus);
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
    required TResult Function(_SetSortStatus value) setSortStatus,
  }) {
    return setSortStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
    TResult? Function(_GetMoreResults value)? getMoreResults,
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_SetSuggestions value)? setSuggestions,
    TResult? Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult? Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult? Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_SetSortStatus value)? setSortStatus,
  }) {
    return setSortStatus?.call(this);
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
    TResult Function(_SetSortStatus value)? setSortStatus,
    required TResult orElse(),
  }) {
    if (setSortStatus != null) {
      return setSortStatus(this);
    }
    return orElse();
  }
}

abstract class _SetSortStatus implements SearchEvent {
  factory _SetSortStatus({required final SortStatus sortStatus}) =
      _$_SetSortStatus;

  SortStatus get sortStatus;
  @JsonKey(ignore: true)
  _$$_SetSortStatusCopyWith<_$_SetSortStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchState {
  List<AutoEntity> get searchResults => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  FormzStatus get paginationStatus => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get searchText => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  dynamic get moreFetch => throw _privateConstructorUsedError;
  List<OptionsEntity> get suggestions => throw _privateConstructorUsedError;
  int get suggestionsCount => throw _privateConstructorUsedError;
  bool? get suggestionsFetchMore => throw _privateConstructorUsedError;
  FormzStatus get suggestionsStatus => throw _privateConstructorUsedError;
  SortStatus get sortStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {List<AutoEntity> searchResults,
      FormzStatus status,
      FormzStatus paginationStatus,
      String? next,
      String? searchText,
      int count,
      dynamic moreFetch,
      List<OptionsEntity> suggestions,
      int suggestionsCount,
      bool? suggestionsFetchMore,
      FormzStatus suggestionsStatus,
      SortStatus sortStatus});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResults = null,
    Object? status = null,
    Object? paginationStatus = null,
    Object? next = freezed,
    Object? searchText = freezed,
    Object? count = null,
    Object? moreFetch = freezed,
    Object? suggestions = null,
    Object? suggestionsCount = null,
    Object? suggestionsFetchMore = freezed,
    Object? suggestionsStatus = null,
    Object? sortStatus = null,
  }) {
    return _then(_value.copyWith(
      searchResults: null == searchResults
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<AutoEntity>,
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
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      moreFetch: freezed == moreFetch
          ? _value.moreFetch
          : moreFetch // ignore: cast_nullable_to_non_nullable
              as dynamic,
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<OptionsEntity>,
      suggestionsCount: null == suggestionsCount
          ? _value.suggestionsCount
          : suggestionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      suggestionsFetchMore: freezed == suggestionsFetchMore
          ? _value.suggestionsFetchMore
          : suggestionsFetchMore // ignore: cast_nullable_to_non_nullable
              as bool?,
      suggestionsStatus: null == suggestionsStatus
          ? _value.suggestionsStatus
          : suggestionsStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      sortStatus: null == sortStatus
          ? _value.sortStatus
          : sortStatus // ignore: cast_nullable_to_non_nullable
              as SortStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AutoEntity> searchResults,
      FormzStatus status,
      FormzStatus paginationStatus,
      String? next,
      String? searchText,
      int count,
      dynamic moreFetch,
      List<OptionsEntity> suggestions,
      int suggestionsCount,
      bool? suggestionsFetchMore,
      FormzStatus suggestionsStatus,
      SortStatus sortStatus});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_SearchState>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResults = null,
    Object? status = null,
    Object? paginationStatus = null,
    Object? next = freezed,
    Object? searchText = freezed,
    Object? count = null,
    Object? moreFetch = freezed,
    Object? suggestions = null,
    Object? suggestionsCount = null,
    Object? suggestionsFetchMore = freezed,
    Object? suggestionsStatus = null,
    Object? sortStatus = null,
  }) {
    return _then(_$_SearchState(
      searchResults: null == searchResults
          ? _value._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<AutoEntity>,
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
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      moreFetch: freezed == moreFetch ? _value.moreFetch! : moreFetch,
      suggestions: null == suggestions
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<OptionsEntity>,
      suggestionsCount: null == suggestionsCount
          ? _value.suggestionsCount
          : suggestionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      suggestionsFetchMore: freezed == suggestionsFetchMore
          ? _value.suggestionsFetchMore
          : suggestionsFetchMore // ignore: cast_nullable_to_non_nullable
              as bool?,
      suggestionsStatus: null == suggestionsStatus
          ? _value.suggestionsStatus
          : suggestionsStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      sortStatus: null == sortStatus
          ? _value.sortStatus
          : sortStatus // ignore: cast_nullable_to_non_nullable
              as SortStatus,
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
      this.searchText = '',
      this.count = 0,
      this.moreFetch = false,
      final List<OptionsEntity> suggestions = const [],
      this.suggestionsCount = 0,
      this.suggestionsFetchMore = false,
      this.suggestionsStatus = FormzStatus.pure,
      this.sortStatus = SortStatus.newest})
      : _searchResults = searchResults,
        _suggestions = suggestions;

  final List<AutoEntity> _searchResults;
  @override
  @JsonKey()
  List<AutoEntity> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
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
  final String? searchText;
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
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
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
  @JsonKey()
  final SortStatus sortStatus;

  @override
  String toString() {
    return 'SearchState(searchResults: $searchResults, status: $status, paginationStatus: $paginationStatus, next: $next, searchText: $searchText, count: $count, moreFetch: $moreFetch, suggestions: $suggestions, suggestionsCount: $suggestionsCount, suggestionsFetchMore: $suggestionsFetchMore, suggestionsStatus: $suggestionsStatus, sortStatus: $sortStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paginationStatus, paginationStatus) ||
                other.paginationStatus == paginationStatus) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other.moreFetch, moreFetch) &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions) &&
            (identical(other.suggestionsCount, suggestionsCount) ||
                other.suggestionsCount == suggestionsCount) &&
            (identical(other.suggestionsFetchMore, suggestionsFetchMore) ||
                other.suggestionsFetchMore == suggestionsFetchMore) &&
            (identical(other.suggestionsStatus, suggestionsStatus) ||
                other.suggestionsStatus == suggestionsStatus) &&
            (identical(other.sortStatus, sortStatus) ||
                other.sortStatus == sortStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_searchResults),
      status,
      paginationStatus,
      next,
      searchText,
      count,
      const DeepCollectionEquality().hash(moreFetch),
      const DeepCollectionEquality().hash(_suggestions),
      suggestionsCount,
      suggestionsFetchMore,
      suggestionsStatus,
      sortStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  factory _SearchState(
      {final List<AutoEntity> searchResults,
      final FormzStatus status,
      final FormzStatus paginationStatus,
      final String? next,
      final String? searchText,
      final int count,
      final dynamic moreFetch,
      final List<OptionsEntity> suggestions,
      final int suggestionsCount,
      final bool? suggestionsFetchMore,
      final FormzStatus suggestionsStatus,
      final SortStatus sortStatus}) = _$_SearchState;

  @override
  List<AutoEntity> get searchResults;
  @override
  FormzStatus get status;
  @override
  FormzStatus get paginationStatus;
  @override
  String? get next;
  @override
  String? get searchText;
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
  SortStatus get sortStatus;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
