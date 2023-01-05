part of 'model_selectro_bloc.dart';

class ModelSelectorState extends Equatable {
  final int selectedId;
  final int confirmId;
  final String name;

  const ModelSelectorState(
      {required this.selectedId, required this.confirmId, required this.name});

  ModelSelectorState copyWith(
          {int? selectedId, int? confirmId, String? name}) =>
      ModelSelectorState(
          selectedId: selectedId ?? this.selectedId,
          confirmId: confirmId ?? this.confirmId,
          name: name ?? this.name);
  @override
  List<Object?> get props => [selectedId, confirmId];
}
