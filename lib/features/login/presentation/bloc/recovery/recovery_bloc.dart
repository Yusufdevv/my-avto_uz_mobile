import 'dart:async';

import 'package:auto/features/login/domain/usecases/change_password.dart';
import 'package:auto/features/login/domain/usecases/send_recovery_code.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:auto/features/login/domain/usecases/verify_recovery.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recovery_event.dart';

part 'recovery_state.dart';

part 'recovery_bloc.freezed.dart';

class RecoveryBloc extends Bloc<RecoveryEvent, RecoveryState> {
  final SendRecoveryCodeUseCase senCode;
  final VerifyRecoveryUseCase verifyCode;
  final ChangePasswordInLoginUseCase changePassword;

  RecoveryBloc(this.senCode, this.verifyCode, this.changePassword)
      : super(RecoveryState()) {
    on<_SendCode>((event, emit) async {
      emit(state.copyWith(sendCodeStatus: FormzStatus.submissionInProgress));
      final result = await senCode(event.phone);
      if (result.isRight) {
        emit(state.copyWith(
          sendCodeStatus: FormzStatus.submissionSuccess,
        ));

        event.onSuccess(result.right);
      } else {
        emit(state.copyWith(sendCodeStatus: FormzStatus.submissionFailure));
      }
    });

    on<_VerifyCode>((event, emit) async {
      emit(state.copyWith(verifyStatus: FormzStatus.submissionInProgress));
      final result = await verifyCode(event.param);
      if (result.isRight) {
        emit(state.copyWith(
          phone: result.right,
          verifyStatus: FormzStatus.submissionSuccess,
        ));

        event.onSuccess();
      } else {
        emit(state.copyWith(verifyStatus: FormzStatus.submissionFailure));
      }
    });

    on<_ChangePassword>((event, emit) async {
      emit(state.copyWith(registerStatus: FormzStatus.submissionInProgress));
      final result = await changePassword(
          ChangePassParam(phone: state.phone, validPassword: event.password));
      if (result.isRight) {
        event.onSuccess();
        emit(state.copyWith(registerStatus: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(registerStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
