part of 'register_bloc.dart';

@Freezed()
 class RegisterEvent with _$RegisterEvent {
   factory RegisterEvent.sendCode(String phone,{ Function(String )? onSuccess})=_SendCode;
   factory RegisterEvent.verifyCode(VerifyParam param,{ VoidCallback? onSuccess})=_VerifyCode;
   factory RegisterEvent.setName({required String fullName ,required String email,VoidCallback? onSuccess })=_SetName;
   factory RegisterEvent.register({required String validPassword,VoidCallback? onSuccess })=_Register;
   factory RegisterEvent.checkPassword({required String password,required String verifyPassword,VoidCallback? onSuccess })=_CheckPassword;
   factory RegisterEvent.changeImage({required String path})=_ChangeImage;
   factory RegisterEvent.changeRegion({required int region})=_ChangeRegion;
 }
