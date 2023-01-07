// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnnouncementListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAnnouncementList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAnnouncementList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAnnouncementList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncementList value) getAnnouncementList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncementList value)? getAnnouncementList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncementList value)? getAnnouncementList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementListEventCopyWith<$Res> {
  factory $AnnouncementListEventCopyWith(AnnouncementListEvent value,
          $Res Function(AnnouncementListEvent) then) =
      _$AnnouncementListEventCopyWithImpl<$Res, AnnouncementListEvent>;
}

/// @nodoc
class _$AnnouncementListEventCopyWithImpl<$Res,
        $Val extends AnnouncementListEvent>
    implements $AnnouncementListEventCopyWith<$Res> {
  _$AnnouncementListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetAnnouncementListCopyWith<$Res> {
  factory _$$_GetAnnouncementListCopyWith(_$_GetAnnouncementList value,
          $Res Function(_$_GetAnnouncementList) then) =
      __$$_GetAnnouncementListCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetAnnouncementListCopyWithImpl<$Res>
    extends _$AnnouncementListEventCopyWithImpl<$Res, _$_GetAnnouncementList>
    implements _$$_GetAnnouncementListCopyWith<$Res> {
  __$$_GetAnnouncementListCopyWithImpl(_$_GetAnnouncementList _value,
      $Res Function(_$_GetAnnouncementList) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetAnnouncementList implements _GetAnnouncementList {
  _$_GetAnnouncementList();

  @override
  String toString() {
    return 'AnnouncementListEvent.getAnnouncementList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetAnnouncementList);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAnnouncementList,
  }) {
    return getAnnouncementList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAnnouncementList,
  }) {
    return getAnnouncementList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAnnouncementList,
    required TResult orElse(),
  }) {
    if (getAnnouncementList != null) {
      return getAnnouncementList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncementList value) getAnnouncementList,
  }) {
    return getAnnouncementList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncementList value)? getAnnouncementList,
  }) {
    return getAnnouncementList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncementList value)? getAnnouncementList,
    required TResult orElse(),
  }) {
    if (getAnnouncementList != null) {
      return getAnnouncementList(this);
    }
    return orElse();
  }
}

abstract class _GetAnnouncementList implements AnnouncementListEvent {
  factory _GetAnnouncementList() = _$_GetAnnouncementList;
}

/// @nodoc
mixin _$AnnouncementListState {
  FormzStatus get status => throw _privateConstructorUsedError;
  dynamic get selected => throw _privateConstructorUsedError;
  dynamic get next => throw _privateConstructorUsedError;
  dynamic get search => throw _privateConstructorUsedError;
  dynamic get count => throw _privateConstructorUsedError;
  List<AnnouncementListEntity> get announcementList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementListStateCopyWith<AnnouncementListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementListStateCopyWith<$Res> {
  factory $AnnouncementListStateCopyWith(AnnouncementListState value,
          $Res Function(AnnouncementListState) then) =
      _$AnnouncementListStateCopyWithImpl<$Res, AnnouncementListState>;
  @useResult
  $Res call(
      {FormzStatus status,
      dynamic selected,
      dynamic next,
      dynamic search,
      dynamic count,
      List<AnnouncementListEntity> announcementList});
}

/// @nodoc
class _$AnnouncementListStateCopyWithImpl<$Res,
        $Val extends AnnouncementListState>
    implements $AnnouncementListStateCopyWith<$Res> {
  _$AnnouncementListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selected = freezed,
    Object? next = freezed,
    Object? search = freezed,
    Object? count = freezed,
    Object? announcementList = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as dynamic,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as dynamic,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as dynamic,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as dynamic,
      announcementList: null == announcementList
          ? _value.announcementList
          : announcementList // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementListEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnnouncementListCopyWith<$Res>
    implements $AnnouncementListStateCopyWith<$Res> {
  factory _$$_AnnouncementListCopyWith(
          _$_AnnouncementList value, $Res Function(_$_AnnouncementList) then) =
      __$$_AnnouncementListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus status,
      dynamic selected,
      dynamic next,
      dynamic search,
      dynamic count,
      List<AnnouncementListEntity> announcementList});
}

/// @nodoc
class __$$_AnnouncementListCopyWithImpl<$Res>
    extends _$AnnouncementListStateCopyWithImpl<$Res, _$_AnnouncementList>
    implements _$$_AnnouncementListCopyWith<$Res> {
  __$$_AnnouncementListCopyWithImpl(
      _$_AnnouncementList _value, $Res Function(_$_AnnouncementList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selected = freezed,
    Object? next = freezed,
    Object? search = freezed,
    Object? count = freezed,
    Object? announcementList = null,
  }) {
    return _then(_$_AnnouncementList(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      selected: freezed == selected ? _value.selected! : selected,
      next: freezed == next ? _value.next! : next,
      search: freezed == search ? _value.search! : search,
      count: freezed == count ? _value.count! : count,
      announcementList: null == announcementList
          ? _value._announcementList
          : announcementList // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementListEntity>,
    ));
  }
}

/// @nodoc

class _$_AnnouncementList implements _AnnouncementList {
  _$_AnnouncementList(
      {this.status = FormzStatus.pure,
      this.selected = -1,
      this.next = '',
      this.search = '',
      this.count = 0,
      final List<AnnouncementListEntity> announcementList = const []})
      : _announcementList = announcementList;

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final dynamic selected;
  @override
  @JsonKey()
  final dynamic next;
  @override
  @JsonKey()
  final dynamic search;
  @override
  @JsonKey()
  final dynamic count;
  final List<AnnouncementListEntity> _announcementList;
  @override
  @JsonKey()
  List<AnnouncementListEntity> get announcementList {
    if (_announcementList is EqualUnmodifiableListView)
      return _announcementList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_announcementList);
  }

  @override
  String toString() {
    return 'AnnouncementListState(status: $status, selected: $selected, next: $next, search: $search, count: $count, announcementList: $announcementList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncementList &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.selected, selected) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.search, search) &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality()
                .equals(other._announcementList, _announcementList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(selected),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(search),
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(_announcementList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnouncementListCopyWith<_$_AnnouncementList> get copyWith =>
      __$$_AnnouncementListCopyWithImpl<_$_AnnouncementList>(this, _$identity);
}

abstract class _AnnouncementList implements AnnouncementListState {
  factory _AnnouncementList(
          {final FormzStatus status,
          final dynamic selected,
          final dynamic next,
          final dynamic search,
          final dynamic count,
          final List<AnnouncementListEntity> announcementList}) =
      _$_AnnouncementList;

  @override
  FormzStatus get status;
  @override
  dynamic get selected;
  @override
  dynamic get next;
  @override
  dynamic get search;
  @override
  dynamic get count;
  @override
  List<AnnouncementListEntity> get announcementList;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementListCopyWith<_$_AnnouncementList> get copyWith =>
      throw _privateConstructorUsedError;
}
