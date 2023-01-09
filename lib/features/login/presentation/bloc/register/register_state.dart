part of 'register_bloc.dart';

@Freezed()
class RegisterState with _$RegisterState {
  factory RegisterState({
    @Default(FormzStatus.pure) FormzStatus registerStatus,
    @Default(FormzStatus.pure) FormzStatus verifyStatus,
    @Default(FormzStatus.pure) FormzStatus sendCodeStatus,
    @Default(RegisterModel()) RegisterModel registerModel,
  }) = _RegisterState;
}
