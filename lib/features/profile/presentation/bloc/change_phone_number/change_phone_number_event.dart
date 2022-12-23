part of 'change_phone_number_bloc.dart';

abstract class ChangePhoneNumberEvent {}

class SendPhoneNumberEvent extends ChangePhoneNumberEvent {
  final String newPhoneNumber;
  final Function onSuccess;
  final Function(String text) onError;

  SendPhoneNumberEvent(
      {required this.newPhoneNumber,
      required this.onSuccess,
      required this.onError});
}

class SendSmsVerifiactionCodeEvent extends ChangePhoneNumberEvent {
  final String newPhoneNumber;
  final String code;
  final String session;
  final Function onSuccess;
  final Function(String text) onError;

  SendSmsVerifiactionCodeEvent(
      {required this.newPhoneNumber,
      required this.code,
      required this.session,
      required this.onSuccess,
      required this.onError});
}
