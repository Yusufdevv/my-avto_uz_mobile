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
    required TResult Function(int getId, String search) getCarModel,
    required TResult Function(int id) getMakeId,
    required TResult Function(MakeEntity model, int selectedId)
        selectedModelItem,
    required TResult Function() confirmModel,
    required TResult Function() revertModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int getId, String search)? getCarModel,
    TResult? Function(int id)? getMakeId,
    TResult? Function(MakeEntity model, int selectedId)? selectedModelItem,
    TResult? Function()? confirmModel,
    TResult? Function()? revertModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int getId, String search)? getCarModel,
    TResult Function(int id)? getMakeId,
    TResult Function(MakeEntity model, int selectedId)? selectedModelItem,
    TResult Function()? confirmModel,
    TResult Function()? revertModel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCarModel value) getCarModel,
    required TResult Function(_GetMakeId value) getMakeId,
    required TResult Function(_SelectedModelItem value) selectedModelItem,
    required TResult Function(_ConfirmModel value) confirmModel,
    required TResult Function(_RevertModel value) revertModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCarModel value)? getCarModel,
    TResult? Function(_GetMakeId value)? getMakeId,
    TResult? Function(_SelectedModelItem value)? selectedModelItem,
    TResult? Function(_ConfirmModel value)? confirmModel,
    TResult? Function(_RevertModel value)? revertModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCarModel value)? getCarModel,
    TResult Function(_GetMakeId value)? getMakeId,
    TResult Function(_SelectedModelItem value)? selectedModelItem,
    TResult Function(_ConfirmModel value)? confirmModel,
    TResult Function(_RevertModel value)? revertModel,
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
  $Res call({int getId, String search});
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
    Object? search = null,
  }) {
    return _then(_$_GetCarModel(
      getId: null == getId
          ? _value.getId
          : getId // ignore: cast_nullable_to_non_nullable
              as int,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetCarModel implements _GetCarModel {
  _$_GetCarModel({required this.getId, required this.search});

  @override
  final int getId;
  @override
  final String search;

  @override
  String toString() {
    return 'GetCarModelEvent.getCarModel(getId: $getId, search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetCarModel &&
            (identical(other.getId, getId) || other.getId == getId) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getId, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetCarModelCopyWith<_$_GetCarModel> get copyWith =>
      __$$_GetCarModelCopyWithImpl<_$_GetCarModel>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int getId, String search) getCarModel,
    required TResult Function(int id) getMakeId,
    required TResult Function(MakeEntity model, int selectedId)
        selectedModelItem,
    required TResult Function() confirmModel,
    required TResult Function() revertModel,
  }) {
    return getCarModel(getId, search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int getId, String search)? getCarModel,
    TResult? Function(int id)? getMakeId,
    TResult? Function(MakeEntity model, int selectedId)? selectedModelItem,
    TResult? Function()? confirmModel,
    TResult? Function()? revertModel,
  }) {
    return getCarModel?.call(getId, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int getId, String search)? getCarModel,
    TResult Function(int id)? getMakeId,
    TResult Function(MakeEntity model, int selectedId)? selectedModelItem,
    TResult Function()? confirmModel,
    TResult Function()? revertModel,
    required TResult orElse(),
  }) {
    if (getCarModel != null) {
      return getCarModel(getId, search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCarModel value) getCarModel,
    required TResult Function(_GetMakeId value) getMakeId,
    required TResult Function(_SelectedModelItem value) selectedModelItem,
    required TResult Function(_ConfirmModel value) confirmModel,
    required TResult Function(_RevertModel value) revertModel,
  }) {
    return getCarModel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCarModel value)? getCarModel,
    TResult? Function(_GetMakeId value)? getMakeId,
    TResult? Function(_SelectedModelItem value)? selectedModelItem,
    TResult? Function(_ConfirmModel value)? confirmModel,
    TResult? Function(_RevertModel value)? revertModel,
  }) {
    return getCarModel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCarModel value)? getCarModel,
    TResult Function(_GetMakeId value)? getMakeId,
    TResult Function(_SelectedModelItem value)? selectedModelItem,
    TResult Function(_ConfirmModel value)? confirmModel,
    TResult Function(_RevertModel value)? revertModel,
    required TResult orElse(),
  }) {
    if (getCarModel != null) {
      return getCarModel(this);
    }
    return orElse();
  }
}

