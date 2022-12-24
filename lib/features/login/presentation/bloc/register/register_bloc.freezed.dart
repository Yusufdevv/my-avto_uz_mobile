// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)
        sendCode,
    required TResult Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)
        verifyCode,
    required TResult Function(
            String fullName, String email, VoidCallback? onSuccess)
        setName,
    required TResult Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)
        register,
    required TResult Function(
            String password, String verifyPassword, VoidCallback? onSuccess)
        checkPassword,
    required TResult Function(String path) changeImage,
    required TResult Function(int region) changeRegion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)?
        sendCode,
    TResult? Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)?
        verifyCode,
    TResult? Function(String fullName, String email, VoidCallback? onSuccess)?
        setName,
    TResult? Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)?
        register,
    TResult? Function(
            String password, String verifyPassword, VoidCallback? onSuccess)?
        checkPassword,
    TResult? Function(String path)? changeImage,
    TResult? Function(int region)? changeRegion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)?
        sendCode,
    TResult Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)?
        verifyCode,
    TResult Function(String fullName, String email, VoidCallback? onSuccess)?
        setName,
    TResult Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)?
        register,
    TResult Function(
            String password, String verifyPassword, VoidCallback? onSuccess)?
        checkPassword,
    TResult Function(String path)? changeImage,
    TResult Function(int region)? changeRegion,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_SetName value) setName,
    required TResult Function(_Register value) register,
    required TResult Function(_CheckPassword value) checkPassword,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_ChangeRegion value) changeRegion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_SetName value)? setName,
    TResult? Function(_Register value)? register,
    TResult? Function(_CheckPassword value)? checkPassword,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_ChangeRegion value)? changeRegion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SetName value)? setName,
    TResult Function(_Register value)? register,
    TResult Function(_CheckPassword value)? checkPassword,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_ChangeRegion value)? changeRegion,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
          RegisterEvent value, $Res Function(RegisterEvent) then) =
      _$RegisterEventCopyWithImpl<$Res, RegisterEvent>;
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res, $Val extends RegisterEvent>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

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
  $Res call(
      {String phone,
      dynamic Function(String)? onSuccess,
      dynamic Function(String)? onError});
}

/// @nodoc
class __$$_SendCodeCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_SendCode>
    implements _$$_SendCodeCopyWith<$Res> {
  __$$_SendCodeCopyWithImpl(
      _$_SendCode _value, $Res Function(_$_SendCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? onSuccess = freezed,
    Object? onError = freezed,
  }) {
    return _then(_$_SendCode(
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      onSuccess: freezed == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as dynamic Function(String)?,
      onError: freezed == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as dynamic Function(String)?,
    ));
  }
}

/// @nodoc

class _$_SendCode implements _SendCode {
  _$_SendCode(this.phone, {this.onSuccess, this.onError});

  @override
  final String phone;
  @override
  final dynamic Function(String)? onSuccess;
  @override
  final dynamic Function(String)? onError;

