part of 'get_makes_bloc_bloc.dart';

abstract class GetMakesEvent {}

class GetMakesRevertCarOptionEvent extends GetMakesEvent {
  GetMakesRevertCarOptionEvent();
}

class GetMakesConfirmCarOptionEvent extends GetMakesEvent {
  GetMakesConfirmCarOptionEvent();
}

class GetMakesSelectedCarItemsEvent extends GetMakesEvent {
  final MakeEntity makeEntity;

  GetMakesSelectedCarItemsEvent({required this.makeEntity});
}

class GetMakesChangeControlleStatusEvent extends GetMakesEvent {
  GetMakesChangeControlleStatusEvent();
}

class GetMakesGetIndexEvent extends GetMakesEvent {
  final String index;

  GetMakesGetIndexEvent({required this.index});
}

class GetMakesGetNextTopEvent extends GetMakesEvent {
  GetMakesGetNextTopEvent();
}

class GetMakesGetIsCheckEvent extends GetMakesEvent {
  GetMakesGetIsCheckEvent();
}

class GetMakesSortMakesEvent extends GetMakesEvent {
  final String letter;

  GetMakesSortMakesEvent({required this.letter});
}

class GetMakesChangeSelectedMakeEvent extends GetMakesEvent {
  final int makeId;

  GetMakesChangeSelectedMakeEvent({required this.makeId});
}

class GetMakesGetTopMakesEvent extends GetMakesEvent {
  GetMakesGetTopMakesEvent();
}

class GetMakesGetSearchedEvent extends GetMakesEvent {
  final String name;

  GetMakesGetSearchedEvent({required this.name});
}

class GetMakesGetEvent extends GetMakesEvent {}
