// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_car_model_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetCarModelEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int getId) getCarModel,
    required TResult Function(int id) getMakeId,
    required TResult Function(String naem) getSerched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int getId)? getCarModel,
    TResult? Function(int id)? getMakeId,
    TResult? Function(String naem)? getSerched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int getId)? getCarModel,
    TResult Function(int id)? getMakeId,
    TResult Function(String naem)? getSerched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCarModel value) getCarModel,
    required TResult Function(_GetMakeId value) getMakeId,
    required TResult Function(_GetSerched value) getSerched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCarModel value)? getCarModel,
    TResult? Function(_GetMakeId value)? getMakeId,
    TResult? Function(_GetSerched value)? getSerched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCarModel value)? getCarModel,
    TResult Function(_GetMakeId value)? getMakeId,
    TResult Function(_GetSerched value)? getSerched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCarModelEventCopyWith<$Res> {
  factory $GetCarModelEventCopyWith(
          GetCarModelEvent value, $Res Function(GetCarModelEvent) then) =
      _$GetCarModelEventCopyWithImpl<$Res, GetCarModelEvent>;
}

/// @nodoc
class _$GetCarModelEventCopyWithImpl<$Res, $Val extends GetCarModelEvent>
    implements $GetCarModelEventCopyWith<$Res> {
  _$GetCarModelEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetCarModelCopyWith<$Res> {
  factory _$$_GetCarModelCopyWith(
          _$_GetCarModel value, $Res Function(_$_GetCarModel) then) =
      __$$_GetCarModelCopyWithImpl<$Res>;
  @useResult
  $Res call({int getId});
}

/// @nodoc
class __$$_GetCarModelCopyWithImpl<$Res>
    extends _$GetCarModelEventCopyWithImpl<$Res, _$_GetCarModel>
    implements _$$_GetCarModelCopyWith<$Res> {
  __$$_GetCarModelCopyWithImpl(
      _$_GetCarModel _value, $Res Function(_$_GetCarModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getId = null,
  }) {
    return _then(_$_GetCarModel(
      null == getId
          ? _value.getId
          : getId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetCarModel implements _GetCarModel {
  _$_GetCarModel(this.getId);

  @override
  final int getId;

  @override
  String toString() {
    return 'GetCarModelEvent.getCarModel(getId: $getId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetCarModel &&
            (identical(other.getId, getId) || other.getId == getId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetCarModelCopyWith<_$_GetCarModel> get copyWith =>
      __$$_GetCarModelCopyWithImpl<_$_GetCarModel>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int getId) getCarModel,
    required TResult Function(int id) getMakeId,
    required TResult Function(String naem) getSerched,
  }) {
    return getCarModel(getId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int getId)? getCarModel,
    TResult? Function(int id)? getMakeId,
    TResult? Function(String naem)? getSerched,
  }) {
    return getCarModel?.call(getId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int getId)? getCarModel,
    TResult Function(int id)? getMakeId,
    TResult Function(String naem)? getSerched,
    required TResult orElse(),
  }) {
    if (getCarModel != null) {
      return getCarModel(getId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCarModel value) getCarModel,
    required TResult Function(_GetMakeId value) getMakeId,
    required TResult Function(_GetSerched value) getSerched,
  }) {
    return getCarModel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCarModel value)? getCarModel,
    TResult? Function(_GetMakeId value)? getMakeId,
    TResult? Function(_GetSerched value)? getSerched,
  }) {
    return getCarModel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCarModel value)? getCarModel,
    TResult Function(_GetMakeId value)? getMakeId,
    TResult Function(_GetSerched value)? getSerched,
    required TResult orElse(),
  }) {
    if (getCarModel != null) {
      return getCarModel(this);
    }
    return orElse();
  }
}

abstract class _GetCarModel implements GetCarModelEvent {
  factory _GetCarModel(final int getId) = _$_GetCarModel;