  @override
  String toString() {
    return 'RegisterEvent.sendCode(phone: $phone, onSuccess: $onSuccess, onError: $onError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendCode &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone, onSuccess, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendCodeCopyWith<_$_SendCode> get copyWith =>
      __$$_SendCodeCopyWithImpl<_$_SendCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)
        sendCode,
    required TResult Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)
        verifyCode,
    required TResult Function(
            String fullName, String email, VoidCallback? onSuccess)
        setName,
    required TResult Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)
        register,
    required TResult Function(
            String password, String verifyPassword, VoidCallback? onSuccess)
        checkPassword,
    required TResult Function(String path) changeImage,
    required TResult Function(int region) changeRegion,
  }) {
    return sendCode(phone, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)?
        sendCode,
    TResult? Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)?
        verifyCode,
    TResult? Function(String fullName, String email, VoidCallback? onSuccess)?
        setName,
    TResult? Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)?
        register,
    TResult? Function(
            String password, String verifyPassword, VoidCallback? onSuccess)?
        checkPassword,
    TResult? Function(String path)? changeImage,
    TResult? Function(int region)? changeRegion,
  }) {
    return sendCode?.call(phone, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)?
        sendCode,
    TResult Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)?
        verifyCode,
    TResult Function(String fullName, String email, VoidCallback? onSuccess)?
        setName,
    TResult Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)?
        register,
    TResult Function(
            String password, String verifyPassword, VoidCallback? onSuccess)?
        checkPassword,
    TResult Function(String path)? changeImage,
    TResult Function(int region)? changeRegion,
    required TResult orElse(),
  }) {
    if (sendCode != null) {
      return sendCode(phone, onSuccess, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_SetName value) setName,
    required TResult Function(_Register value) register,
    required TResult Function(_CheckPassword value) checkPassword,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_ChangeRegion value) changeRegion,
  }) {
    return sendCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_SetName value)? setName,
    TResult? Function(_Register value)? register,
    TResult? Function(_CheckPassword value)? checkPassword,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_ChangeRegion value)? changeRegion,
  }) {
    return sendCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SetName value)? setName,
    TResult Function(_Register value)? register,
    TResult Function(_CheckPassword value)? checkPassword,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_ChangeRegion value)? changeRegion,
    required TResult orElse(),
  }) {
    if (sendCode != null) {
      return sendCode(this);
    }
    return orElse();
  }
}

abstract class _SendCode implements RegisterEvent {
  factory _SendCode(final String phone,
      {final dynamic Function(String)? onSuccess,
      final dynamic Function(String)? onError}) = _$_SendCode;

  String get phone;
  dynamic Function(String)? get onSuccess;
  dynamic Function(String)? get onError;
  @JsonKey(ignore: true)
  _$$_SendCodeCopyWith<_$_SendCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_VerifyCodeCopyWith<$Res> {
  factory _$$_VerifyCodeCopyWith(
          _$_VerifyCode value, $Res Function(_$_VerifyCode) then) =
      __$$_VerifyCodeCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {VerifyParam param,
      VoidCallback? onSuccess,
      dynamic Function(String)? onError});
}

/// @nodoc
class __$$_VerifyCodeCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_VerifyCode>
    implements _$$_VerifyCodeCopyWith<$Res> {
  __$$_VerifyCodeCopyWithImpl(
      _$_VerifyCode _value, $Res Function(_$_VerifyCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? param = null,
    Object? onSuccess = freezed,
    Object? onError = freezed,
  }) {
    return _then(_$_VerifyCode(
      null == param
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as VerifyParam,
      onSuccess: freezed == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
      onError: freezed == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as dynamic Function(String)?,
    ));
  }
}

/// @nodoc

class _$_VerifyCode implements _VerifyCode {
  _$_VerifyCode(this.param, {this.onSuccess, this.onError});

  @override
  final VerifyParam param;
  @override
  final VoidCallback? onSuccess;
  @override
  final dynamic Function(String)? onError;

