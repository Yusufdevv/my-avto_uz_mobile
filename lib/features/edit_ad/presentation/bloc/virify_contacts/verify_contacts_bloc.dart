import 'dart:async';

import 'package:auto/features/ad/domain/usecases/verify_contacts_usecase.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'verify_contacts_event.dart';
part 'verify_contacts_state.dart';

class VerifyContactsBloc
    extends Bloc<VerifyContactsEvent, VerifyContactsState> {
  VerifyContactsUseCase useCase;
  final String phone;
  final String session;
  VerifyContactsBloc(
      {required this.useCase, required this.phone, required this.session})
      : super(const VerifyContactsState(status: FormzStatus.pure)) {
    on<VerifyContactsEvent>(_verify);
  }
  FutureOr<void> _verify(
      VerifyContactsEvent event, Emitter<VerifyContactsState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final result = await useCase.call({
      'phone_number': '+998${phone.replaceAll(' ', '')}',
      'code': event.code,
      'session': session,
    });
    if (result.isRight) {
      emit(state.copyWith(
        status: FormzStatus.submissionSuccess,
      ));
    } else {
      emit(
        state.copyWith(
          toastMessage: MyFunctions.getErrorMessage(result.left),
          status: FormzStatus.submissionFailure,
        ),
      );
    }
  }
}
