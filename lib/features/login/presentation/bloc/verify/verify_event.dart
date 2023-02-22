part of 'verify_bloc.dart';

abstract class VerifyEvent {}

class VerifyVerifyEvent extends VerifyEvent {
  final VerifyParam param;
  VerifyVerifyEvent({required this.param});
}
