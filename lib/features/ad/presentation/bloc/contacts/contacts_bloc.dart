import 'dart:async';

import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/ad/domain/usecases/contacts_usecase.dart';
import 'package:auto/features/common/domain/model/user.dart';
import 'package:auto/features/common/repository/auth.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final AuthRepository userRepository;
  final ContactsUseCase contactsUseCase;
  final VerifyCodeUseCase verifyCodeUseCase;
  ContactsBloc({
    required this.userRepository,
    required this.contactsUseCase,
    required this.verifyCodeUseCase,
    required String nameInitial,
    required String phoneInitial,
    required String emailInitial,
  }) : super(ContactsState(
          status: FormzStatus.pure,
          emailController: TextEditingController(text: emailInitial),
          nameController: TextEditingController(text: nameInitial),
          phoneController: TextEditingController(text: phoneInitial),
        )) {
    on<ContactsSendCodeEvent>(_sendCode);
    on<ContactsRefreshControllersEvent>(_refreshControllers);
    on<ContactsGetUserInfoAsContactsEvent>(_getUserInfoAsContacts);
  }

  FutureOr<void> _refreshControllers(ContactsRefreshControllersEvent event,
      Emitter<ContactsState> emit) async {
    emit(state.copyWith(
      nameController: TextEditingController(),
      emailController: TextEditingController(),
      phoneController: TextEditingController(),
    ));
  }

  FutureOr<void> _getUserInfoAsContacts(
      ContactsGetUserInfoAsContactsEvent event,
      Emitter<ContactsState> emit) async {
    emit(state.copyWith(getUserStatus: FormzStatus.submissionInProgress));
    if (state.userModel != null) {
      print('=>=>=>=> controllers initializing <=<=<=<=');
      emit(state.copyWith(
        isSubmitted: true,
        getUserStatus: FormzStatus.submissionSuccess,
        nameController:
            TextEditingController(text: state.userModel?.fullName ?? ''),
        emailController:
            TextEditingController(text: state.userModel?.email ?? ''),
        phoneController: TextEditingController(
            text: MyFunctions.phoneFormat(
                _substringPhone(state.userModel?.phoneNumber))),
      ));
      return;
    }
    final result = await userRepository.getUser();
    if (result.isRight) {
      emit(state.copyWith(
        isSubmitted: true,
        getUserStatus: FormzStatus.submissionSuccess,
        userModel: result.right,
        nameController: TextEditingController(text: result.right.fullName),
        emailController: TextEditingController(text: result.right.email),
        phoneController: TextEditingController(
            text: MyFunctions.phoneFormat(
                _substringPhone(result.right.phoneNumber))),
      ));
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
    print('=>=>=>=> event phone: ${event.phone} <=<=<=<=');
    final result =
        await contactsUseCase.call('+998${event.phone.replaceAll(' ', '')}');
    if (result.isRight) {
      print('=>=>=>=> send code result dot right: ${result.right} <=<=<=<=');
      event.onSuccess(result.right);
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess, session: result.right));
    } else {
      print('=>=>=>=> send code result left: ${result.left} <=<=<=<=');
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          toastMessage: getFailureMessage(result.left)));
    }
  }

  String _substringPhone(String? v) {
    try {
      return v?.substring(4) ?? '';
    } catch (e) {
      return '';
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
