// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_ad_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TopAdEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTopAds,
    required TResult Function(String endpoint) getFavorites,
    required TResult Function() getMoreTopAds,
    required TResult Function(int index, int id) changeIsWish,
    required TResult Function(int id, bool adding) deleteFavoriteItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getTopAds,
    TResult? Function(String endpoint)? getFavorites,
    TResult? Function()? getMoreTopAds,
    TResult? Function(int index, int id)? changeIsWish,
    TResult? Function(int id, bool adding)? deleteFavoriteItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTopAds,
    TResult Function(String endpoint)? getFavorites,
    TResult Function()? getMoreTopAds,
    TResult Function(int index, int id)? changeIsWish,
    TResult Function(int id, bool adding)? deleteFavoriteItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTopAds value) getTopAds,
    required TResult Function(_GetFavorites value) getFavorites,
    required TResult Function(_GetMoreTopAds value) getMoreTopAds,
    required TResult Function(_ChangeIsWish value) changeIsWish,
    required TResult Function(_DeleteFavoriteItem value) deleteFavoriteItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTopAds value)? getTopAds,
    TResult? Function(_GetFavorites value)? getFavorites,
    TResult? Function(_GetMoreTopAds value)? getMoreTopAds,
    TResult? Function(_ChangeIsWish value)? changeIsWish,
    TResult? Function(_DeleteFavoriteItem value)? deleteFavoriteItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTopAds value)? getTopAds,
    TResult Function(_GetFavorites value)? getFavorites,
    TResult Function(_GetMoreTopAds value)? getMoreTopAds,
    TResult Function(_ChangeIsWish value)? changeIsWish,
    TResult Function(_DeleteFavoriteItem value)? deleteFavoriteItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopAdEventCopyWith<$Res> {
  factory $TopAdEventCopyWith(
          TopAdEvent value, $Res Function(TopAdEvent) then) =
      _$TopAdEventCopyWithImpl<$Res, TopAdEvent>;
}

/// @nodoc
class _$TopAdEventCopyWithImpl<$Res, $Val extends TopAdEvent>
    implements $TopAdEventCopyWith<$Res> {
  _$TopAdEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetTopAdsCopyWith<$Res> {
  factory _$$_GetTopAdsCopyWith(
          _$_GetTopAds value, $Res Function(_$_GetTopAds) then) =
      __$$_GetTopAdsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetTopAdsCopyWithImpl<$Res>
    extends _$TopAdEventCopyWithImpl<$Res, _$_GetTopAds>
    implements _$$_GetTopAdsCopyWith<$Res> {
  __$$_GetTopAdsCopyWithImpl(
      _$_GetTopAds _value, $Res Function(_$_GetTopAds) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetTopAds implements _GetTopAds {
  _$_GetTopAds();

  @override
  String toString() {
    return 'TopAdEvent.getTopAds()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetTopAds);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTopAds,
    required TResult Function(String endpoint) getFavorites,
    required TResult Function() getMoreTopAds,
    required TResult Function(int index, int id) changeIsWish,
    required TResult Function(int id, bool adding) deleteFavoriteItem,
  }) {
    return getTopAds();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getTopAds,
    TResult? Function(String endpoint)? getFavorites,
    TResult? Function()? getMoreTopAds,
    TResult? Function(int index, int id)? changeIsWish,
    TResult? Function(int id, bool adding)? deleteFavoriteItem,
  }) {
    return getTopAds?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTopAds,
    TResult Function(String endpoint)? getFavorites,
    TResult Function()? getMoreTopAds,
    TResult Function(int index, int id)? changeIsWish,
    TResult Function(int id, bool adding)? deleteFavoriteItem,
    required TResult orElse(),
  }) {
    if (getTopAds != null) {
      return getTopAds();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTopAds value) getTopAds,
    required TResult Function(_GetFavorites value) getFavorites,
    required TResult Function(_GetMoreTopAds value) getMoreTopAds,
    required TResult Function(_ChangeIsWish value) changeIsWish,
    required TResult Function(_DeleteFavoriteItem value) deleteFavoriteItem,
  }) {
    return getTopAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTopAds value)? getTopAds,
    TResult? Function(_GetFavorites value)? getFavorites,
    TResult? Function(_GetMoreTopAds value)? getMoreTopAds,
    TResult? Function(_ChangeIsWish value)? changeIsWish,
    TResult? Function(_DeleteFavoriteItem value)? deleteFavoriteItem,
  }) {
    return getTopAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTopAds value)? getTopAds,
    TResult Function(_GetFavorites value)? getFavorites,
    TResult Function(_GetMoreTopAds value)? getMoreTopAds,
    TResult Function(_ChangeIsWish value)? changeIsWish,
    TResult Function(_DeleteFavoriteItem value)? deleteFavoriteItem,
    required TResult orElse(),
  }) {
    if (getTopAds != null) {
      return getTopAds(this);
    }
    return orElse();
  }
}