  @override
  String toString() {
    return 'RegisterEvent.verifyCode(param: $param, onSuccess: $onSuccess, onError: $onError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyCode &&
            (identical(other.param, param) || other.param == param) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, param, onSuccess, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerifyCodeCopyWith<_$_VerifyCode> get copyWith =>
      __$$_VerifyCodeCopyWithImpl<_$_VerifyCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)
        sendCode,
    required TResult Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)
        verifyCode,
    required TResult Function(
            String fullName, String email, VoidCallback? onSuccess)
        setName,
    required TResult Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)
        register,
    required TResult Function(
            String password, String verifyPassword, VoidCallback? onSuccess)
        checkPassword,
    required TResult Function(String path) changeImage,
    required TResult Function(int region) changeRegion,
  }) {
    return verifyCode(param, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)?
        sendCode,
    TResult? Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)?
        verifyCode,
    TResult? Function(String fullName, String email, VoidCallback? onSuccess)?
        setName,
    TResult? Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)?
        register,
    TResult? Function(
            String password, String verifyPassword, VoidCallback? onSuccess)?
        checkPassword,
    TResult? Function(String path)? changeImage,
    TResult? Function(int region)? changeRegion,
  }) {
    return verifyCode?.call(param, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)?
        sendCode,
    TResult Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)?
        verifyCode,
    TResult Function(String fullName, String email, VoidCallback? onSuccess)?
        setName,
    TResult Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)?
        register,
    TResult Function(
            String password, String verifyPassword, VoidCallback? onSuccess)?
        checkPassword,
    TResult Function(String path)? changeImage,
    TResult Function(int region)? changeRegion,
    required TResult orElse(),
  }) {
    if (verifyCode != null) {
      return verifyCode(param, onSuccess, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_SetName value) setName,
    required TResult Function(_Register value) register,
    required TResult Function(_CheckPassword value) checkPassword,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_ChangeRegion value) changeRegion,
  }) {
    return verifyCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_SetName value)? setName,
    TResult? Function(_Register value)? register,
    TResult? Function(_CheckPassword value)? checkPassword,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_ChangeRegion value)? changeRegion,
  }) {
    return verifyCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SetName value)? setName,
    TResult Function(_Register value)? register,
    TResult Function(_CheckPassword value)? checkPassword,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_ChangeRegion value)? changeRegion,
    required TResult orElse(),
  }) {
    if (verifyCode != null) {
      return verifyCode(this);
    }
    return orElse();
  }
}

abstract class _VerifyCode implements RegisterEvent {
  factory _VerifyCode(final VerifyParam param,
      {final VoidCallback? onSuccess,
      final dynamic Function(String)? onError}) = _$_VerifyCode;

  VerifyParam get param;
  VoidCallback? get onSuccess;
  dynamic Function(String)? get onError;
  @JsonKey(ignore: true)
  _$$_VerifyCodeCopyWith<_$_VerifyCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetNameCopyWith<$Res> {
  factory _$$_SetNameCopyWith(
          _$_SetName value, $Res Function(_$_SetName) then) =
      __$$_SetNameCopyWithImpl<$Res>;
  @useResult
  $Res call({String fullName, String email, VoidCallback? onSuccess});
}

/// @nodoc
class __$$_SetNameCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_SetName>
    implements _$$_SetNameCopyWith<$Res> {
  __$$_SetNameCopyWithImpl(_$_SetName _value, $Res Function(_$_SetName) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? email = null,
    Object? onSuccess = freezed,
  }) {
    return _then(_$_SetName(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      onSuccess: freezed == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$_SetName implements _SetName {
  _$_SetName({required this.fullName, required this.email, this.onSuccess});

  @override
  final String fullName;
  @override
  final String email;
  @override
  final VoidCallback? onSuccess;

  @override
  String toString() {
    return 'RegisterEvent.setName(fullName: $fullName, email: $email, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetName &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fullName, email, onSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetNameCopyWith<_$_SetName> get copyWith =>
      __$$_SetNameCopyWithImpl<_$_SetName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)
        sendCode,
    required TResult Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)
        verifyCode,
    required TResult Function(
            String fullName, String email, VoidCallback? onSuccess)
        setName,
    required TResult Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)
        register,
    required TResult Function(
            String password, String verifyPassword, VoidCallback? onSuccess)
        checkPassword,
    required TResult Function(String path) changeImage,
    required TResult Function(int region) changeRegion,
  }) {
    return setName(fullName, email, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)?
        sendCode,
    TResult? Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)?
        verifyCode,
    TResult? Function(String fullName, String email, VoidCallback? onSuccess)?
        setName,
    TResult? Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)?
        register,
    TResult? Function(
            String password, String verifyPassword, VoidCallback? onSuccess)?
        checkPassword,
    TResult? Function(String path)? changeImage,
    TResult? Function(int region)? changeRegion,
  }) {
    return setName?.call(fullName, email, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)?
        sendCode,
    TResult Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)?
        verifyCode,
    TResult Function(String fullName, String email, VoidCallback? onSuccess)?
        setName,
    TResult Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)?
        register,
    TResult Function(
            String password, String verifyPassword, VoidCallback? onSuccess)?
        checkPassword,
    TResult Function(String path)? changeImage,
    TResult Function(int region)? changeRegion,
    required TResult orElse(),
  }) {
    if (setName != null) {
      return setName(fullName, email, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_SetName value) setName,
    required TResult Function(_Register value) register,
    required TResult Function(_CheckPassword value) checkPassword,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_ChangeRegion value) changeRegion,
  }) {
    return setName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_SetName value)? setName,
    TResult? Function(_Register value)? register,
    TResult? Function(_CheckPassword value)? checkPassword,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_ChangeRegion value)? changeRegion,
  }) {
    return setName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SetName value)? setName,
    TResult Function(_Register value)? register,
    TResult Function(_CheckPassword value)? checkPassword,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_ChangeRegion value)? changeRegion,
    required TResult orElse(),
  }) {
    if (setName != null) {
      return setName(this);
    }
    return orElse();
  }
}