abstract class _GetCarModel implements GetCarModelEvent {
  factory _GetCarModel(
      {required final int getId,
      required final String search}) = _$_GetCarModel;

  int get getId;
  String get search;
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
    required TResult Function(int getId, String search) getCarModel,
    required TResult Function(int id) getMakeId,
    required TResult Function(MakeEntity model, int selectedId)
        selectedModelItem,
    required TResult Function() confirmModel,
    required TResult Function() revertModel,
  }) {
    return getMakeId(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int getId, String search)? getCarModel,
    TResult? Function(int id)? getMakeId,
    TResult? Function(MakeEntity model, int selectedId)? selectedModelItem,
    TResult? Function()? confirmModel,
    TResult? Function()? revertModel,
  }) {
    return getMakeId?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int getId, String search)? getCarModel,
    TResult Function(int id)? getMakeId,
    TResult Function(MakeEntity model, int selectedId)? selectedModelItem,
    TResult Function()? confirmModel,
    TResult Function()? revertModel,
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
    required TResult Function(_SelectedModelItem value) selectedModelItem,
    required TResult Function(_ConfirmModel value) confirmModel,
    required TResult Function(_RevertModel value) revertModel,
  }) {
    return getMakeId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCarModel value)? getCarModel,
    TResult? Function(_GetMakeId value)? getMakeId,
    TResult? Function(_SelectedModelItem value)? selectedModelItem,
    TResult? Function(_ConfirmModel value)? confirmModel,
    TResult? Function(_RevertModel value)? revertModel,
  }) {
    return getMakeId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCarModel value)? getCarModel,
    TResult Function(_GetMakeId value)? getMakeId,
    TResult Function(_SelectedModelItem value)? selectedModelItem,
    TResult Function(_ConfirmModel value)? confirmModel,
    TResult Function(_RevertModel value)? revertModel,
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
abstract class _$$_SelectedModelItemCopyWith<$Res> {
  factory _$$_SelectedModelItemCopyWith(_$_SelectedModelItem value,
          $Res Function(_$_SelectedModelItem) then) =
      __$$_SelectedModelItemCopyWithImpl<$Res>;
  @useResult
  $Res call({MakeEntity model, int selectedId});
}

