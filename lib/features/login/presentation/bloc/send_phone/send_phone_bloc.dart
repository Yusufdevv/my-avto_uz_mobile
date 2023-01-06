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
      print('=>=>=>=> event phone ${event.phone} <=<=<=<=');
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await senCode.call(event.phone);
      if (result.isRight) {
        print('=>=>=>=> result right: ${result.right} <=<=<=<=');
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(
            status: FormzStatus.submissionCanceled,
            toastMessage:
                'Пользователь не существует с введенным номером телефона'));
      }
    });
  }
}