abstract class _SetName implements RegisterEvent {
  factory _SetName(
      {required final String fullName,
      required final String email,
      final VoidCallback? onSuccess}) = _$_SetName;

  String get fullName;
  String get email;
  VoidCallback? get onSuccess;
  @JsonKey(ignore: true)
  _$$_SetNameCopyWith<_$_SetName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RegisterCopyWith<$Res> {
  factory _$$_RegisterCopyWith(
          _$_Register value, $Res Function(_$_Register) then) =
      __$$_RegisterCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String validPassword,
      VoidCallback? onSuccess,
      dynamic Function(String) onError});
}

/// @nodoc
class __$$_RegisterCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_Register>
    implements _$$_RegisterCopyWith<$Res> {
  __$$_RegisterCopyWithImpl(
      _$_Register _value, $Res Function(_$_Register) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validPassword = null,
    Object? onSuccess = freezed,
    Object? onError = null,
  }) {
    return _then(_$_Register(
      validPassword: null == validPassword
          ? _value.validPassword
          : validPassword // ignore: cast_nullable_to_non_nullable
              as String,
      onSuccess: freezed == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
      onError: null == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as dynamic Function(String),
    ));
  }
}

/// @nodoc

class _$_Register implements _Register {
  _$_Register(
      {required this.validPassword, this.onSuccess, required this.onError});

  @override
  final String validPassword;
  @override
  final VoidCallback? onSuccess;
  @override
  final dynamic Function(String) onError;

