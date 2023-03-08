part of 'get_car_model_bloc.dart';

abstract class GetCarModelEvent {}

class GetCarModelGetEvent extends GetCarModelEvent {
  final int getId;
  final String search;

  GetCarModelGetEvent({required this.getId, required this.search});
}

class GetCarModelGetMakeIdEvent extends GetCarModelEvent {
  final int id;

  GetCarModelGetMakeIdEvent({required this.id});
}

class GetCarModelConfirmModelEvent extends GetCarModelEvent {
  GetCarModelConfirmModelEvent();
}

class GetCarModelGetAnnouncementListEvent extends GetCarModelEvent {
  final int makeId;
  final int modelId;

  GetCarModelGetAnnouncementListEvent(
      {required this.makeId, required this.modelId});
}

class GetCarModelSelectModelEvent extends GetCarModelEvent {
  final int selectedId;
  final MakeEntity model;

  GetCarModelSelectModelEvent(
      {required this.model, required this.selectedId});
}