/// @nodoc
class __$$_SelectedModelItemCopyWithImpl<$Res>
    extends _$GetCarModelEventCopyWithImpl<$Res, _$_SelectedModelItem>
    implements _$$_SelectedModelItemCopyWith<$Res> {
  __$$_SelectedModelItemCopyWithImpl(
      _$_SelectedModelItem _value, $Res Function(_$_SelectedModelItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? selectedId = null,
  }) {
    return _then(_$_SelectedModelItem(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as MakeEntity,
      selectedId: null == selectedId
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SelectedModelItem implements _SelectedModelItem {
  _$_SelectedModelItem({required this.model, required this.selectedId});

  @override
  final MakeEntity model;
  @override
  final int selectedId;

  @override
  String toString() {
    return 'GetCarModelEvent.selectedModelItem(model: $model, selectedId: $selectedId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectedModelItem &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.selectedId, selectedId) ||
                other.selectedId == selectedId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model, selectedId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectedModelItemCopyWith<_$_SelectedModelItem> get copyWith =>
      __$$_SelectedModelItemCopyWithImpl<_$_SelectedModelItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int getId, String search) getCarModel,
    required TResult Function(int id) getMakeId,
    required TResult Function(MakeEntity model, int selectedId)
        selectedModelItem,
    required TResult Function() confirmModel,
    required TResult Function() revertModel,
  }) {
    return selectedModelItem(model, selectedId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int getId, String search)? getCarModel,
    TResult? Function(int id)? getMakeId,
    TResult? Function(MakeEntity model, int selectedId)? selectedModelItem,
    TResult? Function()? confirmModel,
    TResult? Function()? revertModel,
  }) {
    return selectedModelItem?.call(model, selectedId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int getId, String search)? getCarModel,
    TResult Function(int id)? getMakeId,
    TResult Function(MakeEntity model, int selectedId)? selectedModelItem,
    TResult Function()? confirmModel,
    TResult Function()? revertModel,
    required TResult orElse(),
  }) {
    if (selectedModelItem != null) {
      return selectedModelItem(model, selectedId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCarModel value) getCarModel,
    required TResult Function(_GetMakeId value) getMakeId,
    required TResult Function(_SelectedModelItem value) selectedModelItem,
    required TResult Function(_ConfirmModel value) confirmModel,
    required TResult Function(_RevertModel value) revertModel,
  }) {
    return selectedModelItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCarModel value)? getCarModel,
    TResult? Function(_GetMakeId value)? getMakeId,
    TResult? Function(_SelectedModelItem value)? selectedModelItem,
    TResult? Function(_ConfirmModel value)? confirmModel,
    TResult? Function(_RevertModel value)? revertModel,
  }) {
    return selectedModelItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCarModel value)? getCarModel,
    TResult Function(_GetMakeId value)? getMakeId,
    TResult Function(_SelectedModelItem value)? selectedModelItem,
    TResult Function(_ConfirmModel value)? confirmModel,
    TResult Function(_RevertModel value)? revertModel,
    required TResult orElse(),
  }) {
    if (selectedModelItem != null) {
      return selectedModelItem(this);
    }
    return orElse();
  }
}

abstract class _SelectedModelItem implements GetCarModelEvent {
  factory _SelectedModelItem(
      {required final MakeEntity model,
      required final int selectedId}) = _$_SelectedModelItem;

  MakeEntity get model;
  int get selectedId;
  @JsonKey(ignore: true)
  _$$_SelectedModelItemCopyWith<_$_SelectedModelItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConfirmModelCopyWith<$Res> {
  factory _$$_ConfirmModelCopyWith(
          _$_ConfirmModel value, $Res Function(_$_ConfirmModel) then) =
      __$$_ConfirmModelCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ConfirmModelCopyWithImpl<$Res>
    extends _$GetCarModelEventCopyWithImpl<$Res, _$_ConfirmModel>
    implements _$$_ConfirmModelCopyWith<$Res> {
  __$$_ConfirmModelCopyWithImpl(
      _$_ConfirmModel _value, $Res Function(_$_ConfirmModel) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ConfirmModel implements _ConfirmModel {
  _$_ConfirmModel();

  @override
  String toString() {
    return 'GetCarModelEvent.confirmModel()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ConfirmModel);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int getId, String search) getCarModel,
    required TResult Function(int id) getMakeId,
    required TResult Function(MakeEntity model, int selectedId)
        selectedModelItem,
    required TResult Function() confirmModel,
    required TResult Function() revertModel,
  }) {
    return confirmModel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int getId, String search)? getCarModel,
    TResult? Function(int id)? getMakeId,
    TResult? Function(MakeEntity model, int selectedId)? selectedModelItem,
    TResult? Function()? confirmModel,
    TResult? Function()? revertModel,
  }) {
    return confirmModel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int getId, String search)? getCarModel,
    TResult Function(int id)? getMakeId,
    TResult Function(MakeEntity model, int selectedId)? selectedModelItem,
    TResult Function()? confirmModel,
    TResult Function()? revertModel,
    required TResult orElse(),
  }) {
    if (confirmModel != null) {
      return confirmModel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCarModel value) getCarModel,
    required TResult Function(_GetMakeId value) getMakeId,
    required TResult Function(_SelectedModelItem value) selectedModelItem,
    required TResult Function(_ConfirmModel value) confirmModel,
    required TResult Function(_RevertModel value) revertModel,
  }) {
    return confirmModel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCarModel value)? getCarModel,
    TResult? Function(_GetMakeId value)? getMakeId,
    TResult? Function(_SelectedModelItem value)? selectedModelItem,
    TResult? Function(_ConfirmModel value)? confirmModel,
    TResult? Function(_RevertModel value)? revertModel,
  }) {
    return confirmModel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCarModel value)? getCarModel,
    TResult Function(_GetMakeId value)? getMakeId,
    TResult Function(_SelectedModelItem value)? selectedModelItem,
    TResult Function(_ConfirmModel value)? confirmModel,
    TResult Function(_RevertModel value)? revertModel,
    required TResult orElse(),
  }) {
    if (confirmModel != null) {
      return confirmModel(this);
    }
    return orElse();
  }
}

