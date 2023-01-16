part of 'verification_bloc.dart';

abstract class VerificationEvent {}

class VerificationSendCodeEvent extends VerificationEvent {
  final String phone;
  VerificationSendCodeEvent({required this.phone});
}

class VerificationVerifyEvent extends VerificationEvent {
  final String phone;
  VerificationVerifyEvent({required this.phone});
}
