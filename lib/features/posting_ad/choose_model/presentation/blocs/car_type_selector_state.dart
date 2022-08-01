part of 'car_type_selector_bloc.dart';

class CarTypeSelectorState extends Equatable {
  final int selectedId;
  final int confirmId;

  const CarTypeSelectorState({required this.confirmId, required this.selectedId});

  CarTypeSelectorState copyWith({
  int? selectedId,
    int? confirmId,
}) => CarTypeSelectorState(confirmId: confirmId ?? this.confirmId, selectedId: selectedId ?? this.selectedId);
  @override
  List<Object?> get props =>  [selectedId, confirmId];
}

