// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recovery_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecoveryEvent {
  Function get onSuccess => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, dynamic Function(String) onSuccess)
        sendCode,
    required TResult Function(String password, VoidCallback onSuccess)
        changePassword,
    required TResult Function(VerifyParam param, VoidCallback onSuccess)
        verifyCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, dynamic Function(String) onSuccess)?
        sendCode,
    TResult? Function(String password, VoidCallback onSuccess)? changePassword,
    TResult? Function(VerifyParam param, VoidCallback onSuccess)? verifyCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, dynamic Function(String) onSuccess)?
        sendCode,
    TResult Function(String password, VoidCallback onSuccess)? changePassword,
    TResult Function(VerifyParam param, VoidCallback onSuccess)? verifyCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_VerifyCode value) verifyCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_VerifyCode value)? verifyCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_VerifyCode value)? verifyCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecoveryEventCopyWith<$Res> {
  factory $RecoveryEventCopyWith(
          RecoveryEvent value, $Res Function(RecoveryEvent) then) =
      _$RecoveryEventCopyWithImpl<$Res, RecoveryEvent>;
}

/// @nodoc
class _$RecoveryEventCopyWithImpl<$Res, $Val extends RecoveryEvent>
    implements $RecoveryEventCopyWith<$Res> {
  _$RecoveryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SendCodeCopyWith<$Res> {
  factory _$$_SendCodeCopyWith(
          _$_SendCode value, $Res Function(_$_SendCode) then) =
      __$$_SendCodeCopyWithImpl<$Res>;
  @useResult
  $Res call({String phone, dynamic Function(String) onSuccess});
}

/// @nodoc
class __$$_SendCodeCopyWithImpl<$Res>
    extends _$RecoveryEventCopyWithImpl<$Res, _$_SendCode>
    implements _$$_SendCodeCopyWith<$Res> {
  __$$_SendCodeCopyWithImpl(
      _$_SendCode _value, $Res Function(_$_SendCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? onSuccess = null,
  }) {
    return _then(_$_SendCode(
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as dynamic Function(String),
    ));
  }
}

/// @nodoc

class _$_SendCode with DiagnosticableTreeMixin implements _SendCode {
  _$_SendCode(this.phone, {required this.onSuccess});

  @override
  final String phone;
  @override
  final dynamic Function(String) onSuccess;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecoveryEvent.sendCode(phone: $phone, onSuccess: $onSuccess)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecoveryEvent.sendCode'))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('onSuccess', onSuccess));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendCode &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone, onSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendCodeCopyWith<_$_SendCode> get copyWith =>
      __$$_SendCodeCopyWithImpl<_$_SendCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, dynamic Function(String) onSuccess)
        sendCode,
    required TResult Function(String password, VoidCallback onSuccess)
        changePassword,
    required TResult Function(VerifyParam param, VoidCallback onSuccess)
        verifyCode,
  }) {
    return sendCode(phone, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, dynamic Function(String) onSuccess)?
        sendCode,
    TResult? Function(String password, VoidCallback onSuccess)? changePassword,
    TResult? Function(VerifyParam param, VoidCallback onSuccess)? verifyCode,
  }) {
    return sendCode?.call(phone, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, dynamic Function(String) onSuccess)?
        sendCode,
    TResult Function(String password, VoidCallback onSuccess)? changePassword,
    TResult Function(VerifyParam param, VoidCallback onSuccess)? verifyCode,
    required TResult orElse(),
  }) {
    if (sendCode != null) {
      return sendCode(phone, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_VerifyCode value) verifyCode,
  }) {
    return sendCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_VerifyCode value)? verifyCode,
  }) {
    return sendCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_VerifyCode value)? verifyCode,
    required TResult orElse(),
  }) {
    if (sendCode != null) {
      return sendCode(this);
    }
    return orElse();
  }
}

abstract class _SendCode implements RecoveryEvent {
  factory _SendCode(final String phone,
      {required final dynamic Function(String) onSuccess}) = _$_SendCode;

