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
  CarModelParams? get getModel => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CarModelParams? getModel) getCarModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CarModelParams? getModel)? getCarModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CarModelParams? getModel)? getCarModel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCarModel value) getCarModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCarModel value)? getCarModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCarModel value)? getCarModel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetCarModelEventCopyWith<GetCarModelEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCarModelEventCopyWith<$Res> {
  factory $GetCarModelEventCopyWith(
          GetCarModelEvent value, $Res Function(GetCarModelEvent) then) =
      _$GetCarModelEventCopyWithImpl<$Res, GetCarModelEvent>;
  @useResult
  $Res call({CarModelParams? getModel});
}

/// @nodoc
class _$GetCarModelEventCopyWithImpl<$Res, $Val extends GetCarModelEvent>
    implements $GetCarModelEventCopyWith<$Res> {
  _$GetCarModelEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getModel = freezed,
  }) {
    return _then(_value.copyWith(
      getModel: freezed == getModel
          ? _value.getModel
          : getModel // ignore: cast_nullable_to_non_nullable
              as CarModelParams?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetCarModelCopyWith<$Res>
    implements $GetCarModelEventCopyWith<$Res> {
  factory _$$_GetCarModelCopyWith(
          _$_GetCarModel value, $Res Function(_$_GetCarModel) then) =
      __$$_GetCarModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CarModelParams? getModel});
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
    Object? getModel = freezed,
  }) {
    return _then(_$_GetCarModel(
      freezed == getModel
          ? _value.getModel
          : getModel // ignore: cast_nullable_to_non_nullable
              as CarModelParams?,
    ));
  }
}

/// @nodoc

class _$_GetCarModel implements _GetCarModel {
  const _$_GetCarModel(this.getModel);

  @override
  final CarModelParams? getModel;

  @override
  String toString() {
    return 'GetCarModelEvent.getCarModel(getModel: $getModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetCarModel &&
            (identical(other.getModel, getModel) ||
                other.getModel == getModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetCarModelCopyWith<_$_GetCarModel> get copyWith =>
      __$$_GetCarModelCopyWithImpl<_$_GetCarModel>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CarModelParams? getModel) getCarModel,
  }) {
    return getCarModel(getModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CarModelParams? getModel)? getCarModel,
  }) {
    return getCarModel?.call(getModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CarModelParams? getModel)? getCarModel,
    required TResult orElse(),
  }) {
    if (getCarModel != null) {
      return getCarModel(getModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCarModel value) getCarModel,
  }) {
    return getCarModel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCarModel value)? getCarModel,
  }) {
    return getCarModel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCarModel value)? getCarModel,
    required TResult orElse(),
  }) {
    if (getCarModel != null) {
      return getCarModel(this);
    }
    return orElse();
  }
}

abstract class _GetCarModel implements GetCarModelEvent {
  const factory _GetCarModel(final CarModelParams? getModel) = _$_GetCarModel;

  @override
  CarModelParams? get getModel;
  @override
  @JsonKey(ignore: true)
  _$$_GetCarModelCopyWith<_$_GetCarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetCarModelState {
  FormzStatus get status => throw _privateConstructorUsedError;
  GetMakeEntity get model => throw _privateConstructorUsedError;
  dynamic get next => throw _privateConstructorUsedError;
  CarModelParams get getModel => throw _privateConstructorUsedError;
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
      CarModelParams getModel,
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
    Object? getModel = null,
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
      getModel: null == getModel
          ? _value.getModel
          : getModel // ignore: cast_nullable_to_non_nullable
              as CarModelParams,
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
      CarModelParams getModel,
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
    Object? getModel = null,
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
      getModel: null == getModel
          ? _value.getModel
          : getModel // ignore: cast_nullable_to_non_nullable
              as CarModelParams,
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
      this.getModel = const CarModelParams(),
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
  final CarModelParams getModel;
  @override
  @JsonKey()
  final dynamic count;

  @override
  String toString() {
    return 'GetCarModelState(status: $status, model: $model, next: $next, getModel: $getModel, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetCarModelState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            (identical(other.getModel, getModel) ||
                other.getModel == getModel) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      model,
      const DeepCollectionEquality().hash(next),
      getModel,
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
      final CarModelParams getModel,
      final dynamic count}) = _$_GetCarModelState;

  @override
  FormzStatus get status;
  @override
  GetMakeEntity get model;
  @override
  dynamic get next;
  @override
  CarModelParams get getModel;
  @override
  dynamic get count;
  @override
  @JsonKey(ignore: true)
  _$$_GetCarModelStateCopyWith<_$_GetCarModelState> get copyWith =>
      throw _privateConstructorUsedError;
}
