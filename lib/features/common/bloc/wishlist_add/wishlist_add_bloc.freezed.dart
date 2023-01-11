// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_add_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WishlistAddEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, int index) addWishlist,
    required TResult Function(int id, dynamic index) removeWishlist,
    required TResult Function() clearState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, int index)? addWishlist,
    TResult? Function(int id, dynamic index)? removeWishlist,
    TResult? Function()? clearState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, int index)? addWishlist,
    TResult Function(int id, dynamic index)? removeWishlist,
    TResult Function()? clearState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddWishlist value) addWishlist,
    required TResult Function(_RemoveWishlist value) removeWishlist,
    required TResult Function(_ClearState value) clearState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddWishlist value)? addWishlist,
    TResult? Function(_RemoveWishlist value)? removeWishlist,
    TResult? Function(_ClearState value)? clearState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddWishlist value)? addWishlist,
    TResult Function(_RemoveWishlist value)? removeWishlist,
    TResult Function(_ClearState value)? clearState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishlistAddEventCopyWith<$Res> {
  factory $WishlistAddEventCopyWith(
          WishlistAddEvent value, $Res Function(WishlistAddEvent) then) =
      _$WishlistAddEventCopyWithImpl<$Res, WishlistAddEvent>;
}

/// @nodoc
class _$WishlistAddEventCopyWithImpl<$Res, $Val extends WishlistAddEvent>
    implements $WishlistAddEventCopyWith<$Res> {
  _$WishlistAddEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AddWishlistCopyWith<$Res> {
  factory _$$_AddWishlistCopyWith(
          _$_AddWishlist value, $Res Function(_$_AddWishlist) then) =
      __$$_AddWishlistCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, int index});
}

/// @nodoc
class __$$_AddWishlistCopyWithImpl<$Res>
    extends _$WishlistAddEventCopyWithImpl<$Res, _$_AddWishlist>
    implements _$$_AddWishlistCopyWith<$Res> {
  __$$_AddWishlistCopyWithImpl(
      _$_AddWishlist _value, $Res Function(_$_AddWishlist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
  }) {
    return _then(_$_AddWishlist(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_AddWishlist implements _AddWishlist {
  _$_AddWishlist(this.id, this.index);

  @override
  final int id;
  @override
  final int index;

  @override
  String toString() {
    return 'WishlistAddEvent.addWishlist(id: $id, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddWishlist &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddWishlistCopyWith<_$_AddWishlist> get copyWith =>
      __$$_AddWishlistCopyWithImpl<_$_AddWishlist>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, int index) addWishlist,
    required TResult Function(int id, dynamic index) removeWishlist,
    required TResult Function() clearState,
  }) {
    return addWishlist(id, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, int index)? addWishlist,
    TResult? Function(int id, dynamic index)? removeWishlist,
    TResult? Function()? clearState,
  }) {
    return addWishlist?.call(id, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, int index)? addWishlist,
    TResult Function(int id, dynamic index)? removeWishlist,
    TResult Function()? clearState,
    required TResult orElse(),
  }) {
    if (addWishlist != null) {
      return addWishlist(id, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddWishlist value) addWishlist,
    required TResult Function(_RemoveWishlist value) removeWishlist,
    required TResult Function(_ClearState value) clearState,
  }) {
    return addWishlist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddWishlist value)? addWishlist,
    TResult? Function(_RemoveWishlist value)? removeWishlist,
    TResult? Function(_ClearState value)? clearState,
  }) {
    return addWishlist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddWishlist value)? addWishlist,
    TResult Function(_RemoveWishlist value)? removeWishlist,
    TResult Function(_ClearState value)? clearState,
    required TResult orElse(),
  }) {
    if (addWishlist != null) {
      return addWishlist(this);
    }
    return orElse();
  }
}

abstract class _AddWishlist implements WishlistAddEvent {
  factory _AddWishlist(final int id, final int index) = _$_AddWishlist;

  int get id;
  int get index;
  @JsonKey(ignore: true)
  _$$_AddWishlistCopyWith<_$_AddWishlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemoveWishlistCopyWith<$Res> {
  factory _$$_RemoveWishlistCopyWith(
          _$_RemoveWishlist value, $Res Function(_$_RemoveWishlist) then) =
      __$$_RemoveWishlistCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, dynamic index});
}