  int get getId;
  @JsonKey(ignore: true)
  _$$_GetCarModelCopyWith<_$_GetCarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMakeIdCopyWith<$Res> {
  factory _$$_GetMakeIdCopyWith(
          _$_GetMakeId value, $Res Function(_$_GetMakeId) then) =
      __$$_GetMakeIdCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_GetMakeIdCopyWithImpl<$Res>
    extends _$GetCarModelEventCopyWithImpl<$Res, _$_GetMakeId>
    implements _$$_GetMakeIdCopyWith<$Res> {
  __$$_GetMakeIdCopyWithImpl(
      _$_GetMakeId _value, $Res Function(_$_GetMakeId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_GetMakeId(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetMakeId implements _GetMakeId {
  _$_GetMakeId(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'GetCarModelEvent.getMakeId(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetMakeId &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetMakeIdCopyWith<_$_GetMakeId> get copyWith =>
      __$$_GetMakeIdCopyWithImpl<_$_GetMakeId>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int getId) getCarModel,
    required TResult Function(int id) getMakeId,
    required TResult Function(String naem) getSerched,
  }) {
    return getMakeId(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int getId)? getCarModel,
    TResult? Function(int id)? getMakeId,
    TResult? Function(String naem)? getSerched,
  }) {
    return getMakeId?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int getId)? getCarModel,
    TResult Function(int id)? getMakeId,
    TResult Function(String naem)? getSerched,
    required TResult orElse(),
  }) {
    if (getMakeId != null) {
      return getMakeId(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCarModel value) getCarModel,
    required TResult Function(_GetMakeId value) getMakeId,
    required TResult Function(_GetSerched value) getSerched,
  }) {
    return getMakeId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCarModel value)? getCarModel,
    TResult? Function(_GetMakeId value)? getMakeId,
    TResult? Function(_GetSerched value)? getSerched,
  }) {
    return getMakeId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCarModel value)? getCarModel,
    TResult Function(_GetMakeId value)? getMakeId,
    TResult Function(_GetSerched value)? getSerched,
    required TResult orElse(),
  }) {
    if (getMakeId != null) {
      return getMakeId(this);
    }
    return orElse();
  }
}

abstract class _GetMakeId implements GetCarModelEvent {
  factory _GetMakeId(final int id) = _$_GetMakeId;

  int get id;
  @JsonKey(ignore: true)
  _$$_GetMakeIdCopyWith<_$_GetMakeId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetSerchedCopyWith<$Res> {
  factory _$$_GetSerchedCopyWith(
          _$_GetSerched value, $Res Function(_$_GetSerched) then) =
      __$$_GetSerchedCopyWithImpl<$Res>;
  @useResult
  $Res call({String naem});
}

/// @nodoc
class __$$_GetSerchedCopyWithImpl<$Res>
    extends _$GetCarModelEventCopyWithImpl<$Res, _$_GetSerched>
    implements _$$_GetSerchedCopyWith<$Res> {
  __$$_GetSerchedCopyWithImpl(
      _$_GetSerched _value, $Res Function(_$_GetSerched) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? naem = null,
  }) {
    return _then(_$_GetSerched(
      null == naem
          ? _value.naem
          : naem // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetSerched implements _GetSerched {
  _$_GetSerched(this.naem);

  @override
  final String naem;

  @override
  String toString() {
    return 'GetCarModelEvent.getSerched(naem: $naem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetSerched &&
            (identical(other.naem, naem) || other.naem == naem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, naem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetSerchedCopyWith<_$_GetSerched> get copyWith =>
      __$$_GetSerchedCopyWithImpl<_$_GetSerched>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int getId) getCarModel,
    required TResult Function(int id) getMakeId,
    required TResult Function(String naem) getSerched,
  }) {
    return getSerched(naem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int getId)? getCarModel,
    TResult? Function(int id)? getMakeId,
    TResult? Function(String naem)? getSerched,
  }) {
    return getSerched?.call(naem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int getId)? getCarModel,
    TResult Function(int id)? getMakeId,
    TResult Function(String naem)? getSerched,
    required TResult orElse(),
  }) {
    if (getSerched != null) {
      return getSerched(naem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCarModel value) getCarModel,
    required TResult Function(_GetMakeId value) getMakeId,
    required TResult Function(_GetSerched value) getSerched,
  }) {
    return getSerched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCarModel value)? getCarModel,
    TResult? Function(_GetMakeId value)? getMakeId,
    TResult? Function(_GetSerched value)? getSerched,
  }) {
    return getSerched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCarModel value)? getCarModel,
    TResult Function(_GetMakeId value)? getMakeId,
    TResult Function(_GetSerched value)? getSerched,
    required TResult orElse(),
  }) {
    if (getSerched != null) {
      return getSerched(this);
    }
    return orElse();
  }
}

abstract class _GetSerched implements GetCarModelEvent {
  factory _GetSerched(final String naem) = _$_GetSerched;

