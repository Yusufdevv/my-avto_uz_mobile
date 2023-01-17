import 'dart:async';

import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/common/domain/model/user.dart';
import 'package:auto/features/common/repository/auth.dart';
import 'package:auto/features/login/domain/usecases/send_code.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final AuthRepository userRepository;
  final SendCodeUseCase sendCodeUseCase;
  final VerifyCodeUseCase verifyCodeUseCase;
  ContactsBloc(
      {required this.userRepository,
      required this.sendCodeUseCase,
      required this.verifyCodeUseCase})
      : super(const ContactsState(status: FormzStatus.pure)) {
    on<ContactsSendCodeEvent>(_sendCode);
    on<ContactsGetUserInfoAsContactsEvent>(_getUserInfoAsContacts);
  }
  FutureOr<void> _getUserInfoAsContacts(
      ContactsGetUserInfoAsContactsEvent event,
      Emitter<ContactsState> emit) async {
    emit(state.copyWith(getUserStatus: FormzStatus.submissionInProgress));
    if (state.userModel != null) {
      emit(state.copyWith(getUserStatus: FormzStatus.submissionSuccess));
      return;
    }
    final result = await userRepository.getUser();
    if (result.isRight) {
      emit(state.copyWith(
          getUserStatus: FormzStatus.submissionSuccess,
          userModel: result.right));
    } else {
      emit(
        state.copyWith(
            getUserStatus: FormzStatus.submissionFailure,
            toastMessage: getFailureMessage(result.left)),
      );
    }
  }

  FutureOr<void> _sendCode(
      ContactsSendCodeEvent event, Emitter<ContactsState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await sendCodeUseCase.call(event.phone);
    if (result.isRight) {
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess, session: result.right));
    } else {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          toastMessage: getFailureMessage(result.left)));
    }
  }
}

String getFailureMessage(Failure failure) {
  var toastMessage =
      (failure is ServerFailure) ? failure.errorMessage : failure.toString();
  if (toastMessage == 'Wrong code!') {
    toastMessage = 'Код подтверждения введен неверно';
  }
  return toastMessage;
}