/// @nodoc
class __$$_RemoveWishlistCopyWithImpl<$Res>
    extends _$WishlistAddEventCopyWithImpl<$Res, _$_RemoveWishlist>
    implements _$$_RemoveWishlistCopyWith<$Res> {
  __$$_RemoveWishlistCopyWithImpl(
      _$_RemoveWishlist _value, $Res Function(_$_RemoveWishlist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = freezed,
  }) {
    return _then(_$_RemoveWishlist(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == index ? _value.index! : index,
    ));
  }
}

/// @nodoc

class _$_RemoveWishlist implements _RemoveWishlist {
  _$_RemoveWishlist(this.id, this.index);

  @override
  final int id;
  @override
  final dynamic index;

  @override
  String toString() {
    return 'WishlistAddEvent.removeWishlist(id: $id, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveWishlist &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoveWishlistCopyWith<_$_RemoveWishlist> get copyWith =>
      __$$_RemoveWishlistCopyWithImpl<_$_RemoveWishlist>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, int index) addWishlist,
    required TResult Function(int id, dynamic index) removeWishlist,
    required TResult Function() clearState,
  }) {
    return removeWishlist(id, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, int index)? addWishlist,
    TResult? Function(int id, dynamic index)? removeWishlist,
    TResult? Function()? clearState,
  }) {
    return removeWishlist?.call(id, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, int index)? addWishlist,
    TResult Function(int id, dynamic index)? removeWishlist,
    TResult Function()? clearState,
    required TResult orElse(),
  }) {
    if (removeWishlist != null) {
      return removeWishlist(id, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddWishlist value) addWishlist,
    required TResult Function(_RemoveWishlist value) removeWishlist,
    required TResult Function(_ClearState value) clearState,
  }) {
    return removeWishlist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddWishlist value)? addWishlist,
    TResult? Function(_RemoveWishlist value)? removeWishlist,
    TResult? Function(_ClearState value)? clearState,
  }) {
    return removeWishlist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddWishlist value)? addWishlist,
    TResult Function(_RemoveWishlist value)? removeWishlist,
    TResult Function(_ClearState value)? clearState,
    required TResult orElse(),
  }) {
    if (removeWishlist != null) {
      return removeWishlist(this);
    }
    return orElse();
  }
}

abstract class _RemoveWishlist implements WishlistAddEvent {
  factory _RemoveWishlist(final int id, final dynamic index) =
      _$_RemoveWishlist;

  int get id;
  dynamic get index;
  @JsonKey(ignore: true)
  _$$_RemoveWishlistCopyWith<_$_RemoveWishlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ClearStateCopyWith<$Res> {
  factory _$$_ClearStateCopyWith(
          _$_ClearState value, $Res Function(_$_ClearState) then) =
      __$$_ClearStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearStateCopyWithImpl<$Res>
    extends _$WishlistAddEventCopyWithImpl<$Res, _$_ClearState>
    implements _$$_ClearStateCopyWith<$Res> {
  __$$_ClearStateCopyWithImpl(
      _$_ClearState _value, $Res Function(_$_ClearState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ClearState implements _ClearState {
  _$_ClearState();

  @override
  String toString() {
    return 'WishlistAddEvent.clearState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ClearState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, int index) addWishlist,
    required TResult Function(int id, dynamic index) removeWishlist,
    required TResult Function() clearState,
  }) {
    return clearState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, int index)? addWishlist,
    TResult? Function(int id, dynamic index)? removeWishlist,
    TResult? Function()? clearState,
  }) {
    return clearState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, int index)? addWishlist,
    TResult Function(int id, dynamic index)? removeWishlist,
    TResult Function()? clearState,
    required TResult orElse(),
  }) {
    if (clearState != null) {
      return clearState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddWishlist value) addWishlist,
    required TResult Function(_RemoveWishlist value) removeWishlist,
    required TResult Function(_ClearState value) clearState,
  }) {
    return clearState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddWishlist value)? addWishlist,
    TResult? Function(_RemoveWishlist value)? removeWishlist,
    TResult? Function(_ClearState value)? clearState,
  }) {
    return clearState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddWishlist value)? addWishlist,
    TResult Function(_RemoveWishlist value)? removeWishlist,
    TResult Function(_ClearState value)? clearState,
    required TResult orElse(),
  }) {
    if (clearState != null) {
      return clearState(this);
    }
    return orElse();
  }
}

