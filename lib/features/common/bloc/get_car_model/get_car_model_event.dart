part of 'get_car_model_bloc.dart';

abstract class CarModelsEvent {}

class CarModelsGetEvent extends CarModelsEvent {
  final int getId;
  final String search;

  CarModelsGetEvent({required this.getId, required this.search});
}

class CarModelsGetAnnouncementsEvent extends CarModelsEvent {
  final int makeId;
  final int modelId;

  CarModelsGetAnnouncementsEvent({required this.makeId, required this.modelId});
}

class CarModelsChooseEvent extends CarModelsEvent {
  final MakeEntity? model;
  final int? getId;

  CarModelsChooseEvent({this.model, this.getId});
}

class GetMoreModelsEvent extends CarModelsEvent {
  GetMoreModelsEvent();
}