  @override
  String toString() {
    return 'RegisterEvent.register(validPassword: $validPassword, onSuccess: $onSuccess, onError: $onError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Register &&
            (identical(other.validPassword, validPassword) ||
                other.validPassword == validPassword) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, validPassword, onSuccess, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterCopyWith<_$_Register> get copyWith =>
      __$$_RegisterCopyWithImpl<_$_Register>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)
        sendCode,
    required TResult Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)
        verifyCode,
    required TResult Function(
            String fullName, String email, VoidCallback? onSuccess)
        setName,
    required TResult Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)
        register,
    required TResult Function(
            String password, String verifyPassword, VoidCallback? onSuccess)
        checkPassword,
    required TResult Function(String path) changeImage,
    required TResult Function(int region) changeRegion,
  }) {
    return register(validPassword, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)?
        sendCode,
    TResult? Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)?
        verifyCode,
    TResult? Function(String fullName, String email, VoidCallback? onSuccess)?
        setName,
    TResult? Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)?
        register,
    TResult? Function(
            String password, String verifyPassword, VoidCallback? onSuccess)?
        checkPassword,
    TResult? Function(String path)? changeImage,
    TResult? Function(int region)? changeRegion,
  }) {
    return register?.call(validPassword, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)?
        sendCode,
    TResult Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)?
        verifyCode,
    TResult Function(String fullName, String email, VoidCallback? onSuccess)?
        setName,
    TResult Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)?
        register,
    TResult Function(
            String password, String verifyPassword, VoidCallback? onSuccess)?
        checkPassword,
    TResult Function(String path)? changeImage,
    TResult Function(int region)? changeRegion,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(validPassword, onSuccess, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_SetName value) setName,
    required TResult Function(_Register value) register,
    required TResult Function(_CheckPassword value) checkPassword,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_ChangeRegion value) changeRegion,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_SetName value)? setName,
    TResult? Function(_Register value)? register,
    TResult? Function(_CheckPassword value)? checkPassword,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_ChangeRegion value)? changeRegion,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SetName value)? setName,
    TResult Function(_Register value)? register,
    TResult Function(_CheckPassword value)? checkPassword,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_ChangeRegion value)? changeRegion,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class _Register implements RegisterEvent {
  factory _Register(
      {required final String validPassword,
      final VoidCallback? onSuccess,
      required final dynamic Function(String) onError}) = _$_Register;

  String get validPassword;
  VoidCallback? get onSuccess;
  dynamic Function(String) get onError;
  @JsonKey(ignore: true)
  _$$_RegisterCopyWith<_$_Register> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CheckPasswordCopyWith<$Res> {
  factory _$$_CheckPasswordCopyWith(
          _$_CheckPassword value, $Res Function(_$_CheckPassword) then) =
      __$$_CheckPasswordCopyWithImpl<$Res>;
  @useResult
  $Res call({String password, String verifyPassword, VoidCallback? onSuccess});
}

/// @nodoc
class __$$_CheckPasswordCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_CheckPassword>
    implements _$$_CheckPasswordCopyWith<$Res> {
  __$$_CheckPasswordCopyWithImpl(
      _$_CheckPassword _value, $Res Function(_$_CheckPassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? verifyPassword = null,
    Object? onSuccess = freezed,
  }) {
    return _then(_$_CheckPassword(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      verifyPassword: null == verifyPassword
          ? _value.verifyPassword
          : verifyPassword // ignore: cast_nullable_to_non_nullable
              as String,
      onSuccess: freezed == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$_CheckPassword implements _CheckPassword {
  _$_CheckPassword(
      {required this.password, required this.verifyPassword, this.onSuccess});

  @override
  final String password;
  @override
  final String verifyPassword;
  @override
  final VoidCallback? onSuccess;

  @override
  String toString() {
    return 'RegisterEvent.checkPassword(password: $password, verifyPassword: $verifyPassword, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckPassword &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.verifyPassword, verifyPassword) ||
                other.verifyPassword == verifyPassword) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, password, verifyPassword, onSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckPasswordCopyWith<_$_CheckPassword> get copyWith =>
      __$$_CheckPasswordCopyWithImpl<_$_CheckPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)
        sendCode,
    required TResult Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)
        verifyCode,
    required TResult Function(
            String fullName, String email, VoidCallback? onSuccess)
        setName,
    required TResult Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)
        register,
    required TResult Function(
            String password, String verifyPassword, VoidCallback? onSuccess)
        checkPassword,
    required TResult Function(String path) changeImage,
    required TResult Function(int region) changeRegion,
  }) {
    return checkPassword(password, verifyPassword, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)?
        sendCode,
    TResult? Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)?
        verifyCode,
    TResult? Function(String fullName, String email, VoidCallback? onSuccess)?
        setName,
    TResult? Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)?
        register,
    TResult? Function(
            String password, String verifyPassword, VoidCallback? onSuccess)?
        checkPassword,
    TResult? Function(String path)? changeImage,
    TResult? Function(int region)? changeRegion,
  }) {
    return checkPassword?.call(password, verifyPassword, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)?
        sendCode,
    TResult Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)?
        verifyCode,
    TResult Function(String fullName, String email, VoidCallback? onSuccess)?
        setName,
    TResult Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)?
        register,
    TResult Function(
            String password, String verifyPassword, VoidCallback? onSuccess)?
        checkPassword,
    TResult Function(String path)? changeImage,
    TResult Function(int region)? changeRegion,
    required TResult orElse(),
  }) {
    if (checkPassword != null) {
      return checkPassword(password, verifyPassword, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_SetName value) setName,
    required TResult Function(_Register value) register,
    required TResult Function(_CheckPassword value) checkPassword,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_ChangeRegion value) changeRegion,
  }) {
    return checkPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_SetName value)? setName,
    TResult? Function(_Register value)? register,
    TResult? Function(_CheckPassword value)? checkPassword,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_ChangeRegion value)? changeRegion,
  }) {
    return checkPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SetName value)? setName,
    TResult Function(_Register value)? register,
    TResult Function(_CheckPassword value)? checkPassword,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_ChangeRegion value)? changeRegion,
    required TResult orElse(),
  }) {
    if (checkPassword != null) {
      return checkPassword(this);
    }
    return orElse();
  }
}

