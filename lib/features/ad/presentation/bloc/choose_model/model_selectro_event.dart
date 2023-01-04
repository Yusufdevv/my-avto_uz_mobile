part of 'model_selectro_bloc.dart';

abstract class ModelSelectorEvent extends Equatable {
  const ModelSelectorEvent();
}

class SelectedModelItemEvent extends ModelSelectorEvent {
  final int id;
  final String name;
  const SelectedModelItemEvent({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

class ConfirmModelOption extends ModelSelectorEvent {
  @override
  List<Object?> get props => [];
}

class RevertModelOption extends ModelSelectorEvent {
  const RevertModelOption();

  @override
  List<Object?> get props => [];
}