abstract class _GetTopAds implements TopAdEvent {
  factory _GetTopAds() = _$_GetTopAds;
}

/// @nodoc
abstract class _$$_GetFavoritesCopyWith<$Res> {
  factory _$$_GetFavoritesCopyWith(
          _$_GetFavorites value, $Res Function(_$_GetFavorites) then) =
      __$$_GetFavoritesCopyWithImpl<$Res>;
  @useResult
  $Res call({String endpoint});
}

/// @nodoc
class __$$_GetFavoritesCopyWithImpl<$Res>
    extends _$TopAdEventCopyWithImpl<$Res, _$_GetFavorites>
    implements _$$_GetFavoritesCopyWith<$Res> {
  __$$_GetFavoritesCopyWithImpl(
      _$_GetFavorites _value, $Res Function(_$_GetFavorites) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoint = null,
  }) {
    return _then(_$_GetFavorites(
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetFavorites implements _GetFavorites {
  _$_GetFavorites({required this.endpoint});

  @override
  final String endpoint;

  @override
  String toString() {
    return 'TopAdEvent.getFavorites(endpoint: $endpoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetFavorites &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, endpoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetFavoritesCopyWith<_$_GetFavorites> get copyWith =>
      __$$_GetFavoritesCopyWithImpl<_$_GetFavorites>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTopAds,
    required TResult Function(String endpoint) getFavorites,
    required TResult Function() getMoreTopAds,
    required TResult Function(int index, int id) changeIsWish,
    required TResult Function(int id, bool adding) deleteFavoriteItem,
  }) {
    return getFavorites(endpoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getTopAds,
    TResult? Function(String endpoint)? getFavorites,
    TResult? Function()? getMoreTopAds,
    TResult? Function(int index, int id)? changeIsWish,
    TResult? Function(int id, bool adding)? deleteFavoriteItem,
  }) {
    return getFavorites?.call(endpoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTopAds,
    TResult Function(String endpoint)? getFavorites,
    TResult Function()? getMoreTopAds,
    TResult Function(int index, int id)? changeIsWish,
    TResult Function(int id, bool adding)? deleteFavoriteItem,
    required TResult orElse(),
  }) {
    if (getFavorites != null) {
      return getFavorites(endpoint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTopAds value) getTopAds,
    required TResult Function(_GetFavorites value) getFavorites,
    required TResult Function(_GetMoreTopAds value) getMoreTopAds,
    required TResult Function(_ChangeIsWish value) changeIsWish,
    required TResult Function(_DeleteFavoriteItem value) deleteFavoriteItem,
  }) {
    return getFavorites(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTopAds value)? getTopAds,
    TResult? Function(_GetFavorites value)? getFavorites,
    TResult? Function(_GetMoreTopAds value)? getMoreTopAds,
    TResult? Function(_ChangeIsWish value)? changeIsWish,
    TResult? Function(_DeleteFavoriteItem value)? deleteFavoriteItem,
  }) {
    return getFavorites?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTopAds value)? getTopAds,
    TResult Function(_GetFavorites value)? getFavorites,
    TResult Function(_GetMoreTopAds value)? getMoreTopAds,
    TResult Function(_ChangeIsWish value)? changeIsWish,
    TResult Function(_DeleteFavoriteItem value)? deleteFavoriteItem,
    required TResult orElse(),
  }) {
    if (getFavorites != null) {
      return getFavorites(this);
    }
    return orElse();
  }
}

