part of 'model_selectro_bloc.dart';

abstract class ModelSelectorEvent extends Equatable {
  const ModelSelectorEvent();
}


class SelectedModelItemEvent extends ModelSelectorEvent{
  final int id;
  const SelectedModelItemEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class ConfirmModelOption extends ModelSelectorEvent{

  @override
  List<Object?> get props => [];

}
class RevertModelOption extends ModelSelectorEvent{

  const RevertModelOption();

  @override
  List<Object?> get props => [];

}