part of 'change_phone_number_bloc.dart';

abstract class ChangePhoneNumberEvent {}

class SendPhoneNumberEvent extends ChangePhoneNumberEvent {
  final String newPhoneNumber;
  final Function() onSuccess;
  final Function(String text) onError;

  SendPhoneNumberEvent(
      {required this.newPhoneNumber,
      required this.onSuccess,
      required this.onError});
}

class VerifyCodeEvent extends ChangePhoneNumberEvent {
  final String newPhoneNumber;
  final String code;
  final Function onSuccess;
  final Function(String text) onError;

  VerifyCodeEvent(
      {required this.newPhoneNumber,
      required this.code,
      required this.onSuccess,
      required this.onError});
}
