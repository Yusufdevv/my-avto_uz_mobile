part of 'pae_bloc.dart';

abstract class PaeEvent {}

class PaeGoToEvent extends PaeEvent {
  final bool goTo;
  PaeGoToEvent({required this.goTo});
}