  String get phone;
  @override
  dynamic Function(String) get onSuccess;
  @JsonKey(ignore: true)
  _$$_SendCodeCopyWith<_$_SendCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangePasswordCopyWith<$Res> {
  factory _$$_ChangePasswordCopyWith(
          _$_ChangePassword value, $Res Function(_$_ChangePassword) then) =
      __$$_ChangePasswordCopyWithImpl<$Res>;
  @useResult
  $Res call({String password, VoidCallback onSuccess});
}

/// @nodoc
class __$$_ChangePasswordCopyWithImpl<$Res>
    extends _$RecoveryEventCopyWithImpl<$Res, _$_ChangePassword>
    implements _$$_ChangePasswordCopyWith<$Res> {
  __$$_ChangePasswordCopyWithImpl(
      _$_ChangePassword _value, $Res Function(_$_ChangePassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? onSuccess = null,
  }) {
    return _then(_$_ChangePassword(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }
}

/// @nodoc

class _$_ChangePassword
    with DiagnosticableTreeMixin
    implements _ChangePassword {
  _$_ChangePassword({required this.password, required this.onSuccess});

  @override
  final String password;
  @override
  final VoidCallback onSuccess;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecoveryEvent.changePassword(password: $password, onSuccess: $onSuccess)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecoveryEvent.changePassword'))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('onSuccess', onSuccess));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangePassword &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password, onSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangePasswordCopyWith<_$_ChangePassword> get copyWith =>
      __$$_ChangePasswordCopyWithImpl<_$_ChangePassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, dynamic Function(String) onSuccess)
        sendCode,
    required TResult Function(String password, VoidCallback onSuccess)
        changePassword,
    required TResult Function(VerifyParam param, VoidCallback onSuccess)
        verifyCode,
  }) {
    return changePassword(password, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, dynamic Function(String) onSuccess)?
        sendCode,
    TResult? Function(String password, VoidCallback onSuccess)? changePassword,
    TResult? Function(VerifyParam param, VoidCallback onSuccess)? verifyCode,
  }) {
    return changePassword?.call(password, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, dynamic Function(String) onSuccess)?
        sendCode,
    TResult Function(String password, VoidCallback onSuccess)? changePassword,
    TResult Function(VerifyParam param, VoidCallback onSuccess)? verifyCode,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(password, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_VerifyCode value) verifyCode,
  }) {
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_VerifyCode value)? verifyCode,
  }) {
    return changePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_VerifyCode value)? verifyCode,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class _ChangePassword implements RecoveryEvent {
  factory _ChangePassword(
      {required final String password,
      required final VoidCallback onSuccess}) = _$_ChangePassword;

  String get password;
  @override
  VoidCallback get onSuccess;
  @JsonKey(ignore: true)
  _$$_ChangePasswordCopyWith<_$_ChangePassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_VerifyCodeCopyWith<$Res> {
  factory _$$_VerifyCodeCopyWith(
          _$_VerifyCode value, $Res Function(_$_VerifyCode) then) =
      __$$_VerifyCodeCopyWithImpl<$Res>;
  @useResult
  $Res call({VerifyParam param, VoidCallback onSuccess});
}

/// @nodoc
class __$$_VerifyCodeCopyWithImpl<$Res>
    extends _$RecoveryEventCopyWithImpl<$Res, _$_VerifyCode>
    implements _$$_VerifyCodeCopyWith<$Res> {
  __$$_VerifyCodeCopyWithImpl(
      _$_VerifyCode _value, $Res Function(_$_VerifyCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? param = null,
    Object? onSuccess = null,
  }) {
    return _then(_$_VerifyCode(
      null == param
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as VerifyParam,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }
}

/// @nodoc

class _$_VerifyCode with DiagnosticableTreeMixin implements _VerifyCode {
  _$_VerifyCode(this.param, {required this.onSuccess});

  @override
  final VerifyParam param;
  @override
  final VoidCallback onSuccess;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecoveryEvent.verifyCode(param: $param, onSuccess: $onSuccess)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecoveryEvent.verifyCode'))
      ..add(DiagnosticsProperty('param', param))
      ..add(DiagnosticsProperty('onSuccess', onSuccess));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyCode &&
            (identical(other.param, param) || other.param == param) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, param, onSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerifyCodeCopyWith<_$_VerifyCode> get copyWith =>
      __$$_VerifyCodeCopyWithImpl<_$_VerifyCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, dynamic Function(String) onSuccess)
        sendCode,
    required TResult Function(String password, VoidCallback onSuccess)
        changePassword,
    required TResult Function(VerifyParam param, VoidCallback onSuccess)
        verifyCode,
  }) {
    return verifyCode(param, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, dynamic Function(String) onSuccess)?
        sendCode,
    TResult? Function(String password, VoidCallback onSuccess)? changePassword,
    TResult? Function(VerifyParam param, VoidCallback onSuccess)? verifyCode,
  }) {
    return verifyCode?.call(param, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, dynamic Function(String) onSuccess)?
        sendCode,
    TResult Function(String password, VoidCallback onSuccess)? changePassword,
    TResult Function(VerifyParam param, VoidCallback onSuccess)? verifyCode,
    required TResult orElse(),
  }) {
    if (verifyCode != null) {
      return verifyCode(param, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_VerifyCode value) verifyCode,
  }) {
    return verifyCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_VerifyCode value)? verifyCode,
  }) {
    return verifyCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_VerifyCode value)? verifyCode,
    required TResult orElse(),
  }) {
    if (verifyCode != null) {
      return verifyCode(this);
    }
    return orElse();
  }
}

abstract class _VerifyCode implements RecoveryEvent {
  factory _VerifyCode(final VerifyParam param,
      {required final VoidCallback onSuccess}) = _$_VerifyCode;

