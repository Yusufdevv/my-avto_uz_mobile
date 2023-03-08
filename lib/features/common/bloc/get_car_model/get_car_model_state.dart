part of 'get_car_model_bloc.dart';

class GetCarModelState extends Equatable {
  final FormzStatus status;
  final FormzStatus getAnnouncementStatus;
  final MakeEntity selectedModel;
  final List<MakeEntity> models;
  final String next;
  final String name;
  final int getId;
  final int count;
  final int announcementCount;
  final int confirmId;

  const GetCarModelState({
    required this.status,
    required this.getAnnouncementStatus,
    this.models = const <MakeEntity>[],
    this.next = '',
    this.name = '',
    this.getId = -1,
    this.count = 0,
    this.announcementCount = 0,
    this.confirmId = -1,
    this.selectedModel = const MakeEntity(),
  });

  GetCarModelState copyWith({
    FormzStatus? status,
    FormzStatus? getAnnouncementStatus,
    MakeEntity? selectedModel,
    List<MakeEntity>? models,
    String? next,
    String? name,
    int? getId,
    int? count,
    int? announcementCount,
    int? confirmId,
    int? selectedId,
  }) =>
      GetCarModelState(
        status: status ?? this.status,
        getAnnouncementStatus:
            getAnnouncementStatus ?? this.getAnnouncementStatus,
        selectedModel: selectedModel ?? this.selectedModel,
        models: models ?? this.models,
        next: next ?? this.next,
        name: name ?? this.name,
        getId: getId ?? this.getId,
        count: count ?? this.count,
        announcementCount: announcementCount ?? this.announcementCount,
        confirmId: confirmId ?? this.confirmId,
      );

  @override
  List<Object?> get props => [
        status,
        getAnnouncementStatus,
        selectedModel,
        models,
        next,
        name,
        getId,
        count,
        announcementCount,
        confirmId,
      ];
}
