import 'package:auto/features/profile/domain/usecases/change_phone_number_usecase.dart';
import 'package:auto/features/profile/domain/usecases/send_sms_verifiaction_code_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_phone_number_event.dart';
part 'change_phone_number_state.dart';

class ChangePhoneNumberBloc
    extends Bloc<ChangePhoneNumberEvent, ChangePhoneNumberState> {
  final ChangePhoneNumberUseCase changePhoneNumberUseCase;
  final SendSmsVerificationUseCase sendSmsVerificationUseCase;

  ChangePhoneNumberBloc(
    {required this.changePhoneNumberUseCase,
    required this.sendSmsVerificationUseCase,}
  ) : super(const ChangePhoneNumberState(
    status: FormzStatus.pure,
    phoneNumber: '',
    session: ''
  )) {
    on<SendPhoneNumberEvent>(_onSendPhoneNumber);

    on<SendSmsVerifiactionCodeEvent>(_onSendSmsVerificationCode);
  }

  Future<void> _onSendPhoneNumber(
      SendPhoneNumberEvent event, Emitter<ChangePhoneNumberState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    if (event.newPhoneNumber.isNotEmpty) {
     
        final result = await changePhoneNumberUseCase.call(ChangePhoneNumberParams(
          phoneNumber: event.newPhoneNumber
        ));

        if (result.isRight) {
          emit(state.copyWith(session: result.right));
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
          event.onSuccess();
        } else {
          emit(state.copyWith(status: FormzStatus.submissionFailure));
          event.onError(result.left.toString());
        }
      
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
      event.onError('Telefon nomeringizni kiriting');
    }
  }


  Future<void> _onSendSmsVerificationCode (
      SendSmsVerifiactionCodeEvent event, Emitter<ChangePhoneNumberState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    if (event.newPhoneNumber.isNotEmpty && event.code.isNotEmpty && event.session.isNotEmpty) {
     
        final result = await sendSmsVerificationUseCase.call(SmsVerificationParams(phoneNumber: event.newPhoneNumber, code: event.code, session: event.session));

        if (result.isRight) {
          event.onSuccess();
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
        } else {
          event.onError(result.left.toString());
          emit(state.copyWith(status: FormzStatus.submissionFailure));
        }
      
    } else {
      event.onError('Telefon nomeringizni kiriting');
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