  VerifyParam get param;
  @override
  VoidCallback get onSuccess;
  @JsonKey(ignore: true)
  _$$_VerifyCodeCopyWith<_$_VerifyCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RecoveryState {
  FormzStatus get registerStatus => throw _privateConstructorUsedError;
  FormzStatus get verifyStatus => throw _privateConstructorUsedError;
  FormzStatus get sendCodeStatus => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecoveryStateCopyWith<RecoveryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecoveryStateCopyWith<$Res> {
  factory $RecoveryStateCopyWith(
          RecoveryState value, $Res Function(RecoveryState) then) =
      _$RecoveryStateCopyWithImpl<$Res, RecoveryState>;
  @useResult
  $Res call(
      {FormzStatus registerStatus,
      FormzStatus verifyStatus,
      FormzStatus sendCodeStatus,
      String phone});
}

/// @nodoc
class _$RecoveryStateCopyWithImpl<$Res, $Val extends RecoveryState>
    implements $RecoveryStateCopyWith<$Res> {
  _$RecoveryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerStatus = null,
    Object? verifyStatus = null,
    Object? sendCodeStatus = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      registerStatus: null == registerStatus
          ? _value.registerStatus
          : registerStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      verifyStatus: null == verifyStatus
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      sendCodeStatus: null == sendCodeStatus
          ? _value.sendCodeStatus
          : sendCodeStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecoveryStateCopyWith<$Res>
    implements $RecoveryStateCopyWith<$Res> {
  factory _$$_RecoveryStateCopyWith(
          _$_RecoveryState value, $Res Function(_$_RecoveryState) then) =
      __$$_RecoveryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus registerStatus,
      FormzStatus verifyStatus,
      FormzStatus sendCodeStatus,
      String phone});
}

/// @nodoc
class __$$_RecoveryStateCopyWithImpl<$Res>
    extends _$RecoveryStateCopyWithImpl<$Res, _$_RecoveryState>
    implements _$$_RecoveryStateCopyWith<$Res> {
  __$$_RecoveryStateCopyWithImpl(
      _$_RecoveryState _value, $Res Function(_$_RecoveryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerStatus = null,
    Object? verifyStatus = null,
    Object? sendCodeStatus = null,
    Object? phone = null,
  }) {
    return _then(_$_RecoveryState(
      registerStatus: null == registerStatus
          ? _value.registerStatus
          : registerStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      verifyStatus: null == verifyStatus
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      sendCodeStatus: null == sendCodeStatus
          ? _value.sendCodeStatus
          : sendCodeStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RecoveryState with DiagnosticableTreeMixin implements _RecoveryState {
  _$_RecoveryState(
      {this.registerStatus = FormzStatus.pure,
      this.verifyStatus = FormzStatus.pure,
      this.sendCodeStatus = FormzStatus.pure,
      this.phone = ''});

  @override
  @JsonKey()
  final FormzStatus registerStatus;
  @override
  @JsonKey()
  final FormzStatus verifyStatus;
  @override
  @JsonKey()
  final FormzStatus sendCodeStatus;
  @override
  @JsonKey()
  final String phone;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecoveryState(registerStatus: $registerStatus, verifyStatus: $verifyStatus, sendCodeStatus: $sendCodeStatus, phone: $phone)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecoveryState'))
      ..add(DiagnosticsProperty('registerStatus', registerStatus))
      ..add(DiagnosticsProperty('verifyStatus', verifyStatus))
      ..add(DiagnosticsProperty('sendCodeStatus', sendCodeStatus))
      ..add(DiagnosticsProperty('phone', phone));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecoveryState &&
            (identical(other.registerStatus, registerStatus) ||
                other.registerStatus == registerStatus) &&
            (identical(other.verifyStatus, verifyStatus) ||
                other.verifyStatus == verifyStatus) &&
            (identical(other.sendCodeStatus, sendCodeStatus) ||
                other.sendCodeStatus == sendCodeStatus) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, registerStatus, verifyStatus, sendCodeStatus, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecoveryStateCopyWith<_$_RecoveryState> get copyWith =>
      __$$_RecoveryStateCopyWithImpl<_$_RecoveryState>(this, _$identity);
}

abstract class _RecoveryState implements RecoveryState {
  factory _RecoveryState(
      {final FormzStatus registerStatus,
      final FormzStatus verifyStatus,
      final FormzStatus sendCodeStatus,
      final String phone}) = _$_RecoveryState;

  @override
  FormzStatus get registerStatus;
  @override
  FormzStatus get verifyStatus;
  @override
  FormzStatus get sendCodeStatus;
  @override
  String get phone;
  @override
  @JsonKey(ignore: true)
  _$$_RecoveryStateCopyWith<_$_RecoveryState> get copyWith =>
      throw _privateConstructorUsedError;
}
