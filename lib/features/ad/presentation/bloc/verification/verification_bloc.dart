import 'dart:async';

import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/login/domain/usecases/send_code.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  final SendCodeUseCase sendCodeUseCase;

  final VerifyCodeUseCase verifyCodeUseCase;
  VerificationBloc(
      {required this.sendCodeUseCase, required this.verifyCodeUseCase})
      : super(const VerificationState(status: FormzStatus.pure)) {
    on<VerificationSendCodeEvent>(_sendCode);
  }
  FutureOr<void> _sendCode(
      VerificationSendCodeEvent event, Emitter<VerificationState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await sendCodeUseCase.call(event.phone);
    if (result.isRight) {
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess, session: result.right));
    } else {
      var toastMessage = (result.left is ServerFailure)
          ? (result.left as ServerFailure).errorMessage
          : result.left.toString();
      if (toastMessage == 'Wrong code!') {
        toastMessage = 'Код подтверждения введен неверно';
      }
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, toastMessage: toastMessage));
    }
  }
}