abstract class _CheckPassword implements RegisterEvent {
  factory _CheckPassword(
      {required final String password,
      required final String verifyPassword,
      final VoidCallback? onSuccess}) = _$_CheckPassword;

  String get password;
  String get verifyPassword;
  VoidCallback? get onSuccess;
  @JsonKey(ignore: true)
  _$$_CheckPasswordCopyWith<_$_CheckPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeImageCopyWith<$Res> {
  factory _$$_ChangeImageCopyWith(
          _$_ChangeImage value, $Res Function(_$_ChangeImage) then) =
      __$$_ChangeImageCopyWithImpl<$Res>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$_ChangeImageCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_ChangeImage>
    implements _$$_ChangeImageCopyWith<$Res> {
  __$$_ChangeImageCopyWithImpl(
      _$_ChangeImage _value, $Res Function(_$_ChangeImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$_ChangeImage(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeImage implements _ChangeImage {
  _$_ChangeImage({required this.path});

  @override
  final String path;

  @override
  String toString() {
    return 'RegisterEvent.changeImage(path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeImage &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeImageCopyWith<_$_ChangeImage> get copyWith =>
      __$$_ChangeImageCopyWithImpl<_$_ChangeImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)
        sendCode,
    required TResult Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)
        verifyCode,
    required TResult Function(
            String fullName, String email, VoidCallback? onSuccess)
        setName,
    required TResult Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)
        register,
    required TResult Function(
            String password, String verifyPassword, VoidCallback? onSuccess)
        checkPassword,
    required TResult Function(String path) changeImage,
    required TResult Function(int region) changeRegion,
  }) {
    return changeImage(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)?
        sendCode,
    TResult? Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)?
        verifyCode,
    TResult? Function(String fullName, String email, VoidCallback? onSuccess)?
        setName,
    TResult? Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)?
        register,
    TResult? Function(
            String password, String verifyPassword, VoidCallback? onSuccess)?
        checkPassword,
    TResult? Function(String path)? changeImage,
    TResult? Function(int region)? changeRegion,
  }) {
    return changeImage?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)?
        sendCode,
    TResult Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)?
        verifyCode,
    TResult Function(String fullName, String email, VoidCallback? onSuccess)?
        setName,
    TResult Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)?
        register,
    TResult Function(
            String password, String verifyPassword, VoidCallback? onSuccess)?
        checkPassword,
    TResult Function(String path)? changeImage,
    TResult Function(int region)? changeRegion,
    required TResult orElse(),
  }) {
    if (changeImage != null) {
      return changeImage(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_SetName value) setName,
    required TResult Function(_Register value) register,
    required TResult Function(_CheckPassword value) checkPassword,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_ChangeRegion value) changeRegion,
  }) {
    return changeImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_SetName value)? setName,
    TResult? Function(_Register value)? register,
    TResult? Function(_CheckPassword value)? checkPassword,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_ChangeRegion value)? changeRegion,
  }) {
    return changeImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SetName value)? setName,
    TResult Function(_Register value)? register,
    TResult Function(_CheckPassword value)? checkPassword,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_ChangeRegion value)? changeRegion,
    required TResult orElse(),
  }) {
    if (changeImage != null) {
      return changeImage(this);
    }
    return orElse();
  }
}

