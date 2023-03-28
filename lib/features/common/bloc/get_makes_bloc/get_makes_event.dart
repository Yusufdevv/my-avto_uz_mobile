part of 'get_makes_bloc.dart';

abstract class GetMakesEvent {}

class GetMakesSelectedCarItemsEvent extends GetMakesEvent {
  final MakeEntity makeEntity;

  GetMakesSelectedCarItemsEvent({required this.makeEntity});
}

class GetMakesGoToIndexEvent extends GetMakesEvent {
  final String letter;

  GetMakesGoToIndexEvent({required this.letter});
}

class GetMakesGetSearchedEvent extends GetMakesEvent {
  final String name;

  GetMakesGetSearchedEvent({required this.name});
}

class GetMakesGetEvent extends GetMakesEvent {}
