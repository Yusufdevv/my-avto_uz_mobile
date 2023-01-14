// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marks_in_dealers_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MarksInDealersEvent {
  String get slug => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String slug) getResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String slug)? getResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String slug)? getResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MarksInDealersEventCopyWith<MarksInDealersEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarksInDealersEventCopyWith<$Res> {
  factory $MarksInDealersEventCopyWith(
          MarksInDealersEvent value, $Res Function(MarksInDealersEvent) then) =
      _$MarksInDealersEventCopyWithImpl<$Res, MarksInDealersEvent>;
  @useResult
  $Res call({String slug});
}

/// @nodoc
class _$MarksInDealersEventCopyWithImpl<$Res, $Val extends MarksInDealersEvent>
    implements $MarksInDealersEventCopyWith<$Res> {
  _$MarksInDealersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
  }) {
    return _then(_value.copyWith(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetResultsCopyWith<$Res>
    implements $MarksInDealersEventCopyWith<$Res> {
  factory _$$_GetResultsCopyWith(
          _$_GetResults value, $Res Function(_$_GetResults) then) =
      __$$_GetResultsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String slug});
}

/// @nodoc
class __$$_GetResultsCopyWithImpl<$Res>
    extends _$MarksInDealersEventCopyWithImpl<$Res, _$_GetResults>
    implements _$$_GetResultsCopyWith<$Res> {
  __$$_GetResultsCopyWithImpl(
      _$_GetResults _value, $Res Function(_$_GetResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
  }) {
    return _then(_$_GetResults(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetResults implements _GetResults {
  _$_GetResults({required this.slug});

  @override
  final String slug;

  @override
  String toString() {
    return 'MarksInDealersEvent.getResults(slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetResults &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetResultsCopyWith<_$_GetResults> get copyWith =>
      __$$_GetResultsCopyWithImpl<_$_GetResults>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String slug) getResults,
  }) {
    return getResults(slug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String slug)? getResults,
  }) {
    return getResults?.call(slug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String slug)? getResults,
    required TResult orElse(),
  }) {
    if (getResults != null) {
      return getResults(slug);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResults value) getResults,
  }) {
    return getResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResults value)? getResults,
  }) {
    return getResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResults value)? getResults,
    required TResult orElse(),
  }) {
    if (getResults != null) {
      return getResults(this);
    }
    return orElse();
  }
}

abstract class _GetResults implements MarksInDealersEvent {
  factory _GetResults({required final String slug}) = _$_GetResults;

  @override
  String get slug;
  @override
  @JsonKey(ignore: true)
  _$$_GetResultsCopyWith<_$_GetResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MarksInDealersState {
  List<MarksInDealerEntity> get marks => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MarksInDealersStateCopyWith<MarksInDealersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarksInDealersStateCopyWith<$Res> {
  factory $MarksInDealersStateCopyWith(
          MarksInDealersState value, $Res Function(MarksInDealersState) then) =
      _$MarksInDealersStateCopyWithImpl<$Res, MarksInDealersState>;
  @useResult
  $Res call({List<MarksInDealerEntity> marks, FormzStatus status});
}

/// @nodoc
class _$MarksInDealersStateCopyWithImpl<$Res, $Val extends MarksInDealersState>
    implements $MarksInDealersStateCopyWith<$Res> {
  _$MarksInDealersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marks = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      marks: null == marks
          ? _value.marks
          : marks // ignore: cast_nullable_to_non_nullable
              as List<MarksInDealerEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MarksInDealersStateCopyWith<$Res>
    implements $MarksInDealersStateCopyWith<$Res> {
  factory _$$_MarksInDealersStateCopyWith(_$_MarksInDealersState value,
          $Res Function(_$_MarksInDealersState) then) =
      __$$_MarksInDealersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MarksInDealerEntity> marks, FormzStatus status});
}

/// @nodoc
class __$$_MarksInDealersStateCopyWithImpl<$Res>
    extends _$MarksInDealersStateCopyWithImpl<$Res, _$_MarksInDealersState>
    implements _$$_MarksInDealersStateCopyWith<$Res> {
  __$$_MarksInDealersStateCopyWithImpl(_$_MarksInDealersState _value,
      $Res Function(_$_MarksInDealersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marks = null,
    Object? status = null,
  }) {
    return _then(_$_MarksInDealersState(
      marks: null == marks
          ? _value._marks
          : marks // ignore: cast_nullable_to_non_nullable
              as List<MarksInDealerEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_MarksInDealersState implements _MarksInDealersState {
  _$_MarksInDealersState(
      {final List<MarksInDealerEntity> marks = const [],
      this.status = FormzStatus.pure})
      : _marks = marks;

  final List<MarksInDealerEntity> _marks;
  @override
  @JsonKey()
  List<MarksInDealerEntity> get marks {
    if (_marks is EqualUnmodifiableListView) return _marks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_marks);
  }

  @override
  @JsonKey()
  final FormzStatus status;

  @override
  String toString() {
    return 'MarksInDealersState(marks: $marks, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarksInDealersState &&
            const DeepCollectionEquality().equals(other._marks, _marks) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_marks), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MarksInDealersStateCopyWith<_$_MarksInDealersState> get copyWith =>
      __$$_MarksInDealersStateCopyWithImpl<_$_MarksInDealersState>(
          this, _$identity);
}

abstract class _MarksInDealersState implements MarksInDealersState {
  factory _MarksInDealersState(
      {final List<MarksInDealerEntity> marks,
      final FormzStatus status}) = _$_MarksInDealersState;

  @override
  List<MarksInDealerEntity> get marks;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_MarksInDealersStateCopyWith<_$_MarksInDealersState> get copyWith =>
      throw _privateConstructorUsedError;
}