abstract class _GetFavorites implements TopAdEvent {
  factory _GetFavorites({required final String endpoint}) = _$_GetFavorites;

  String get endpoint;
  @JsonKey(ignore: true)
  _$$_GetFavoritesCopyWith<_$_GetFavorites> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMoreTopAdsCopyWith<$Res> {
  factory _$$_GetMoreTopAdsCopyWith(
          _$_GetMoreTopAds value, $Res Function(_$_GetMoreTopAds) then) =
      __$$_GetMoreTopAdsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMoreTopAdsCopyWithImpl<$Res>
    extends _$TopAdEventCopyWithImpl<$Res, _$_GetMoreTopAds>
    implements _$$_GetMoreTopAdsCopyWith<$Res> {
  __$$_GetMoreTopAdsCopyWithImpl(
      _$_GetMoreTopAds _value, $Res Function(_$_GetMoreTopAds) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetMoreTopAds implements _GetMoreTopAds {
  _$_GetMoreTopAds();

  @override
  String toString() {
    return 'TopAdEvent.getMoreTopAds()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMoreTopAds);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTopAds,
    required TResult Function(String endpoint) getFavorites,
    required TResult Function() getMoreTopAds,
    required TResult Function(int index, int id) changeIsWish,
    required TResult Function(int id, bool adding) deleteFavoriteItem,
  }) {
    return getMoreTopAds();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getTopAds,
    TResult? Function(String endpoint)? getFavorites,
    TResult? Function()? getMoreTopAds,
    TResult? Function(int index, int id)? changeIsWish,
    TResult? Function(int id, bool adding)? deleteFavoriteItem,
  }) {
    return getMoreTopAds?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTopAds,
    TResult Function(String endpoint)? getFavorites,
    TResult Function()? getMoreTopAds,
    TResult Function(int index, int id)? changeIsWish,
    TResult Function(int id, bool adding)? deleteFavoriteItem,
    required TResult orElse(),
  }) {
    if (getMoreTopAds != null) {
      return getMoreTopAds();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTopAds value) getTopAds,
    required TResult Function(_GetFavorites value) getFavorites,
    required TResult Function(_GetMoreTopAds value) getMoreTopAds,
    required TResult Function(_ChangeIsWish value) changeIsWish,
    required TResult Function(_DeleteFavoriteItem value) deleteFavoriteItem,
  }) {
    return getMoreTopAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTopAds value)? getTopAds,
    TResult? Function(_GetFavorites value)? getFavorites,
    TResult? Function(_GetMoreTopAds value)? getMoreTopAds,
    TResult? Function(_ChangeIsWish value)? changeIsWish,
    TResult? Function(_DeleteFavoriteItem value)? deleteFavoriteItem,
  }) {
    return getMoreTopAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTopAds value)? getTopAds,
    TResult Function(_GetFavorites value)? getFavorites,
    TResult Function(_GetMoreTopAds value)? getMoreTopAds,
    TResult Function(_ChangeIsWish value)? changeIsWish,
    TResult Function(_DeleteFavoriteItem value)? deleteFavoriteItem,
    required TResult orElse(),
  }) {
    if (getMoreTopAds != null) {
      return getMoreTopAds(this);
    }
    return orElse();
  }
}

abstract class _GetMoreTopAds implements TopAdEvent {
  factory _GetMoreTopAds() = _$_GetMoreTopAds;
}

/// @nodoc
abstract class _$$_ChangeIsWishCopyWith<$Res> {
  factory _$$_ChangeIsWishCopyWith(
          _$_ChangeIsWish value, $Res Function(_$_ChangeIsWish) then) =
      __$$_ChangeIsWishCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, int id});
}