abstract class _ConfirmModel implements GetCarModelEvent {
  factory _ConfirmModel() = _$_ConfirmModel;
}

/// @nodoc
abstract class _$$_RevertModelCopyWith<$Res> {
  factory _$$_RevertModelCopyWith(
          _$_RevertModel value, $Res Function(_$_RevertModel) then) =
      __$$_RevertModelCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RevertModelCopyWithImpl<$Res>
    extends _$GetCarModelEventCopyWithImpl<$Res, _$_RevertModel>
    implements _$$_RevertModelCopyWith<$Res> {
  __$$_RevertModelCopyWithImpl(
      _$_RevertModel _value, $Res Function(_$_RevertModel) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RevertModel implements _RevertModel {
  _$_RevertModel();

  @override
  String toString() {
    return 'GetCarModelEvent.revertModel()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RevertModel);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int getId, String search) getCarModel,
    required TResult Function(int id) getMakeId,
    required TResult Function(MakeEntity model, int selectedId)
        selectedModelItem,
    required TResult Function() confirmModel,
    required TResult Function() revertModel,
  }) {
    return revertModel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int getId, String search)? getCarModel,
    TResult? Function(int id)? getMakeId,
    TResult? Function(MakeEntity model, int selectedId)? selectedModelItem,
    TResult? Function()? confirmModel,
    TResult? Function()? revertModel,
  }) {
    return revertModel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int getId, String search)? getCarModel,
    TResult Function(int id)? getMakeId,
    TResult Function(MakeEntity model, int selectedId)? selectedModelItem,
    TResult Function()? confirmModel,
    TResult Function()? revertModel,
    required TResult orElse(),
  }) {
    if (revertModel != null) {
      return revertModel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCarModel value) getCarModel,
    required TResult Function(_GetMakeId value) getMakeId,
    required TResult Function(_SelectedModelItem value) selectedModelItem,
    required TResult Function(_ConfirmModel value) confirmModel,
    required TResult Function(_RevertModel value) revertModel,
  }) {
    return revertModel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCarModel value)? getCarModel,
    TResult? Function(_GetMakeId value)? getMakeId,
    TResult? Function(_SelectedModelItem value)? selectedModelItem,
    TResult? Function(_ConfirmModel value)? confirmModel,
    TResult? Function(_RevertModel value)? revertModel,
  }) {
    return revertModel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCarModel value)? getCarModel,
    TResult Function(_GetMakeId value)? getMakeId,
    TResult Function(_SelectedModelItem value)? selectedModelItem,
    TResult Function(_ConfirmModel value)? confirmModel,
    TResult Function(_RevertModel value)? revertModel,
    required TResult orElse(),
  }) {
    if (revertModel != null) {
      return revertModel(this);
    }
    return orElse();
  }
}

abstract class _RevertModel implements GetCarModelEvent {
  factory _RevertModel() = _$_RevertModel;
}

