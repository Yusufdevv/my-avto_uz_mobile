part of 'recovery_bloc.dart';

@Freezed()
class RecoveryState with _$RecoveryState {
  factory RecoveryState({
    @Default(FormzStatus.pure) FormzStatus registerStatus,
    @Default(FormzStatus.pure) FormzStatus verifyStatus,
    @Default(FormzStatus.pure) FormzStatus sendCodeStatus,
    @Default('') String phone,
  }) = _RecoveryState;
}