/// @nodoc
class __$$_ChangeIsWishCopyWithImpl<$Res>
    extends _$TopAdEventCopyWithImpl<$Res, _$_ChangeIsWish>
    implements _$$_ChangeIsWishCopyWith<$Res> {
  __$$_ChangeIsWishCopyWithImpl(
      _$_ChangeIsWish _value, $Res Function(_$_ChangeIsWish) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? id = null,
  }) {
    return _then(_$_ChangeIsWish(
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

class _$_ChangeIsWish implements _ChangeIsWish {
  _$_ChangeIsWish({required this.index, required this.id});

  @override
  final int index;
  @override
  final int id;

  @override
  String toString() {
    return 'TopAdEvent.changeIsWish(index: $index, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeIsWish &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeIsWishCopyWith<_$_ChangeIsWish> get copyWith =>
      __$$_ChangeIsWishCopyWithImpl<_$_ChangeIsWish>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTopAds,
    required TResult Function(String endpoint) getFavorites,
    required TResult Function() getMoreTopAds,
    required TResult Function(int index, int id) changeIsWish,
    required TResult Function(int id, bool adding) deleteFavoriteItem,
  }) {
    return changeIsWish(index, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getTopAds,
    TResult? Function(String endpoint)? getFavorites,
    TResult? Function()? getMoreTopAds,
    TResult? Function(int index, int id)? changeIsWish,
    TResult? Function(int id, bool adding)? deleteFavoriteItem,
  }) {
    return changeIsWish?.call(index, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTopAds,
    TResult Function(String endpoint)? getFavorites,
    TResult Function()? getMoreTopAds,
    TResult Function(int index, int id)? changeIsWish,
    TResult Function(int id, bool adding)? deleteFavoriteItem,
    required TResult orElse(),
  }) {
    if (changeIsWish != null) {
      return changeIsWish(index, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTopAds value) getTopAds,
    required TResult Function(_GetFavorites value) getFavorites,
    required TResult Function(_GetMoreTopAds value) getMoreTopAds,
    required TResult Function(_ChangeIsWish value) changeIsWish,
    required TResult Function(_DeleteFavoriteItem value) deleteFavoriteItem,
  }) {
    return changeIsWish(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTopAds value)? getTopAds,
    TResult? Function(_GetFavorites value)? getFavorites,
    TResult? Function(_GetMoreTopAds value)? getMoreTopAds,
    TResult? Function(_ChangeIsWish value)? changeIsWish,
    TResult? Function(_DeleteFavoriteItem value)? deleteFavoriteItem,
  }) {
    return changeIsWish?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTopAds value)? getTopAds,
    TResult Function(_GetFavorites value)? getFavorites,
    TResult Function(_GetMoreTopAds value)? getMoreTopAds,
    TResult Function(_ChangeIsWish value)? changeIsWish,
    TResult Function(_DeleteFavoriteItem value)? deleteFavoriteItem,
    required TResult orElse(),
  }) {
    if (changeIsWish != null) {
      return changeIsWish(this);
    }
    return orElse();
  }
}

abstract class _ChangeIsWish implements TopAdEvent {
  factory _ChangeIsWish({required final int index, required final int id}) =
      _$_ChangeIsWish;

  int get index;
  int get id;
  @JsonKey(ignore: true)
  _$$_ChangeIsWishCopyWith<_$_ChangeIsWish> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteFavoriteItemCopyWith<$Res> {
  factory _$$_DeleteFavoriteItemCopyWith(_$_DeleteFavoriteItem value,
          $Res Function(_$_DeleteFavoriteItem) then) =
      __$$_DeleteFavoriteItemCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, bool adding});
}

