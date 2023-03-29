part of 'get_car_model_bloc.dart';

class CarModelsState extends Equatable {
  final FormzStatus status;
  final FormzStatus getAnnouncementStatus;
  final MakeEntity? model;
  final List<MakeEntity> models;
  final String? next;
  final String name;
  final int makeId;
  final int announcementCount;

  const CarModelsState({
    required this.status,
    required this.getAnnouncementStatus,
    required this.makeId,
    this.models = const <MakeEntity>[],
    this.next,
    this.name = '',
    this.announcementCount = 0,
    this.model,
  });

  CarModelsState copyWith({
    FormzStatus? status,
    FormzStatus? getAnnouncementStatus,
    MakeEntity? model,
    List<MakeEntity>? models,
    String? next,
    String? name,
    int? makeId,
    int? announcementCount,
  }) =>
      CarModelsState(
        status: status ?? this.status,
        getAnnouncementStatus:
            getAnnouncementStatus ?? this.getAnnouncementStatus,
        model: model != null && model.id == -1 ? null : model ?? this.model,
        models: models ?? this.models,
        next: MyFunctions.returnNullIfEmpty(next, this.next),
        name: name ?? this.name,
        makeId: makeId ?? this.makeId,
        announcementCount: announcementCount ?? this.announcementCount,
      );

  @override
  List<Object?> get props => [
        status,
        getAnnouncementStatus,
        model,
        models,
        next,
        name,
        makeId,
        announcementCount,
      ];
}
