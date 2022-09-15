part of 'register_bloc.dart';

@Freezed()
 class RegisterState with _$RegisterState {
   factory RegisterState({
     @Default([]) FormzStatus registerStatus,
     @Default(FormzStatus.pure) FormzStatus verifyStatus,
     @Default(FormzStatus.pure) FormzStatus sendCodeStatus,
     @Default(FormzStatus.pure) RegisterModel registerModel,
 })=_RegisterState;
 }