/// @nodoc
mixin _$GetCarModelState {
  FormzStatus get status => throw _privateConstructorUsedError;
  GetMakeEntity get model => throw _privateConstructorUsedError;
  dynamic get next => throw _privateConstructorUsedError;
  int get getId => throw _privateConstructorUsedError;
  dynamic get count => throw _privateConstructorUsedError;
  dynamic get selectedId => throw _privateConstructorUsedError;
  dynamic get confirmId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  MakeEntity get selectedModel => throw _privateConstructorUsedError;

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
      int getId,
      dynamic count,
      dynamic selectedId,
      dynamic confirmId,
      String name,
      MakeEntity selectedModel});
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
    Object? getId = null,
    Object? count = freezed,
    Object? selectedId = freezed,
    Object? confirmId = freezed,
    Object? name = null,
    Object? selectedModel = null,
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
      getId: null == getId
          ? _value.getId
          : getId // ignore: cast_nullable_to_non_nullable
              as int,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as dynamic,
      selectedId: freezed == selectedId
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      confirmId: freezed == confirmId
          ? _value.confirmId
          : confirmId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      selectedModel: null == selectedModel
          ? _value.selectedModel
          : selectedModel // ignore: cast_nullable_to_non_nullable
              as MakeEntity,
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
      int getId,
      dynamic count,
      dynamic selectedId,
      dynamic confirmId,
      String name,
      MakeEntity selectedModel});
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
    Object? getId = null,
    Object? count = freezed,
    Object? selectedId = freezed,
    Object? confirmId = freezed,
    Object? name = null,
    Object? selectedModel = null,
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
      getId: null == getId
          ? _value.getId
          : getId // ignore: cast_nullable_to_non_nullable
              as int,
      count: freezed == count ? _value.count! : count,
      selectedId: freezed == selectedId ? _value.selectedId! : selectedId,
      confirmId: freezed == confirmId ? _value.confirmId! : confirmId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      selectedModel: null == selectedModel
          ? _value.selectedModel
          : selectedModel // ignore: cast_nullable_to_non_nullable
              as MakeEntity,
    ));
  }
}

/// @nodoc

class _$_GetCarModelState implements _GetCarModelState {
  _$_GetCarModelState(
      {this.status = FormzStatus.pure,
      this.model = const GetMakeEntity(),
      this.next = '',
      this.getId = 0,
      this.count = 0,
      this.selectedId = 0,
      this.confirmId = 0,
      this.name = '',
      this.selectedModel = const MakeEntity()});

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
  final int getId;
  @override
  @JsonKey()
  final dynamic count;
  @override
  @JsonKey()
  final dynamic selectedId;
  @override
  @JsonKey()
  final dynamic confirmId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final MakeEntity selectedModel;

  @override
  String toString() {
    return 'GetCarModelState(status: $status, model: $model, next: $next, getId: $getId, count: $count, selectedId: $selectedId, confirmId: $confirmId, name: $name, selectedModel: $selectedModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetCarModelState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            (identical(other.getId, getId) || other.getId == getId) &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality()
                .equals(other.selectedId, selectedId) &&
            const DeepCollectionEquality().equals(other.confirmId, confirmId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.selectedModel, selectedModel) ||
                other.selectedModel == selectedModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      model,
      const DeepCollectionEquality().hash(next),
      getId,
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(selectedId),
      const DeepCollectionEquality().hash(confirmId),
      name,
      selectedModel);

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
      final int getId,
      final dynamic count,
      final dynamic selectedId,
      final dynamic confirmId,
      final String name,
      final MakeEntity selectedModel}) = _$_GetCarModelState;

  @override
  FormzStatus get status;
  @override
  GetMakeEntity get model;
  @override
  dynamic get next;
  @override
  int get getId;
  @override
  dynamic get count;
  @override
  dynamic get selectedId;
  @override
  dynamic get confirmId;
  @override
  String get name;
  @override
  MakeEntity get selectedModel;
  @override
  @JsonKey(ignore: true)
  _$$_GetCarModelStateCopyWith<_$_GetCarModelState> get copyWith =>
      throw _privateConstructorUsedError;
}
