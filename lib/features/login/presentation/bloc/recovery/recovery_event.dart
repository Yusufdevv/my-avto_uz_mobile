part of 'recovery_bloc.dart';

@Freezed()
class RecoveryEvent with _$RecoveryEvent {
  factory RecoveryEvent.sendCode(String phone,
      {required Function(String) onSuccess}) = _SendCode;
  factory RecoveryEvent.changePassword(
      {required String password,
      required VoidCallback onSuccess}) = _ChangePassword;
  factory RecoveryEvent.verifyCode(VerifyParam param,
      {required VoidCallback onSuccess}) = _VerifyCode;
}
