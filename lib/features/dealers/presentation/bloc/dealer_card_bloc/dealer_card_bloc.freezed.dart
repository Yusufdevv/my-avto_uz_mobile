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
    required TResult Function() getList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetList value) getList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetList value)? getList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetList value)? getList,
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
abstract class _$$_GetListCopyWith<$Res> {
  factory _$$_GetListCopyWith(
          _$_GetList value, $Res Function(_$_GetList) then) =
      __$$_GetListCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetListCopyWithImpl<$Res> extends _$DealerCardEventCopyWithImpl<$Res>
    implements _$$_GetListCopyWith<$Res> {
  __$$_GetListCopyWithImpl(_$_GetList _value, $Res Function(_$_GetList) _then)
      : super(_value, (v) => _then(v as _$_GetList));

  @override
  _$_GetList get _value => super._value as _$_GetList;
}

/// @nodoc

class _$_GetList implements _GetList {
  _$_GetList();

  @override
  String toString() {
    return 'DealerCardEvent.getList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetList);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getList,
  }) {
    return getList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getList,
  }) {
    return getList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getList,
    required TResult orElse(),
  }) {
    if (getList != null) {
      return getList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetList value) getList,
  }) {
    return getList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetList value)? getList,
  }) {
    return getList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetList value)? getList,
    required TResult orElse(),
  }) {
    if (getList != null) {
      return getList(this);
    }
    return orElse();
  }
}

abstract class _GetList implements DealerCardEvent {
  factory _GetList() = _$_GetList;
}

/// @nodoc
mixin _$DealerCardState {
  List<DealerCardEntity> get dealerCardEntity =>
      throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DealerCardStateCopyWith<DealerCardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DealerCardStateCopyWith<$Res> {
  factory $DealerCardStateCopyWith(
          DealerCardState value, $Res Function(DealerCardState) then) =
      _$DealerCardStateCopyWithImpl<$Res>;
  $Res call({List<DealerCardEntity> dealerCardEntity, FormzStatus status});
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
    Object? dealerCardEntity = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      dealerCardEntity: dealerCardEntity == freezed
          ? _value.dealerCardEntity
          : dealerCardEntity // ignore: cast_nullable_to_non_nullable
              as List<DealerCardEntity>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
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
  $Res call({List<DealerCardEntity> dealerCardEntity, FormzStatus status});
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
    Object? dealerCardEntity = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_DealerCardState(
      dealerCardEntity: dealerCardEntity == freezed
          ? _value._dealerCardEntity
          : dealerCardEntity // ignore: cast_nullable_to_non_nullable
              as List<DealerCardEntity>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_DealerCardState implements _DealerCardState {
  _$_DealerCardState(
      {final List<DealerCardEntity> dealerCardEntity = const [],
      this.status = FormzStatus.pure})
      : _dealerCardEntity = dealerCardEntity;

  final List<DealerCardEntity> _dealerCardEntity;
  @override
  @JsonKey()
  List<DealerCardEntity> get dealerCardEntity {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dealerCardEntity);
  }

  @override
  @JsonKey()
  final FormzStatus status;

  @override
  String toString() {
    return 'DealerCardState(dealerCardEntity: $dealerCardEntity, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DealerCardState &&
            const DeepCollectionEquality()
                .equals(other._dealerCardEntity, _dealerCardEntity) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_dealerCardEntity),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_DealerCardStateCopyWith<_$_DealerCardState> get copyWith =>
      __$$_DealerCardStateCopyWithImpl<_$_DealerCardState>(this, _$identity);
}

abstract class _DealerCardState implements DealerCardState {
  factory _DealerCardState(
      {final List<DealerCardEntity> dealerCardEntity,
      final FormzStatus status}) = _$_DealerCardState;

  @override
  List<DealerCardEntity> get dealerCardEntity;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_DealerCardStateCopyWith<_$_DealerCardState> get copyWith =>
      throw _privateConstructorUsedError;
}