abstract class _ChangeImage implements RegisterEvent {
  factory _ChangeImage({required final String path}) = _$_ChangeImage;

  String get path;
  @JsonKey(ignore: true)
  _$$_ChangeImageCopyWith<_$_ChangeImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeRegionCopyWith<$Res> {
  factory _$$_ChangeRegionCopyWith(
          _$_ChangeRegion value, $Res Function(_$_ChangeRegion) then) =
      __$$_ChangeRegionCopyWithImpl<$Res>;
  @useResult
  $Res call({int region});
}

/// @nodoc
class __$$_ChangeRegionCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_ChangeRegion>
    implements _$$_ChangeRegionCopyWith<$Res> {
  __$$_ChangeRegionCopyWithImpl(
      _$_ChangeRegion _value, $Res Function(_$_ChangeRegion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? region = null,
  }) {
    return _then(_$_ChangeRegion(
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChangeRegion implements _ChangeRegion {
  _$_ChangeRegion({required this.region});

  @override
  final int region;

  @override
  String toString() {
    return 'RegisterEvent.changeRegion(region: $region)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeRegion &&
            (identical(other.region, region) || other.region == region));
  }

  @override
  int get hashCode => Object.hash(runtimeType, region);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeRegionCopyWith<_$_ChangeRegion> get copyWith =>
      __$$_ChangeRegionCopyWithImpl<_$_ChangeRegion>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)
        sendCode,
    required TResult Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)
        verifyCode,
    required TResult Function(
            String fullName, String email, VoidCallback? onSuccess)
        setName,
    required TResult Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)
        register,
    required TResult Function(
            String password, String verifyPassword, VoidCallback? onSuccess)
        checkPassword,
    required TResult Function(String path) changeImage,
    required TResult Function(int region) changeRegion,
  }) {
    return changeRegion(region);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)?
        sendCode,
    TResult? Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)?
        verifyCode,
    TResult? Function(String fullName, String email, VoidCallback? onSuccess)?
        setName,
    TResult? Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)?
        register,
    TResult? Function(
            String password, String verifyPassword, VoidCallback? onSuccess)?
        checkPassword,
    TResult? Function(String path)? changeImage,
    TResult? Function(int region)? changeRegion,
  }) {
    return changeRegion?.call(region);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, dynamic Function(String)? onSuccess,
            dynamic Function(String)? onError)?
        sendCode,
    TResult Function(VerifyParam param, VoidCallback? onSuccess,
            dynamic Function(String)? onError)?
        verifyCode,
    TResult Function(String fullName, String email, VoidCallback? onSuccess)?
        setName,
    TResult Function(String validPassword, VoidCallback? onSuccess,
            dynamic Function(String) onError)?
        register,
    TResult Function(
            String password, String verifyPassword, VoidCallback? onSuccess)?
        checkPassword,
    TResult Function(String path)? changeImage,
    TResult Function(int region)? changeRegion,
    required TResult orElse(),
  }) {
    if (changeRegion != null) {
      return changeRegion(region);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_SetName value) setName,
    required TResult Function(_Register value) register,
    required TResult Function(_CheckPassword value) checkPassword,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_ChangeRegion value) changeRegion,
  }) {
    return changeRegion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_SetName value)? setName,
    TResult? Function(_Register value)? register,
    TResult? Function(_CheckPassword value)? checkPassword,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_ChangeRegion value)? changeRegion,
  }) {
    return changeRegion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SetName value)? setName,
    TResult Function(_Register value)? register,
    TResult Function(_CheckPassword value)? checkPassword,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_ChangeRegion value)? changeRegion,
    required TResult orElse(),
  }) {
    if (changeRegion != null) {
      return changeRegion(this);
    }
    return orElse();
  }
}

