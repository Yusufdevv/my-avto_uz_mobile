import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/login/domain/usecases/send_recovery_code.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'send_phone_event.dart';
part 'send_phone_state.dart';

class SendPhoneBloc extends Bloc<SendPhoneEvent, SendPhoneState> {
  final SendRecoveryCodeUseCase senCode;
  SendPhoneBloc({required this.senCode})
      : super(const SendPhoneState(
            status: FormzStatus.pure, toastMessage: '', session: '')) {
    on<SendPhoneEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await senCode.call(event.phone);
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess, session: result.right));
      } else {
        final error = (result.left as ServerFailure).errorMessage;
        emit(state.copyWith(
            status: FormzStatus.submissionCanceled, toastMessage: error));
      }
    });
  }
}
