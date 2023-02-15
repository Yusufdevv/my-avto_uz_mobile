part of 'car_type_selector_bloc.dart';

class CarModelSelectorState extends Equatable {
  final int selectedModelId;
  final FormzStatus status;
  final String? searchPattern;
  final List<MakeEntity> models;

  const CarModelSelectorState({
    required this.selectedModelId,
    required this.status,
    this.searchPattern,
    this.models = const [],
  });

  CarModelSelectorState copyWith({
    String? searchPattern,
    int? selectedModelId,
    FormzStatus? status,
    List<MakeEntity>? models,
  }) =>
      CarModelSelectorState(
          searchPattern: searchPattern ?? this.searchPattern,
          models: models ?? this.models,
          status: status ?? this.status,
          selectedModelId: selectedModelId ?? this.selectedModelId);
  @override
  List<Object?> get props => [selectedModelId, status, models, searchPattern];
}
