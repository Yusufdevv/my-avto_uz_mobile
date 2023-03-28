part of 'main_bloc.dart';

@immutable
abstract class MainEvent {
  const MainEvent();
}

class InitialEvent extends MainEvent {}

class ChangeStatusEvent extends MainEvent {
  final FormzStatus status;

  const ChangeStatusEvent(this.status);
}

class GetMakeModelEvent extends MainEvent {
  final MakeEntity make;
  final MakeEntity model;
  final bool historySaved;

  const GetMakeModelEvent({
    required this.make,
    required this.model,
    required this.historySaved,
  });
}

class GetAnnouncement extends MainEvent {}
