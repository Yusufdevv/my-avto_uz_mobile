// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestion_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SuggestionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function(bool? isResultPage, bool? isLocaleSuggestion)
        changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search)? getSuggestions,
    TResult? Function()? setSuggestions,
    TResult? Function(String text)? saveLocaleSuggestion,
    TResult? Function(String text)? deleteLocaleSuggestion,
    TResult? Function(String text)? selectSearchSuggestion,
    TResult? Function(bool? isResultPage, bool? isLocaleSuggestion)?
        changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function(bool? isResultPage, bool? isLocaleSuggestion)?
        changeStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
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
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_SetSuggestions value)? setSuggestions,
    TResult? Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult? Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult? Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult? Function(_ChangeStatus value)? changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
abstract class $SuggestionEventCopyWith<$Res> {
  factory $SuggestionEventCopyWith(
          SuggestionEvent value, $Res Function(SuggestionEvent) then) =
      _$SuggestionEventCopyWithImpl<$Res, SuggestionEvent>;
}

/// @nodoc
class _$SuggestionEventCopyWithImpl<$Res, $Val extends SuggestionEvent>
    implements $SuggestionEventCopyWith<$Res> {
  _$SuggestionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
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
    extends _$SuggestionEventCopyWithImpl<$Res, _$_GetSuggestions>
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
    return 'SuggestionEvent.getSuggestions(search: $search)';
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
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function(bool? isResultPage, bool? isLocaleSuggestion)
        changeStatus,
  }) {
    return getSuggestions(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search)? getSuggestions,
    TResult? Function()? setSuggestions,
    TResult? Function(String text)? saveLocaleSuggestion,
    TResult? Function(String text)? deleteLocaleSuggestion,
    TResult? Function(String text)? selectSearchSuggestion,
    TResult? Function(bool? isResultPage, bool? isLocaleSuggestion)?
        changeStatus,
  }) {
    return getSuggestions?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function(bool? isResultPage, bool? isLocaleSuggestion)?
        changeStatus,
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
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_SetSuggestions value)? setSuggestions,
    TResult? Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult? Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult? Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult? Function(_ChangeStatus value)? changeStatus,
  }) {
    return getSuggestions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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

abstract class _GetSuggestions implements SuggestionEvent {
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
    extends _$SuggestionEventCopyWithImpl<$Res, _$_SetSuggestions>
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
    return 'SuggestionEvent.setSuggestions()';
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
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function(bool? isResultPage, bool? isLocaleSuggestion)
        changeStatus,
  }) {
    return setSuggestions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search)? getSuggestions,
    TResult? Function()? setSuggestions,
    TResult? Function(String text)? saveLocaleSuggestion,
    TResult? Function(String text)? deleteLocaleSuggestion,
    TResult? Function(String text)? selectSearchSuggestion,
    TResult? Function(bool? isResultPage, bool? isLocaleSuggestion)?
        changeStatus,
  }) {
    return setSuggestions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function(bool? isResultPage, bool? isLocaleSuggestion)?
        changeStatus,
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
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_SetSuggestions value)? setSuggestions,
    TResult? Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult? Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult? Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult? Function(_ChangeStatus value)? changeStatus,
  }) {
    return setSuggestions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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

abstract class _SetSuggestions implements SuggestionEvent {
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
    extends _$SuggestionEventCopyWithImpl<$Res, _$_SaveLocaleSuggestion>
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
    return 'SuggestionEvent.saveLocaleSuggestion(text: $text)';
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
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function(bool? isResultPage, bool? isLocaleSuggestion)
        changeStatus,
  }) {
    return saveLocaleSuggestion(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search)? getSuggestions,
    TResult? Function()? setSuggestions,
    TResult? Function(String text)? saveLocaleSuggestion,
    TResult? Function(String text)? deleteLocaleSuggestion,
    TResult? Function(String text)? selectSearchSuggestion,
    TResult? Function(bool? isResultPage, bool? isLocaleSuggestion)?
        changeStatus,
  }) {
    return saveLocaleSuggestion?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function(bool? isResultPage, bool? isLocaleSuggestion)?
        changeStatus,
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
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_SetSuggestions value)? setSuggestions,
    TResult? Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult? Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult? Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult? Function(_ChangeStatus value)? changeStatus,
  }) {
    return saveLocaleSuggestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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

abstract class _SaveLocaleSuggestion implements SuggestionEvent {
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
    extends _$SuggestionEventCopyWithImpl<$Res, _$_DeleteLocaleSuggestion>
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
    return 'SuggestionEvent.deleteLocaleSuggestion(text: $text)';
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
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function(bool? isResultPage, bool? isLocaleSuggestion)
        changeStatus,
  }) {
    return deleteLocaleSuggestion(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search)? getSuggestions,
    TResult? Function()? setSuggestions,
    TResult? Function(String text)? saveLocaleSuggestion,
    TResult? Function(String text)? deleteLocaleSuggestion,
    TResult? Function(String text)? selectSearchSuggestion,
    TResult? Function(bool? isResultPage, bool? isLocaleSuggestion)?
        changeStatus,
  }) {
    return deleteLocaleSuggestion?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function(bool? isResultPage, bool? isLocaleSuggestion)?
        changeStatus,
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
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_SetSuggestions value)? setSuggestions,
    TResult? Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult? Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult? Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult? Function(_ChangeStatus value)? changeStatus,
  }) {
    return deleteLocaleSuggestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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

abstract class _DeleteLocaleSuggestion implements SuggestionEvent {
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
    extends _$SuggestionEventCopyWithImpl<$Res, _$_SelectLocaleSuggestion>
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
    return 'SuggestionEvent.selectSearchSuggestion(text: $text)';
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
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function(bool? isResultPage, bool? isLocaleSuggestion)
        changeStatus,
  }) {
    return selectSearchSuggestion(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search)? getSuggestions,
    TResult? Function()? setSuggestions,
    TResult? Function(String text)? saveLocaleSuggestion,
    TResult? Function(String text)? deleteLocaleSuggestion,
    TResult? Function(String text)? selectSearchSuggestion,
    TResult? Function(bool? isResultPage, bool? isLocaleSuggestion)?
        changeStatus,
  }) {
    return selectSearchSuggestion?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function(bool? isResultPage, bool? isLocaleSuggestion)?
        changeStatus,
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
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_SetSuggestions value)? setSuggestions,
    TResult? Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult? Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult? Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult? Function(_ChangeStatus value)? changeStatus,
  }) {
    return selectSearchSuggestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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

abstract class _SelectLocaleSuggestion implements SuggestionEvent {
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
  @useResult
  $Res call({bool? isResultPage, bool? isLocaleSuggestion});
}

/// @nodoc
class __$$_ChangeStatusCopyWithImpl<$Res>
    extends _$SuggestionEventCopyWithImpl<$Res, _$_ChangeStatus>
    implements _$$_ChangeStatusCopyWith<$Res> {
  __$$_ChangeStatusCopyWithImpl(
      _$_ChangeStatus _value, $Res Function(_$_ChangeStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isResultPage = freezed,
    Object? isLocaleSuggestion = freezed,
  }) {
    return _then(_$_ChangeStatus(
      isResultPage: freezed == isResultPage
          ? _value.isResultPage
          : isResultPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLocaleSuggestion: freezed == isLocaleSuggestion
          ? _value.isLocaleSuggestion
          : isLocaleSuggestion // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_ChangeStatus implements _ChangeStatus {
  _$_ChangeStatus({this.isResultPage, this.isLocaleSuggestion});

  @override
  final bool? isResultPage;
  @override
  final bool? isLocaleSuggestion;

  @override
  String toString() {
    return 'SuggestionEvent.changeStatus(isResultPage: $isResultPage, isLocaleSuggestion: $isLocaleSuggestion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeStatus &&
            (identical(other.isResultPage, isResultPage) ||
                other.isResultPage == isResultPage) &&
            (identical(other.isLocaleSuggestion, isLocaleSuggestion) ||
                other.isLocaleSuggestion == isLocaleSuggestion));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isResultPage, isLocaleSuggestion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeStatusCopyWith<_$_ChangeStatus> get copyWith =>
      __$$_ChangeStatusCopyWithImpl<_$_ChangeStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String search) getSuggestions,
    required TResult Function() setSuggestions,
    required TResult Function(String text) saveLocaleSuggestion,
    required TResult Function(String text) deleteLocaleSuggestion,
    required TResult Function(String text) selectSearchSuggestion,
    required TResult Function(bool? isResultPage, bool? isLocaleSuggestion)
        changeStatus,
  }) {
    return changeStatus(isResultPage, isLocaleSuggestion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search)? getSuggestions,
    TResult? Function()? setSuggestions,
    TResult? Function(String text)? saveLocaleSuggestion,
    TResult? Function(String text)? deleteLocaleSuggestion,
    TResult? Function(String text)? selectSearchSuggestion,
    TResult? Function(bool? isResultPage, bool? isLocaleSuggestion)?
        changeStatus,
  }) {
    return changeStatus?.call(isResultPage, isLocaleSuggestion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search)? getSuggestions,
    TResult Function()? setSuggestions,
    TResult Function(String text)? saveLocaleSuggestion,
    TResult Function(String text)? deleteLocaleSuggestion,
    TResult Function(String text)? selectSearchSuggestion,
    TResult Function(bool? isResultPage, bool? isLocaleSuggestion)?
        changeStatus,
    required TResult orElse(),
  }) {
    if (changeStatus != null) {
      return changeStatus(isResultPage, isLocaleSuggestion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
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
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_SetSuggestions value)? setSuggestions,
    TResult? Function(_SaveLocaleSuggestion value)? saveLocaleSuggestion,
    TResult? Function(_DeleteLocaleSuggestion value)? deleteLocaleSuggestion,
    TResult? Function(_SelectLocaleSuggestion value)? selectSearchSuggestion,
    TResult? Function(_ChangeStatus value)? changeStatus,
  }) {
    return changeStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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

abstract class _ChangeStatus implements SuggestionEvent {
  factory _ChangeStatus(
      {final bool? isResultPage,
      final bool? isLocaleSuggestion}) = _$_ChangeStatus;

  bool? get isResultPage;
  bool? get isLocaleSuggestion;
  @JsonKey(ignore: true)
  _$$_ChangeStatusCopyWith<_$_ChangeStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SuggestionState {
  bool get isLocaleSuggestion => throw _privateConstructorUsedError;
  bool get isResultPage => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  List<String> get suggestions => throw _privateConstructorUsedError;
  List<String> get popularSuggestions => throw _privateConstructorUsedError;
  List<String> get localeSuggestions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SuggestionStateCopyWith<SuggestionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionStateCopyWith<$Res> {
  factory $SuggestionStateCopyWith(
          SuggestionState value, $Res Function(SuggestionState) then) =
      _$SuggestionStateCopyWithImpl<$Res, SuggestionState>;
  @useResult
  $Res call(
      {bool isLocaleSuggestion,
      bool isResultPage,
      FormzStatus status,
      List<String> suggestions,
      List<String> popularSuggestions,
      List<String> localeSuggestions});
}

/// @nodoc
class _$SuggestionStateCopyWithImpl<$Res, $Val extends SuggestionState>
    implements $SuggestionStateCopyWith<$Res> {
  _$SuggestionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLocaleSuggestion = null,
    Object? isResultPage = null,
    Object? status = null,
    Object? suggestions = null,
    Object? popularSuggestions = null,
    Object? localeSuggestions = null,
  }) {
    return _then(_value.copyWith(
      isLocaleSuggestion: null == isLocaleSuggestion
          ? _value.isLocaleSuggestion
          : isLocaleSuggestion // ignore: cast_nullable_to_non_nullable
              as bool,
      isResultPage: null == isResultPage
          ? _value.isResultPage
          : isResultPage // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      popularSuggestions: null == popularSuggestions
          ? _value.popularSuggestions
          : popularSuggestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      localeSuggestions: null == localeSuggestions
          ? _value.localeSuggestions
          : localeSuggestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SuggestionStateCopyWith<$Res>
    implements $SuggestionStateCopyWith<$Res> {
  factory _$$_SuggestionStateCopyWith(
          _$_SuggestionState value, $Res Function(_$_SuggestionState) then) =
      __$$_SuggestionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLocaleSuggestion,
      bool isResultPage,
      FormzStatus status,
      List<String> suggestions,
      List<String> popularSuggestions,
      List<String> localeSuggestions});
}

/// @nodoc
class __$$_SuggestionStateCopyWithImpl<$Res>
    extends _$SuggestionStateCopyWithImpl<$Res, _$_SuggestionState>
    implements _$$_SuggestionStateCopyWith<$Res> {
  __$$_SuggestionStateCopyWithImpl(
      _$_SuggestionState _value, $Res Function(_$_SuggestionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLocaleSuggestion = null,
    Object? isResultPage = null,
    Object? status = null,
    Object? suggestions = null,
    Object? popularSuggestions = null,
    Object? localeSuggestions = null,
  }) {
    return _then(_$_SuggestionState(
      isLocaleSuggestion: null == isLocaleSuggestion
          ? _value.isLocaleSuggestion
          : isLocaleSuggestion // ignore: cast_nullable_to_non_nullable
              as bool,
      isResultPage: null == isResultPage
          ? _value.isResultPage
          : isResultPage // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      suggestions: null == suggestions
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      popularSuggestions: null == popularSuggestions
          ? _value._popularSuggestions
          : popularSuggestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      localeSuggestions: null == localeSuggestions
          ? _value._localeSuggestions
          : localeSuggestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_SuggestionState implements _SuggestionState {
  _$_SuggestionState(
      {this.isLocaleSuggestion = false,
      this.isResultPage = false,
      this.status = FormzStatus.pure,
      final List<String> suggestions = const [],
      final List<String> popularSuggestions = const [],
      final List<String> localeSuggestions = const []})
      : _suggestions = suggestions,
        _popularSuggestions = popularSuggestions,
        _localeSuggestions = localeSuggestions;

  @override
  @JsonKey()
  final bool isLocaleSuggestion;
  @override
  @JsonKey()
  final bool isResultPage;
  @override
  @JsonKey()
  final FormzStatus status;
  final List<String> _suggestions;
  @override
  @JsonKey()
  List<String> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  final List<String> _popularSuggestions;
  @override
  @JsonKey()
  List<String> get popularSuggestions {
    if (_popularSuggestions is EqualUnmodifiableListView)
      return _popularSuggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularSuggestions);
  }

  final List<String> _localeSuggestions;
  @override
  @JsonKey()
  List<String> get localeSuggestions {
    if (_localeSuggestions is EqualUnmodifiableListView)
      return _localeSuggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_localeSuggestions);
  }

  @override
  String toString() {
    return 'SuggestionState(isLocaleSuggestion: $isLocaleSuggestion, isResultPage: $isResultPage, status: $status, suggestions: $suggestions, popularSuggestions: $popularSuggestions, localeSuggestions: $localeSuggestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuggestionState &&
            (identical(other.isLocaleSuggestion, isLocaleSuggestion) ||
                other.isLocaleSuggestion == isLocaleSuggestion) &&
            (identical(other.isResultPage, isResultPage) ||
                other.isResultPage == isResultPage) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions) &&
            const DeepCollectionEquality()
                .equals(other._popularSuggestions, _popularSuggestions) &&
            const DeepCollectionEquality()
                .equals(other._localeSuggestions, _localeSuggestions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLocaleSuggestion,
      isResultPage,
      status,
      const DeepCollectionEquality().hash(_suggestions),
      const DeepCollectionEquality().hash(_popularSuggestions),
      const DeepCollectionEquality().hash(_localeSuggestions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuggestionStateCopyWith<_$_SuggestionState> get copyWith =>
      __$$_SuggestionStateCopyWithImpl<_$_SuggestionState>(this, _$identity);
}

abstract class _SuggestionState implements SuggestionState {
  factory _SuggestionState(
      {final bool isLocaleSuggestion,
      final bool isResultPage,
      final FormzStatus status,
      final List<String> suggestions,
      final List<String> popularSuggestions,
      final List<String> localeSuggestions}) = _$_SuggestionState;

  @override
  bool get isLocaleSuggestion;
  @override
  bool get isResultPage;
  @override
  FormzStatus get status;
  @override
  List<String> get suggestions;
  @override
  List<String> get popularSuggestions;
  @override
  List<String> get localeSuggestions;
  @override
  @JsonKey(ignore: true)
  _$$_SuggestionStateCopyWith<_$_SuggestionState> get copyWith =>
      throw _privateConstructorUsedError;
}