abstract class _ChangeRegion implements RegisterEvent {
  factory _ChangeRegion({required final int region}) = _$_ChangeRegion;

  int get region;
  @JsonKey(ignore: true)
  _$$_ChangeRegionCopyWith<_$_ChangeRegion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterState {
  FormzStatus get registerStatus => throw _privateConstructorUsedError;
  FormzStatus get verifyStatus => throw _privateConstructorUsedError;
  FormzStatus get sendCodeStatus => throw _privateConstructorUsedError;
  RegisterModel get registerModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
  @useResult
  $Res call(
      {FormzStatus registerStatus,
      FormzStatus verifyStatus,
      FormzStatus sendCodeStatus,
      RegisterModel registerModel});
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

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
    Object? registerModel = null,
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
      registerModel: null == registerModel
          ? _value.registerModel
          : registerModel // ignore: cast_nullable_to_non_nullable
              as RegisterModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterStateCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$_RegisterStateCopyWith(
          _$_RegisterState value, $Res Function(_$_RegisterState) then) =
      __$$_RegisterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus registerStatus,
      FormzStatus verifyStatus,
      FormzStatus sendCodeStatus,
      RegisterModel registerModel});
}

/// @nodoc
class __$$_RegisterStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$_RegisterState>
    implements _$$_RegisterStateCopyWith<$Res> {
  __$$_RegisterStateCopyWithImpl(
      _$_RegisterState _value, $Res Function(_$_RegisterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerStatus = null,
    Object? verifyStatus = null,
    Object? sendCodeStatus = null,
    Object? registerModel = null,
  }) {
    return _then(_$_RegisterState(
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
      registerModel: null == registerModel
          ? _value.registerModel
          : registerModel // ignore: cast_nullable_to_non_nullable
              as RegisterModel,
    ));
  }
}

/// @nodoc

class _$_RegisterState implements _RegisterState {
  _$_RegisterState(
      {this.registerStatus = FormzStatus.pure,
      this.verifyStatus = FormzStatus.pure,
      this.sendCodeStatus = FormzStatus.pure,
      this.registerModel = const RegisterModel()});

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
  final RegisterModel registerModel;

  @override
  String toString() {
    return 'RegisterState(registerStatus: $registerStatus, verifyStatus: $verifyStatus, sendCodeStatus: $sendCodeStatus, registerModel: $registerModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterState &&
            (identical(other.registerStatus, registerStatus) ||
                other.registerStatus == registerStatus) &&
            (identical(other.verifyStatus, verifyStatus) ||
                other.verifyStatus == verifyStatus) &&
            (identical(other.sendCodeStatus, sendCodeStatus) ||
                other.sendCodeStatus == sendCodeStatus) &&
            (identical(other.registerModel, registerModel) ||
                other.registerModel == registerModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, registerStatus, verifyStatus, sendCodeStatus, registerModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterStateCopyWith<_$_RegisterState> get copyWith =>
      __$$_RegisterStateCopyWithImpl<_$_RegisterState>(this, _$identity);
}

abstract class _RegisterState implements RegisterState {
  factory _RegisterState(
      {final FormzStatus registerStatus,
      final FormzStatus verifyStatus,
      final FormzStatus sendCodeStatus,
      final RegisterModel registerModel}) = _$_RegisterState;

  @override
  FormzStatus get registerStatus;
  @override
  FormzStatus get verifyStatus;
  @override
  FormzStatus get sendCodeStatus;
  @override
  RegisterModel get registerModel;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterStateCopyWith<_$_RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}