  String get naem;
  @JsonKey(ignore: true)
  _$$_GetSerchedCopyWith<_$_GetSerched> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetCarModelState {
  FormzStatus get status => throw _privateConstructorUsedError;
  GetMakeEntity get model => throw _privateConstructorUsedError;
  dynamic get next => throw _privateConstructorUsedError;
  dynamic get search => throw _privateConstructorUsedError;
  int get getId => throw _privateConstructorUsedError;
  dynamic get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetCarModelStateCopyWith<GetCarModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCarModelStateCopyWith<$Res> {
  factory $GetCarModelStateCopyWith(
          GetCarModelState value, $Res Function(GetCarModelState) then) =
      _$GetCarModelStateCopyWithImpl<$Res, GetCarModelState>;
  @useResult
  $Res call(
      {FormzStatus status,
      GetMakeEntity model,
      dynamic next,
      dynamic search,
      int getId,
      dynamic count});
}

/// @nodoc
class _$GetCarModelStateCopyWithImpl<$Res, $Val extends GetCarModelState>
    implements $GetCarModelStateCopyWith<$Res> {
  _$GetCarModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? model = null,
    Object? next = freezed,
    Object? search = freezed,
    Object? getId = null,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as GetMakeEntity,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as dynamic,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as dynamic,
      getId: null == getId
          ? _value.getId
          : getId // ignore: cast_nullable_to_non_nullable
              as int,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetCarModelStateCopyWith<$Res>
    implements $GetCarModelStateCopyWith<$Res> {
  factory _$$_GetCarModelStateCopyWith(
          _$_GetCarModelState value, $Res Function(_$_GetCarModelState) then) =
      __$$_GetCarModelStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus status,
      GetMakeEntity model,
      dynamic next,
      dynamic search,
      int getId,
      dynamic count});
}

/// @nodoc
class __$$_GetCarModelStateCopyWithImpl<$Res>
    extends _$GetCarModelStateCopyWithImpl<$Res, _$_GetCarModelState>
    implements _$$_GetCarModelStateCopyWith<$Res> {
  __$$_GetCarModelStateCopyWithImpl(
      _$_GetCarModelState _value, $Res Function(_$_GetCarModelState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? model = null,
    Object? next = freezed,
    Object? search = freezed,
    Object? getId = null,
    Object? count = freezed,
  }) {
    return _then(_$_GetCarModelState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as GetMakeEntity,
      next: freezed == next ? _value.next! : next,
      search: freezed == search ? _value.search! : search,
      getId: null == getId
          ? _value.getId
          : getId // ignore: cast_nullable_to_non_nullable
              as int,
      count: freezed == count ? _value.count! : count,
    ));
  }
}

/// @nodoc

class _$_GetCarModelState implements _GetCarModelState {
  _$_GetCarModelState(
      {this.status = FormzStatus.pure,
      this.model = const GetMakeEntity(),
      this.next = '',
      this.search = '',
      this.getId = 0,
      this.count = 0});

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final GetMakeEntity model;
  @override
  @JsonKey()
  final dynamic next;
  @override
  @JsonKey()
  final dynamic search;
  @override
  @JsonKey()
  final int getId;
  @override
  @JsonKey()
  final dynamic count;

  @override
  String toString() {
    return 'GetCarModelState(status: $status, model: $model, next: $next, search: $search, getId: $getId, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetCarModelState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.search, search) &&
            (identical(other.getId, getId) || other.getId == getId) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      model,
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(search),
      getId,
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetCarModelStateCopyWith<_$_GetCarModelState> get copyWith =>
      __$$_GetCarModelStateCopyWithImpl<_$_GetCarModelState>(this, _$identity);
}

abstract class _GetCarModelState implements GetCarModelState {
  factory _GetCarModelState(
      {final FormzStatus status,
      final GetMakeEntity model,
      final dynamic next,
      final dynamic search,
      final int getId,
      final dynamic count}) = _$_GetCarModelState;

  @override
  FormzStatus get status;
  @override
  GetMakeEntity get model;
  @override
  dynamic get next;
  @override
  dynamic get search;
  @override
  int get getId;
  @override
  dynamic get count;
  @override
  @JsonKey(ignore: true)
  _$$_GetCarModelStateCopyWith<_$_GetCarModelState> get copyWith =>
      throw _privateConstructorUsedError;
}
