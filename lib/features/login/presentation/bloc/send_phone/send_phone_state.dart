part of 'send_phone_bloc.dart';

class SendPhoneState extends Equatable {
  final FormzStatus status;
  final String toastMessage;
  final String session;

  const SendPhoneState(
      {required this.status, this.toastMessage = '', this.session = ''});
  SendPhoneState copyWith(
          {FormzStatus? status, String? toastMessage, String? session}) =>
      SendPhoneState(
        session: session ?? this.session,
        status: status ?? this.status,
        toastMessage: toastMessage ?? this.toastMessage,
      );
  @override
  List<Object?> get props => [status, toastMessage, session];
}
