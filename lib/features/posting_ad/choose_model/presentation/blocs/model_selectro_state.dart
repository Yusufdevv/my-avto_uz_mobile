part of 'model_selectro_bloc.dart';

 class ModelSelectorState extends Equatable {
  final int selectedId;
  final int  confirmId;

  const ModelSelectorState({required this.selectedId, required this.confirmId});

  ModelSelectorState copyWith({
  int? selectedId,
   int? confirmId
 }) => ModelSelectorState(selectedId: selectedId ?? this.selectedId, confirmId: confirmId ?? this.confirmId);
  @override
  List<Object?> get props => [selectedId, confirmId];
}

