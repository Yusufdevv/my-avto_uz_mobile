part of 'get_car_model_bloc.dart';

class CarModelsState extends Equatable {
  final FormzStatus status;
  final FormzStatus getAnnouncementStatus;
  final MakeEntity model;
  final List<MakeEntity> models;
  final String next;
  final String name;
  final int getId;
  final int count;
  final int announcementCount;

  const CarModelsState({
    required this.status,
    required this.getAnnouncementStatus,
    this.models = const <MakeEntity>[],
    this.next = '',
    this.name = '',
    this.getId = -1,
    this.count = 0,
    this.announcementCount = 0,
    this.model = const MakeEntity(),
  });

  CarModelsState copyWith({
    FormzStatus? status,
    FormzStatus? getAnnouncementStatus,
    MakeEntity? model,
    List<MakeEntity>? models,
    String? next,
    String? name,
    int? getId,
    int? count,
    int? announcementCount,
  }) =>
      CarModelsState(
        status: status ?? this.status,
        getAnnouncementStatus:
            getAnnouncementStatus ?? this.getAnnouncementStatus,
        model: model ?? this.model,
        models: models ?? this.models,
        next: next ?? this.next,
        name: name ?? this.name,
        getId: getId ?? this.getId,
        count: count ?? this.count,
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
        getId,
        count,
        announcementCount,
      ];
}
