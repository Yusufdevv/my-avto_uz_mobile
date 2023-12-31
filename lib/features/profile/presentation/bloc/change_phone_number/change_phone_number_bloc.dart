import 'package:auto/core/exceptions/failures.dart';
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

  ChangePhoneNumberBloc({
    required this.changePhoneNumberUseCase,
    required this.sendSmsVerificationUseCase,
  }) : super(const ChangePhoneNumberState(
          status: FormzStatus.pure,
          phoneNumber: '',
          session: '',
        )) {
    on<SendPhoneNumberEvent>(_onSendPhoneNumber);
    on<VerifyCodeEvent>(_onSendSmsVerificationCode);
  }

  Future<void> _onSendPhoneNumber(
      SendPhoneNumberEvent event, Emitter<ChangePhoneNumberState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    if (event.newPhoneNumber.isNotEmpty) {
      final result = await changePhoneNumberUseCase
          .call(ChangePhoneNumberParams(phoneNumber: event.newPhoneNumber));
      if (result.isRight) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
        event.onSuccess();
        emit(state.copyWith(session: result.right));
      } else {
        final err = (result.left is ServerFailure)
            ? (result.left as ServerFailure).errorMessage
            : result.left.toString();
        event.onError(err);
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
      event.onError('');
    }
  }

  Future<void> _onSendSmsVerificationCode(
      VerifyCodeEvent event, Emitter<ChangePhoneNumberState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    if (event.newPhoneNumber.isNotEmpty &&
        event.code.isNotEmpty &&
        state.session.isNotEmpty) {
      final result = await sendSmsVerificationUseCase.call(
          SmsVerificationParams(
              phoneNumber: event.newPhoneNumber,
              code: event.code,
              session: state.session));

      if (result.isRight) {
        event.onSuccess();
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } else {
        var err = (result.left is ServerFailure)
            ? (result.left as ServerFailure).errorMessage
            : result.left.toString();
        event.onError(err);
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    } else {
      event.onError('');
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
