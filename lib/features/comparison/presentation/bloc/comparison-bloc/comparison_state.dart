part of 'comparison_bloc.dart';

class ComparisonState extends Equatable {
  final List<ComparisonEntity> cars;
  final bool onlyDifferences;
  final FormzStatus statuss;
  final bool isSticky;
  final MakeEntity? selectedMake;
  final MakeEntity? selectedModel;
  const ComparisonState({
    required this.cars,
    required this.onlyDifferences,
    required this.isSticky,
    required this.statuss,
    this.selectedMake,
    this.selectedModel,
  });
  ComparisonState copyWith({
    List<ComparisonEntity>? cars,
    bool? onlyDifferences,
    bool? isSticky,
    FormzStatus? status,
    MakeEntity? selectedModel,
    MakeEntity? selectedMake,
  }) =>
      ComparisonState(
        cars: cars ?? this.cars,
        onlyDifferences: onlyDifferences ?? this.onlyDifferences,
        isSticky: isSticky ?? this.isSticky,
        statuss: status ?? this.statuss,
        selectedMake: selectedMake ?? this.selectedMake,
        selectedModel: selectedModel ?? this.selectedModel,
      );
  @override
  List<Object?> get props =>
      [statuss, cars, onlyDifferences, isSticky, selectedMake, selectedModel];
}
