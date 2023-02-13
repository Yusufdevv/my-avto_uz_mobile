part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {
  const MainEvent();
}

class InitialEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}

class ChangeStatusEvent extends MainEvent {
  final FormzStatus status;

  const ChangeStatusEvent(this.status);

  @override
  List<Object?> get props => [status];
}

class GetMakeModelEvent extends MainEvent {
  final int makeId;
  final int modelId;
  final String modelName;
  final String makeName;
  final String makeLogo;
  final bool historySaved;

  const GetMakeModelEvent({
    required this.makeId,
    required this.modelId,
    required this.modelName,
    required this.makeName,
    required this.makeLogo,
    required this.historySaved,
  });

  @override
  List<Object?> get props => [makeId, modelId, modelName, makeName, makeLogo, historySaved];
}

class GetAnnouncement extends MainEvent {
  @override
  List<Object?> get props => [];
}