/// @nodoc
class __$$_DeleteFavoriteItemCopyWithImpl<$Res>
    extends _$TopAdEventCopyWithImpl<$Res, _$_DeleteFavoriteItem>
    implements _$$_DeleteFavoriteItemCopyWith<$Res> {
  __$$_DeleteFavoriteItemCopyWithImpl(
      _$_DeleteFavoriteItem _value, $Res Function(_$_DeleteFavoriteItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? adding = null,
  }) {
    return _then(_$_DeleteFavoriteItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      adding: null == adding
          ? _value.adding
          : adding // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DeleteFavoriteItem implements _DeleteFavoriteItem {
  _$_DeleteFavoriteItem({required this.id, required this.adding});

  @override
  final int id;
  @override
  final bool adding;

  @override
  String toString() {
    return 'TopAdEvent.deleteFavoriteItem(id: $id, adding: $adding)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteFavoriteItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.adding, adding) || other.adding == adding));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, adding);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteFavoriteItemCopyWith<_$_DeleteFavoriteItem> get copyWith =>
      __$$_DeleteFavoriteItemCopyWithImpl<_$_DeleteFavoriteItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTopAds,
    required TResult Function(String endpoint) getFavorites,
    required TResult Function() getMoreTopAds,
    required TResult Function(int index, int id) changeIsWish,
    required TResult Function(int id, bool adding) deleteFavoriteItem,
  }) {
    return deleteFavoriteItem(id, adding);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getTopAds,
    TResult? Function(String endpoint)? getFavorites,
    TResult? Function()? getMoreTopAds,
    TResult? Function(int index, int id)? changeIsWish,
    TResult? Function(int id, bool adding)? deleteFavoriteItem,
  }) {
    return deleteFavoriteItem?.call(id, adding);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTopAds,
    TResult Function(String endpoint)? getFavorites,
    TResult Function()? getMoreTopAds,
    TResult Function(int index, int id)? changeIsWish,
    TResult Function(int id, bool adding)? deleteFavoriteItem,
    required TResult orElse(),
  }) {
    if (deleteFavoriteItem != null) {
      return deleteFavoriteItem(id, adding);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTopAds value) getTopAds,
    required TResult Function(_GetFavorites value) getFavorites,
    required TResult Function(_GetMoreTopAds value) getMoreTopAds,
    required TResult Function(_ChangeIsWish value) changeIsWish,
    required TResult Function(_DeleteFavoriteItem value) deleteFavoriteItem,
  }) {
    return deleteFavoriteItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTopAds value)? getTopAds,
    TResult? Function(_GetFavorites value)? getFavorites,
    TResult? Function(_GetMoreTopAds value)? getMoreTopAds,
    TResult? Function(_ChangeIsWish value)? changeIsWish,
    TResult? Function(_DeleteFavoriteItem value)? deleteFavoriteItem,
  }) {
    return deleteFavoriteItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTopAds value)? getTopAds,
    TResult Function(_GetFavorites value)? getFavorites,
    TResult Function(_GetMoreTopAds value)? getMoreTopAds,
    TResult Function(_ChangeIsWish value)? changeIsWish,
    TResult Function(_DeleteFavoriteItem value)? deleteFavoriteItem,
    required TResult orElse(),
  }) {
    if (deleteFavoriteItem != null) {
      return deleteFavoriteItem(this);
    }
    return orElse();
  }
}

abstract class _DeleteFavoriteItem implements TopAdEvent {
  factory _DeleteFavoriteItem(
      {required final int id,
      required final bool adding}) = _$_DeleteFavoriteItem;

