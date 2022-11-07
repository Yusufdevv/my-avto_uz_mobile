part of 'car_type_selector_bloc.dart';

class CarTypeSelectorState extends Equatable {
  final int selectedId;

  const CarTypeSelectorState({required this.selectedId});

  CarTypeSelectorState copyWith({
    int? selectedId,
    int? confirmId,
  }) =>
      CarTypeSelectorState(selectedId: selectedId ?? this.selectedId);
  @override
  List<Object?> get props => [selectedId];
}
