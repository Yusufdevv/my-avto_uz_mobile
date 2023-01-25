import 'dart:async';

import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/login/domain/usecases/change_password.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:auto/features/login/domain/usecases/verify_recovery.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'verify_event.dart';
part 'verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  final VerifyRecoveryUseCase verifyCode;

  final ChangePasswordInLoginUseCase changePassword;
  VerifyBloc(
      {required this.verifyCode,
      required this.changePassword,
      required String phone})
      : super(VerifyState(status: FormzStatus.pure, phone: phone)) {
    on<VerifyVerifyEvent>(_verify);
  }

  FutureOr<void> _verify(
      VerifyVerifyEvent event, Emitter<VerifyState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await verifyCode(event.param);
    if (result.isRight) {
      emit(state.copyWith(
        phone: result.right,
        status: FormzStatus.submissionSuccess,
      ));
    } else {
      final error = result.left is ServerFailure
          ? (result.left as ServerFailure).errorMessage
          : result.left.toString();
      emit(
        state.copyWith(
          status: FormzStatus.submissionCanceled,
          toastMessage: error,
        ),
      );
    }
  }
}