  int get id;
  bool get adding;
  @JsonKey(ignore: true)
  _$$_DeleteFavoriteItemCopyWith<_$_DeleteFavoriteItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TopAdState {
  FormzStatus get status => throw _privateConstructorUsedError;
  FormzStatus get favoritesStatus => throw _privateConstructorUsedError;
  List<AdModel> get topAds => throw _privateConstructorUsedError;
  List<AutoEntity> get favorites => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopAdStateCopyWith<TopAdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopAdStateCopyWith<$Res> {
  factory $TopAdStateCopyWith(
          TopAdState value, $Res Function(TopAdState) then) =
      _$TopAdStateCopyWithImpl<$Res, TopAdState>;
  @useResult
  $Res call(
      {FormzStatus status,
      FormzStatus favoritesStatus,
      List<AdModel> topAds,
      List<AutoEntity> favorites,
      String? next,
      int count});
}

/// @nodoc
class _$TopAdStateCopyWithImpl<$Res, $Val extends TopAdState>
    implements $TopAdStateCopyWith<$Res> {
  _$TopAdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? favoritesStatus = null,
    Object? topAds = null,
    Object? favorites = null,
    Object? next = freezed,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      favoritesStatus: null == favoritesStatus
          ? _value.favoritesStatus
          : favoritesStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      topAds: null == topAds
          ? _value.topAds
          : topAds // ignore: cast_nullable_to_non_nullable
              as List<AdModel>,
      favorites: null == favorites
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<AutoEntity>,
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
abstract class _$$_TopAdStateCopyWith<$Res>
    implements $TopAdStateCopyWith<$Res> {
  factory _$$_TopAdStateCopyWith(
          _$_TopAdState value, $Res Function(_$_TopAdState) then) =
      __$$_TopAdStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus status,
      FormzStatus favoritesStatus,
      List<AdModel> topAds,
      List<AutoEntity> favorites,
      String? next,
      int count});
}

/// @nodoc
class __$$_TopAdStateCopyWithImpl<$Res>
    extends _$TopAdStateCopyWithImpl<$Res, _$_TopAdState>
    implements _$$_TopAdStateCopyWith<$Res> {
  __$$_TopAdStateCopyWithImpl(
      _$_TopAdState _value, $Res Function(_$_TopAdState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? favoritesStatus = null,
    Object? topAds = null,
    Object? favorites = null,
    Object? next = freezed,
    Object? count = null,
  }) {
    return _then(_$_TopAdState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      favoritesStatus: null == favoritesStatus
          ? _value.favoritesStatus
          : favoritesStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      topAds: null == topAds
          ? _value._topAds
          : topAds // ignore: cast_nullable_to_non_nullable
              as List<AdModel>,
      favorites: null == favorites
          ? _value._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<AutoEntity>,
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

class _$_TopAdState implements _TopAdState {
  _$_TopAdState(
      {this.status = FormzStatus.pure,
      this.favoritesStatus = FormzStatus.pure,
      final List<AdModel> topAds = const [],
      final List<AutoEntity> favorites = const [],
      this.next,
      this.count = 0})
      : _topAds = topAds,
        _favorites = favorites;

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final FormzStatus favoritesStatus;
  final List<AdModel> _topAds;
  @override
  @JsonKey()
  List<AdModel> get topAds {
    if (_topAds is EqualUnmodifiableListView) return _topAds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topAds);
  }

  final List<AutoEntity> _favorites;
  @override
  @JsonKey()
  List<AutoEntity> get favorites {
    if (_favorites is EqualUnmodifiableListView) return _favorites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorites);
  }

  @override
  final String? next;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'TopAdState(status: $status, favoritesStatus: $favoritesStatus, topAds: $topAds, favorites: $favorites, next: $next, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopAdState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.favoritesStatus, favoritesStatus) ||
                other.favoritesStatus == favoritesStatus) &&
            const DeepCollectionEquality().equals(other._topAds, _topAds) &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      favoritesStatus,
      const DeepCollectionEquality().hash(_topAds),
      const DeepCollectionEquality().hash(_favorites),
      next,
      count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopAdStateCopyWith<_$_TopAdState> get copyWith =>
      __$$_TopAdStateCopyWithImpl<_$_TopAdState>(this, _$identity);
}

abstract class _TopAdState implements TopAdState {
  factory _TopAdState(
      {final FormzStatus status,
      final FormzStatus favoritesStatus,
      final List<AdModel> topAds,
      final List<AutoEntity> favorites,
      final String? next,
      final int count}) = _$_TopAdState;

  @override
  FormzStatus get status;
  @override
  FormzStatus get favoritesStatus;
  @override
  List<AdModel> get topAds;
  @override
  List<AutoEntity> get favorites;
  @override
  String? get next;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_TopAdStateCopyWith<_$_TopAdState> get copyWith =>
      throw _privateConstructorUsedError;
}