abstract class _ClearState implements WishlistAddEvent {
  factory _ClearState() = _$_ClearState;
}

/// @nodoc
mixin _$WishlistAddState {
  FormzStatus get addStatus => throw _privateConstructorUsedError;
  FormzStatus get removeStatus => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WishlistAddStateCopyWith<WishlistAddState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishlistAddStateCopyWith<$Res> {
  factory $WishlistAddStateCopyWith(
          WishlistAddState value, $Res Function(WishlistAddState) then) =
      _$WishlistAddStateCopyWithImpl<$Res, WishlistAddState>;
  @useResult
  $Res call(
      {FormzStatus addStatus, FormzStatus removeStatus, int index, int id});
}

/// @nodoc
class _$WishlistAddStateCopyWithImpl<$Res, $Val extends WishlistAddState>
    implements $WishlistAddStateCopyWith<$Res> {
  _$WishlistAddStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addStatus = null,
    Object? removeStatus = null,
    Object? index = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      addStatus: null == addStatus
          ? _value.addStatus
          : addStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      removeStatus: null == removeStatus
          ? _value.removeStatus
          : removeStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WishlistAddStateCopyWith<$Res>
    implements $WishlistAddStateCopyWith<$Res> {
  factory _$$_WishlistAddStateCopyWith(
          _$_WishlistAddState value, $Res Function(_$_WishlistAddState) then) =
      __$$_WishlistAddStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus addStatus, FormzStatus removeStatus, int index, int id});
}

/// @nodoc
class __$$_WishlistAddStateCopyWithImpl<$Res>
    extends _$WishlistAddStateCopyWithImpl<$Res, _$_WishlistAddState>
    implements _$$_WishlistAddStateCopyWith<$Res> {
  __$$_WishlistAddStateCopyWithImpl(
      _$_WishlistAddState _value, $Res Function(_$_WishlistAddState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addStatus = null,
    Object? removeStatus = null,
    Object? index = null,
    Object? id = null,
  }) {
    return _then(_$_WishlistAddState(
      addStatus: null == addStatus
          ? _value.addStatus
          : addStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      removeStatus: null == removeStatus
          ? _value.removeStatus
          : removeStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_WishlistAddState implements _WishlistAddState {
  _$_WishlistAddState(
      {this.addStatus = FormzStatus.pure,
      this.removeStatus = FormzStatus.pure,
      this.index = -1,
      this.id = -1});

  @override
  @JsonKey()
  final FormzStatus addStatus;
  @override
  @JsonKey()
  final FormzStatus removeStatus;
  @override
  @JsonKey()
  final int index;
  @override
  @JsonKey()
  final int id;

  @override
  String toString() {
    return 'WishlistAddState(addStatus: $addStatus, removeStatus: $removeStatus, index: $index, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WishlistAddState &&
            (identical(other.addStatus, addStatus) ||
                other.addStatus == addStatus) &&
            (identical(other.removeStatus, removeStatus) ||
                other.removeStatus == removeStatus) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, addStatus, removeStatus, index, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WishlistAddStateCopyWith<_$_WishlistAddState> get copyWith =>
      __$$_WishlistAddStateCopyWithImpl<_$_WishlistAddState>(this, _$identity);
}

abstract class _WishlistAddState implements WishlistAddState {
  factory _WishlistAddState(
      {final FormzStatus addStatus,
      final FormzStatus removeStatus,
      final int index,
      final int id}) = _$_WishlistAddState;

  @override
  FormzStatus get addStatus;
  @override
  FormzStatus get removeStatus;
  @override
  int get index;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_WishlistAddStateCopyWith<_$_WishlistAddState> get copyWith =>
      throw _privateConstructorUsedError;
}
